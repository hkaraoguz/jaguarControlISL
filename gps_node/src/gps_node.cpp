#include <ros/ros.h>
#include "../msg_gen/cpp/include/gps_node/GPSFix.h"
#include "../msg_gen/cpp/include/gps_node/GPSStatus.h"
//#include <gps_common/GPSFix.h>
//#include <gps_common/GPSStatus.h>
#include <sensor_msgs/NavSatFix.h>
#include <sensor_msgs/NavSatStatus.h>
#include <libgpsmm.h>

#include "tcpclient.h"

using namespace gps_node;
using namespace sensor_msgs;

//! Macro for defining an exception with a given parent (std::runtime_error should be top parent)
#define DEF_EXCEPTION(name, parent) \
class name  : public parent { \
public: \
  name(const char* msg) : parent(msg) {} \
}
/*
//! A standard Hokuyo exception
DEF_EXCEPTION(Exception, std::runtime_error);

//! An exception for use when a timeout is exceeded
DEF_EXCEPTION(TimeoutException, Exception);

//! An exception for use when data is corrupted
DEF_EXCEPTION(CorruptedDataException, Exception);

//! An exception for use when the timestamp on the data is repeating (a good indicator something has gone wrong)
DEF_EXCEPTION(RepeatedTimeException, Exception);

#undef DEF_EXCEPTION
*/

class Exception  : public std::runtime_error {
public:
Exception(const char* msg) : std::runtime_error(msg) {}
};



class GPSDClient {
  public:
    GPSDClient() : privnode("~"), gpsm(NULL), use_gps_time(true), check_fix_by_variance(true) {}

    bool start() {
      gps_fix_pub = node.advertise<GPSFix>("extended_fix", 1);
      navsat_fix_pub = node.advertise<NavSatFix>("fix", 1);

      privnode.getParam("use_gps_time", use_gps_time);
      privnode.getParam("check_fix_by_variance", check_fix_by_variance);

      std::string host = "192.168.0.61";
      int port = 10002;
      //privnode.getParam("host", host);
      //privnode.getParam("port", port);

      char port_s[12];
      snprintf(port_s, 12, "%d", port);

      gps_data_t *resp = NULL;

#if GPSD_API_MAJOR_VERSION >= 5
      gpsm = new gpsmm(host.c_str(), port_s);
      resp = gpsm->stream(WATCH_ENABLE);
#elif GPSD_API_MAJOR_VERSION == 4
      gps = new gpsmm();
      gps->open(host.c_str(), port_s);
      resp = gps->stream(WATCH_ENABLE);
#else
      gps = new gpsmm();
      resp = gps->open(host.c_str(), port_s);
      gps->query("w\n");
#endif

      if (resp == NULL) {
        ROS_ERROR("Failed to open GPSd");
        return false;
      }

      ROS_INFO("GPSd opened");
      return true;
    }

    void step() {
#if GPSD_API_MAJOR_VERSION >= 5
      if (!gpsm->waiting(1e6))
        return;

      gps_data_t *p = gpsm->read();
      //gps_data_t *p = gpsm->data()();
      //D
#else
      gps_data_t *p = gps->poll();
#endif
      process_data(p);
    }

    void stop() {
      // gpsmm doesn't have a close method? OK ...
    }

  private:
    ros::NodeHandle node;
    ros::NodeHandle privnode;
    ros::Publisher gps_fix_pub;
    ros::Publisher navsat_fix_pub;
    gpsmm *gpsm;

    bool use_gps_time;
    bool check_fix_by_variance;

    void process_data(struct gps_data_t* p) {
      if (p == NULL)
        return;

      if (!p->online)
        return;
      printf("TAG: %s\n",p->tag);
      process_data_gps(p);
      process_data_navsat(p);
    }


#if GPSD_API_MAJOR_VERSION >= 4
#define SATS_VISIBLE p->satellites_visible
#elif GPSD_API_MAJOR_VERSION == 3
#define SATS_VISIBLE p->satellites
#else
#error "gpsd_client only supports gpsd API versions 3+"
#endif

    void process_data_gps(struct gps_data_t* p) {
      ros::Time time = ros::Time::now();

      GPSFix fix;
      GPSStatus status;

      status.header.stamp = time;
      fix.header.stamp = time;

      //printf("satellites_used %d", p->satellites_used);
      //printf("p->satellites_visible %d", p->satellites_visible);

      status.satellites_used = p->satellites_used;

      status.satellite_used_prn.resize(status.satellites_used);
      for (int i = 0; i < status.satellites_used; ++i) {
        status.satellite_used_prn[i] = p->used[i];
      }

      status.satellites_visible = SATS_VISIBLE;

      status.satellite_visible_prn.resize(status.satellites_visible);
      status.satellite_visible_z.resize(status.satellites_visible);
      status.satellite_visible_azimuth.resize(status.satellites_visible);
      status.satellite_visible_snr.resize(status.satellites_visible);

      for (int i = 0; i < SATS_VISIBLE; ++i) {
        status.satellite_visible_prn[i] = p->PRN[i];
        status.satellite_visible_z[i] = p->elevation[i];
        status.satellite_visible_azimuth[i] = p->azimuth[i];
        status.satellite_visible_snr[i] = p->ss[i];
      }

      if ((p->status & STATUS_FIX) && !(check_fix_by_variance && isnan(p->fix.epx)))
      {
        status.status = 0; // FIXME: gpsmm puts its constants in the global
                           // namespace, so `GPSStatus::STATUS_FIX' is illegal.

        if (p->status & STATUS_DGPS_FIX)
          status.status |= 18; // same here

        fix.time = p->fix.time;
        fix.latitude = p->fix.latitude;
        fix.longitude = p->fix.longitude;
        fix.altitude = p->fix.altitude;
        fix.track = p->fix.track;
        fix.speed = p->fix.speed;
        fix.climb = p->fix.climb;

#if GPSD_API_MAJOR_VERSION > 3
        fix.pdop = p->dop.pdop;
        fix.hdop = p->dop.hdop;
        fix.vdop = p->dop.vdop;
        fix.tdop = p->dop.tdop;
        fix.gdop = p->dop.gdop;
#else
        fix.pdop = p->pdop;
        fix.hdop = p->hdop;
        fix.vdop = p->vdop;
        fix.tdop = p->tdop;
        fix.gdop = p->gdop;
#endif

        fix.err = p->epe;
        fix.err_vert = p->fix.epv;
        fix.err_track = p->fix.epd;
        fix.err_speed = p->fix.eps;
        fix.err_climb = p->fix.epc;
        fix.err_time = p->fix.ept;

        /* TODO: attitude */
      } else {
      	status.status = -1; // STATUS_NO_FIX
      }

      fix.status = status;

      gps_fix_pub.publish(fix);
    }

    void process_data_navsat(struct gps_data_t* p) {
      NavSatFixPtr fix(new NavSatFix);

      /* TODO: Support SBAS and other GBAS. */

      if (use_gps_time)
        ;//fix->header.stamp = ros::Time(p->fix.time);
      else
        fix->header.stamp = ros::Time::now();

      /* gpsmm pollutes the global namespace with STATUS_,
       * so we need to use the ROS message's integer values
       * for status.status
       */
      switch (p->status) {
        case STATUS_NO_FIX:
          fix->status.status = -1; // NavSatStatus::STATUS_NO_FIX;
          break;
        case STATUS_FIX:
          fix->status.status = 0; // NavSatStatus::STATUS_FIX;
          break;
        case STATUS_DGPS_FIX:
          fix->status.status = 2; // NavSatStatus::STATUS_GBAS_FIX;
          break;
      }

      fix->status.service = NavSatStatus::SERVICE_GPS;

      fix->latitude = p->fix.latitude;
      fix->longitude = p->fix.longitude;
      fix->altitude = p->fix.altitude;

      /* gpsd reports status=OK even when there is no current fix,
       * as long as there has been a fix previously. Throw out these
       * fake results, which have NaN variance
       */
      if (isnan(p->fix.epx) && check_fix_by_variance) {
        return;
      }

      fix->position_covariance[0] = p->fix.epx;
      fix->position_covariance[4] = p->fix.epy;
      fix->position_covariance[8] = p->fix.epv;

      fix->position_covariance_type = NavSatFix::COVARIANCE_TYPE_DIAGONAL_KNOWN;

      navsat_fix_pub.publish(fix);
    }
};

class GPSDClient2 {
  public:
  GPSDClient2() : privnode("~"), gpsm(NULL), use_gps_time(true), check_fix_by_variance(true) {}

    bool start() {
      gps_fix_pub = node.advertise<GPSFix>("extended_fix", 1);
      navsat_fix_pub = node.advertise<NavSatFix>("fix", 1);

      privnode.getParam("use_gps_time", use_gps_time);
      privnode.getParam("check_fix_by_variance", check_fix_by_variance);

      std::string host = "192.168.0.61";
      int port = 10002;
      //privnode.getParam("host", host);
      //privnode.getParam("port", port);

      char port_s[12];
      snprintf(port_s, 12, "%d", port);

      gps_data_t *resp = NULL;

      //gpsm = new gpsmm(host.c_str(), port_s);
      //resp = gpsm->stream(WATCH_ENABLE);
      if(open(host.c_str(), port) < 0)
      {
        ROS_ERROR("Failed to open GPS");
        return false;
      }

      ROS_INFO("GPSd opened");
      return true;
    }

    void step() {
      char str[1000];
      gps_data_t p;
      memset(&p, 0, sizeof(gps_data_t));

      int rsize = tcpclient_readline(&tcpclient_gps,str,100,1000);
      //process_data(p);
      if(rsize > 0)
      {
        //process_data(&p,str);
        decode_gps_data(&fix,str,rsize);
      }
    }

    void stop() {
      // gpsmm doesn't have a close method? OK ...
    }

  private:
    ros::NodeHandle node;
    ros::NodeHandle privnode;
    ros::Publisher gps_fix_pub;
    ros::Publisher navsat_fix_pub;
    gpsmm *gpsm;

    bool use_gps_time;
    bool check_fix_by_variance;
    GPSFix fix;
    void process_data(struct gps_data_t* p, char *str) {
      if (p == NULL)
        return;



      //process_data_gps(p,str);
      //process_data_navsat(p, str);
    }


#if GPSD_API_MAJOR_VERSION >= 4
#define SATS_VISIBLE p->satellites_visible
#elif GPSD_API_MAJOR_VERSION == 3
#define SATS_VISIBLE p->satellites
#else
#error "gpsd_client only supports gpsd API versions 3+"
#endif

    void process_data_gps(struct gps_data_t* p, char *str) {
      ros::Time time = ros::Time::now();

      GPSFix fix;
      GPSStatus status;

      status.header.stamp = time;
      fix.header.stamp = time;

      //printf("satellites_used %d", p->satellites_used);
      //printf("p->satellites_visible %d", p->satellites_visible);

      status.satellites_used = p->satellites_used;

      status.satellite_used_prn.resize(status.satellites_used);
      for (int i = 0; i < status.satellites_used; ++i) {
        status.satellite_used_prn[i] = p->used[i];
      }

      status.satellites_visible = SATS_VISIBLE;

      status.satellite_visible_prn.resize(status.satellites_visible);
      status.satellite_visible_z.resize(status.satellites_visible);
      status.satellite_visible_azimuth.resize(status.satellites_visible);
      status.satellite_visible_snr.resize(status.satellites_visible);

      for (int i = 0; i < SATS_VISIBLE; ++i) {
        status.satellite_visible_prn[i] = p->PRN[i];
        status.satellite_visible_z[i] = p->elevation[i];
        status.satellite_visible_azimuth[i] = p->azimuth[i];
        status.satellite_visible_snr[i] = p->ss[i];
      }

      if ((p->status & STATUS_FIX) && !(check_fix_by_variance && isnan(p->fix.epx)))
      {
        status.status = 0; // FIXME: gpsmm puts its constants in the global
                           // namespace, so `GPSStatus::STATUS_FIX' is illegal.

        if (p->status & STATUS_DGPS_FIX)
          status.status |= 18; // same here

        fix.time = p->fix.time;
        fix.latitude = p->fix.latitude;
        fix.longitude = p->fix.longitude;
        fix.altitude = p->fix.altitude;
        fix.track = p->fix.track;
        fix.speed = p->fix.speed;
        fix.climb = p->fix.climb;

#if GPSD_API_MAJOR_VERSION > 3
        fix.pdop = p->dop.pdop;
        fix.hdop = p->dop.hdop;
        fix.vdop = p->dop.vdop;
        fix.tdop = p->dop.tdop;
        fix.gdop = p->dop.gdop;
#else
        fix.pdop = p->pdop;
        fix.hdop = p->hdop;
        fix.vdop = p->vdop;
        fix.tdop = p->tdop;
        fix.gdop = p->gdop;
#endif

        fix.err = p->epe;
        fix.err_vert = p->fix.epv;
        fix.err_track = p->fix.epd;
        fix.err_speed = p->fix.eps;
        fix.err_climb = p->fix.epc;
        fix.err_time = p->fix.ept;

        /* TODO: attitude */
      } else {
        status.status = -1; // STATUS_NO_FIX
      }

      fix.status = status;

      gps_fix_pub.publish(fix);
    }

    void process_data_navsat(struct gps_data_t* p, char *str) {
      NavSatFixPtr fix(new NavSatFix);

      /* TODO: Support SBAS and other GBAS. */

      if (use_gps_time)
        ;//fix->header.stamp = ros::Time(p->fix.time);
      else
        fix->header.stamp = ros::Time::now();

      /* gpsmm pollutes the global namespace with STATUS_,
       * so we need to use the ROS message's integer values
       * for status.status
       */
      switch (p->status) {
        case STATUS_NO_FIX:
          fix->status.status = -1; // NavSatStatus::STATUS_NO_FIX;
          break;
        case STATUS_FIX:
          fix->status.status = 0; // NavSatStatus::STATUS_FIX;
          break;
        case STATUS_DGPS_FIX:
          fix->status.status = 2; // NavSatStatus::STATUS_GBAS_FIX;
          break;
      }

      fix->status.service = NavSatStatus::SERVICE_GPS;

      fix->latitude = p->fix.latitude;
      fix->longitude = p->fix.longitude;
      fix->altitude = p->fix.altitude;

      /* gpsd reports status=OK even when there is no current fix,
       * as long as there has been a fix previously. Throw out these
       * fake results, which have NaN variance
       */
      if (isnan(p->fix.epx) && check_fix_by_variance) {
        return;
      }

      fix->position_covariance[0] = p->fix.epx;
      fix->position_covariance[4] = p->fix.epy;
      fix->position_covariance[8] = p->fix.epv;

      fix->position_covariance_type = NavSatFix::COVARIANCE_TYPE_DIAGONAL_KNOWN;

      navsat_fix_pub.publish(fix);
    }



tcpclient_t tcpclient_gps;
tcpclient_t tcpclient_imu;
int soc_gps;
int /*soc_fd*/ open(const char * tcphost, const int tcpport)
{
  soc_gps = tcpclient_open(&tcpclient_gps,tcphost, tcpport);//::open(port_name, O_RDWR | O_NONBLOCK | O_NOCTTY);



  if (soc_gps < 0)
  {
   return soc_gps;
  }

  soc_gps = tcpclient_gps.sock_desc;

  return soc_gps;
}

int tokenize(char delim, char *token,int tmaxlen, char *data, int dlen, int curPos)
{
  int tindex;
  int dindex;
  tindex = 0;
  for(dindex = curPos; dindex < dlen && tindex < tmaxlen; dindex++ )
  {

    if(data[dindex] ==  delim)
      break;
    token[tindex++] = data[dindex];
  }
  token[tindex] = 0;
  return tindex;
}

void decode_gps_data(GPSFix *fix, char *data, int dlen)
{
  static int rmc = 0, gga = 0 , gsa = 0, gsv = 0, vtg = 0, rmt = 0;



        char resToken[100][100];
        int  curPos= 0;
        int  tlen;
        int  s32_Index = 0;
        printf("\n");
        while(s32_Index < 100 && curPos < dlen)
        {
          tlen = tokenize(',',resToken[s32_Index],100,data,dlen,curPos);
          //if(tlen <= 0)
          //  break;
          //printf("token[%d]: %s\n",s32_Index,resToken[s32_Index]);
          curPos += tlen + 1;
          s32_Index++;
        }
        printf("\n");
        if (strcmp( resToken[0],"$GPRMC")== 0)
        {
          fix->rmc1UTCTime = resToken[0];
          fix->rmc2STatus = resToken[1];
          fix->rmc3Latitude = resToken[2];
          fix->rmc4LatNorS = resToken[3];
          fix->rmc5Longitude = resToken[4];
          fix->rmc6LongEorW = resToken[5];
          fix->rmc7SpeedOverGroundInKnots = resToken[6];
          fix->rmc8TrackMadeGoodDegreeTrue = resToken[7];
          fix->rmc9Date = resToken[8];
          fix->rmc10MagneticVariationDegrees = resToken[9];
          fix->rmc11MagnetEorW = resToken[10];
          fix->rmc12FAAModeIndicator = resToken[11];


          //printf("Latitude: %s%s",resToken[3],resToken[4]);
          //printf("Longitude: %s%s",resToken[5],resToken[6]);
          //printf("GPSCOG: %s",resToken[8]);
          //printf("GPSCOG: %s",resToken[7]);
          rmc++;

         /*
          s_Latitude = resToken[3] + resToken[4];
                s_Longitude = resToken[5] + resToken[6];
                s_GPSCOG = resToken[8];
                s_GPSVOG = resToken[7];
                */
        }
        else if (strcmp( resToken[0],"$GPGGA")== 0)//if(resToken[0] == _T("$GPGGA"))
        {
          fix->gga1UTC = resToken[0];
          fix->gga2Latitude = resToken[1];
          fix->gga3LatNorS = resToken[2];
          fix->gga4Longitude = resToken[3];
          fix->gga5LongEorW = resToken[4];
          fix->gga6GPSQuality = resToken[5];
          fix->gga7NumberOfSatellites = resToken[6];
          fix->gga8HorizontalDilutionOfPrescision = resToken[7];
          fix->gga9AntennaAltitudeAboveBelowMeanSeaLevel = resToken[8];
          fix->gga10UnitsOfAntennaAltitude_inMeters = resToken[9];
          fix->gga11GeoidalSeparation = resToken[10];
          fix->gga12UnitsOfGeoidalSeperation = resToken[11];
          fix->gga13AgeOfDifferentialGPSData = resToken[12];
          fix->gga14DifferentialReferenceStationID = resToken[13];


          if (strcmp( resToken[6],"0")== 0)//if (resToken[6] == _T("0"))
          {
            fix->gga6GPSQualityStatus = "Fix not avaiable";
              //s_GPSQ = _T("Fix not avaiable");
          }
          else if (strcmp( resToken[6],"1")== 0)//if (resToken[6] == _T("1"))
          {
              //s_GPSQ = _T("Non DGPS fix avaiable");
            fix->gga6GPSQualityStatus ="Non DGPS fix avaiable";
          }
          else if (strcmp( resToken[6],"2")== 0)//if (resToken[6] == _T("2"))
          {
              //s_GPSQ = _T("DGPS fix avaiable");
            fix->gga6GPSQualityStatus ="DGPS fix avaiable";
          }
          else if (strcmp( resToken[6],"6")== 0)//if (resToken[6] == _T("6"))
          {
              //s_GPSQ = _T("Estimate");
            fix->gga6GPSQualityStatus ="Estimate";
          }
          else
          {
              //s_GPSQ = _T("Fix not avaiable");
            fix->gga6GPSQualityStatus ="Fix not avaiable";
          }
          gga++;

        }
        else if (strcmp( resToken[0],"$GPGSA")== 0)//if(resToken[0] == _T("$GPGGA"))
        {
          fix->gsa1SelectionMode = resToken[0];
          fix->gsa2Mode = resToken[1];
          fix->gsa3ID1 = resToken[2];
          fix->gsa4ID2 = resToken[3];
          fix->gsa5ID3 = resToken[4];
          fix->gsa6ID4 = resToken[5];
          fix->gsa7ID5 = resToken[6];
          fix->gsa8ID6 = resToken[7];
          fix->gsa9ID7 = resToken[8];
          fix->gsa10ID8 = resToken[9];
          fix->gsa11ID9 = resToken[10];
          fix->gsa12ID10= resToken[11];
          fix->gsa13ID11 = resToken[12];
          fix->gsa14ID12 = resToken[13];
          fix->gsa15PDOP = resToken[14];
          fix->gsa16HDOP = resToken[15];
          fix->gsa17VDOP = resToken[16];


          gsa++;
        }
        else if (strcmp( resToken[0],"$GPGSV")== 0)//if(resToken[0] == _T("$GPGGA"))
        {
          fix->gsv1NumberOfGSV = resToken[0];
          fix->gsv2NumberOfMessage = resToken[0];
          fix->gsv3NumberOfStallitesInView = resToken[0];
          fix->gsv4SatellitePRNNumber = resToken[0];
          fix->gsv5ElevationDegrees = resToken[0];
          fix->gsv6AzimuthIndegries = resToken[0];
          fix->gsv7SRNin_dB = resToken[0];
          fix->gsv8MoreSatelliteInfoQuadruples = resToken[0];

          gsv++;

        }
        else if (strcmp( resToken[0],"$GPVTG")== 0)//if(resToken[0] == _T("$GPGGA"))
        {
          vtg++;
        }
        else if (strcmp( resToken[0],"$GPRMT")== 0)//if(resToken[0] == _T("$GPGGA"))
        {
          rmt++;
        }
        if(rmc && gga && gsa && gsv )
        {
          fix->lastRawData = data;
          gps_fix_pub.publish(*fix);
        }
        printf("rmc = %d, gga = %d , gsa = %d, gsv = %d, vtg = %d, rmt = %d\n",rmc, gga, gsa, gsv, vtg, rmt);

}
};

///////////////////////////////////////////////////////////////////////////////777
int main(int argc, char ** argv) {
  ros::init(argc, argv, "gpsd_client");

  GPSDClient2 client;

  if (!client.start())
  {
    printf("client start failed!");
    return -1;
  }

  while(ros::ok()) {
    try{
      ros::spinOnce();
      client.step();
    }catch(Exception e)
    {
       printf(e.what());
    }
  }


  client.stop();
}
