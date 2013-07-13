#include <ros/ros.h>
#include "../msg_gen/cpp/include/imu_node/imu.h"
//#include <gps_common/GPSStatus.h>
#include <sensor_msgs/NavSatFix.h>
#include <sensor_msgs/NavSatStatus.h>
#include "tcpclient.h"

using namespace imu_node;
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


class IMUClient {
  public:
  IMUClient() : privnode("~"), soc_imu(-1){}

    bool start() {
      imu_pub = node.advertise<imu>("imu", 1);

      std::string host = "192.168.0.61";
      int port = 10001;
      //privnode.getParam("host", host);
      //privnode.getParam("port", port);

      //--------------------------------------
      soc_imu = open(&tcpclient_imu,host.c_str(),port);

      if (soc_imu < 0) {
        ROS_ERROR("Failed to open IMU");
        return false;
      }

      ROS_INFO("IMU opened");
      return true;
    }
    int /*soc_fd*/ open(tcpclient_t *tcpclient,const char * tcphost, const int tcpport)
    {
      int soc_fd;

      soc_fd = tcpclient_open(tcpclient,tcphost, tcpport);//::open(port_name, O_RDWR | O_NONBLOCK | O_NOCTTY);



      if (soc_fd < 0)
      {
       return soc_fd;
      }

      soc_fd = tcpclient->sock_desc;

      return soc_fd;
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
    void processIMUData(char *data, int dlen)
    {
      imu imu_;

      char resToken[1024][100];
      int  curPos= 0;
      int  tlen;
      int  s32_Index = 0;

      while(s32_Index < 100 && curPos < dlen)
      {
        tlen = tokenize(',',resToken[s32_Index],100,data,dlen,curPos);

        if(tlen <= 0)
         break;
        printf("token[%d]: %s\n",s32_Index,resToken[s32_Index]);

        curPos += tlen + 1;
        s32_Index++;
      }
    /*
      if (s32_Index > 10)
      {

        imu_.accelx = atof(resToken[8]);
        imu_.accely = atof(resToken[9]);
        imu_.accelz = atof(resToken[10]);

        imu_.gyrox = atof(resToken[7]);
        imu_.gyroy = atof(resToken[5]);
        imu_.gyroz = atof(resToken[6]);

        imu_.pitch = atof(resToken[2]);
        imu_.roll = atof(resToken[1]);
        imu_.yaw = atof(resToken[3]);
        imu_pub.publish(imu_);
        printf("published!\n");
      }
      else*/ if(s32_Index > 9)
      {
        /*
         Leo Hsieh <leo.hsieh@drrobot.com> via boun.edu.tr
to:      Ramazan ARIKAN <ramazan.arikan1@boun.edu.tr>
date:    Mon, Mar 25, 2013 at 4:06 PM
subject:         RE: GPS and IMU additional support required

Hi Ramazan,


The latest IMU format like this:
"$seq,accelX,accleY,accelZ,,gyroX,gyroY,gyroZ,magnetomX, magnetomY, magnetomZ#"
"seq" is data package sequency number, value is in range: 0 ~255.
After "seq", the data are raw AD value for each sensor.
Sample data string:
"$2,9,1,255,20,40,3,235,4000,20#"
Please note the magnetic sensor will be measured every 220ms,
so if the output value is 0, means no new magnetic sensor data in this data package.
You could find more detail about how to translate the raw data from the each sensor's datasheet.
Gyro sensor: ITG3200
Acc sensor: ADXL345
Magnetometer sensor:HMC5883L
Any question, please feel free to let us know.
Best regards,
Leo Hsieh, Sales Manager
Dr. Robot Inc.*/
        imu_.accelx = atof(resToken[1]);
        imu_.accely = atof(resToken[2]);
        imu_.accelz = atof(resToken[3]);

        imu_.gyrox = atof(resToken[4]);
        imu_.gyroy = atof(resToken[5]);
        imu_.gyroz = atof(resToken[6]);

        imu_.pitch = atof(resToken[7]);
        imu_.roll = atof(resToken[8]);
        imu_.yaw = atof(resToken[9]);
        imu_.rawstr = "";
        imu_.rawstr.append(data);
        imu_.capturetime = ros::Time::now();
        /*
        printf("$");
        printf("%d,", x_accel());
        printf("%d,", y_accel());
        printf("%d,", z_accel());
        printf("%d,", x_gyro());
        printf("%d,", y_gyro());
        printf("%d,", z_gyro());
        if (ticks++ % 20 == 0) // Only once each 20 ticks, i.e. 400ms
        magnetometer();
        printf("%d,", x_mag);
        printf("%d,", y_mag);
        printf("%d", z_mag);
        printf("#\n\r");
        delay_ms(20);
         */
        imu_pub.publish(imu_);
        printf("published!\n");
      }


    }
    void step() {
      char buffer[1024];
      int rsize = tcpclient_readline(&tcpclient_imu,buffer,100,1000);
      if(rsize > 0)
      {
        for(int i = 0; i < rsize; i++)
        {
          if(buffer[i] == '\n')
            printf("\\n");
          if(buffer[i] == '\r')
                      printf("\\r");
          else
            printf("%c",buffer[i]);
        }
        printf("\n");
        processIMUData(buffer, rsize);
      }
    }

    void stop() {
      // gpsmm doesn't have a close method? OK ...
    }

  private:
    ros::NodeHandle node;
    ros::NodeHandle privnode;
    ros::Publisher imu_pub;
    ros::Publisher navsat_fix_pub;

    tcpclient_t tcpclient_imu;

    int soc_imu;
};

int main(int argc, char ** argv) {
  ros::init(argc, argv, "imu_client");

  IMUClient client;

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
