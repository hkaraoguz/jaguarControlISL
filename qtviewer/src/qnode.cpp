
/**
 * @file /src/qnode.cpp
 *
 * @brief Ros communication central!
 *
 * @date February 2011
 **/

/*****************************************************************************
** Includes
*****************************************************************************/

#include <ros/ros.h>
#include <ros/network.h>
#include <string>
#include <std_msgs/String.h>
#include <sstream>
#include "../include/imu_gps/qnode.hpp"
#include <pthread.h>
#include <stdio.h>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/LaserScan.h>

#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>

#include <time.h>
#include <QDir>

/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace imu_gps {

/*****************************************************************************
** Implementation
*****************************************************************************/

QNode::QNode(int argc, char** argv ) :
    init_argc(argc),
    init_argv(argv)
    {}

QNode::~QNode() {
    if(ros::isStarted()) {
      ros::shutdown(); // explicitly needed since we use ros::start();
      ros::waitForShutdown();
    }
    wait();
}

bool QNode::init() {

    ros::init(init_argc,init_argv,"qtnode_subscriber");
    if ( ! ros::master::check() ) {
        return false;
    }

    ros::start(); // explicitly needed since our nodehandle is going out of scope.
    ros::NodeHandle n;
    image_transport::ImageTransport it(n);

    subscriber_imu = n.subscribe("/imu", 1000,&QNode::callback_imu,this);
    subscriber_extendedfix = n.subscribe("/extended_fix", 1000,&QNode::callback_gpsfix,this);
    subscriber_fix = n.subscribe("/fix", 1000,&QNode::callback_nawsatfix,this);
    subscriber_scan = n.subscribe<sensor_msgs::LaserScan>("/scan", 1000,&QNode::callback_scan,this);
    image_transport::TransportHints hints("compressed");

    subscriber_frontCamera = it.subscribe("/axis/image_raw/", 1,&QNode::callback_frontCamera,this,hints);

    subscriber_ptzCamera = it.subscribe("/axis/image_raw_ptz/",1,&QNode::callback_PTZCamera,this,hints);

    publisher_ptz_command = n.advertise<axis_camera::Axis>("/axis/cmd",1);

    subscriber_ptzStatus = n.subscribe("axis/state",1,&QNode::callback_PTZStatus,this);

    for(int i = 0; i < QNode::STYPE_MAX; i++)
    {
        saveSingleSensorMessage[i] = false;
        sensorLastSaveTime[i] = QTime(0,0,0);
        sensorLogEnabled[i] = false;
        sensorLogMinMessagePeriodInMSec[i] = 1000;
    }

    start();

    return true;
}
void QNode::setSensorLoggingDirPath(const char *dirPath)
{
    strncpy(sensorLogDirPath, dirPath, QNode::MAX_PATH_LEN);
}

void QNode::setAllSensorLogEnabled(bool value, int minMessagePeriodInMSec)
{
    for(int i = 0; i < QNode::STYPE_MAX; i++)
    {
        sensorLogEnabled[i] = value;
        sensorLogMinMessagePeriodInMSec[i] = minMessagePeriodInMSec;
        sensorLastSaveTime[i] = QTime(0,0,0);
    }
}

void QNode::setAllSensorSaveSingleMessage()
{
    for(int i = 0; i < QNode::STYPE_MAX; i++)
    {
        saveSingleSensorMessage[i] = true;
        sensorLastSaveTime[i] = QTime(0,0,0);
    }
}

void QNode::callback_frontCamera(const sensor_msgs::ImageConstPtr& msg)
{
    //Logging
    //sensor_msgs::Image image = *msg;
    //sensorMessageWriteToFile((u_int8_t*)&image, sizeof(sensor_msgs::Image),STYPE_FRONT_CAMERA,"FRONTCAMERA");

    //cv_bridge::CvImagePtr cv_ptr;
    cv::Mat cv_ptr;
    try
    {
         cv_ptr = cv_bridge::toCvShare(msg, "bgr8")->image;
    }
    catch (cv_bridge::Exception& e)
    {
        ROS_ERROR("cv_bridge exception: %s", e.what());
        return;
    }

  //  cv::imshow("ss",cv_ptr);
    cv::Mat cpy = cv_ptr.clone();
    cv::cvtColor(cpy,cpy, CV_BGR2RGB);


    Q_EMIT frontCamera_signal(cpy);

    QImage* qimage =new QImage(cpy.data,cpy.cols,cpy.rows,cpy.step,QImage::Format_RGB888);
    if(qimage != NULL)
    {
       imageWriteToFile(qimage, STYPE_FRONT_CAMERA,"FRONTCAMERA");
       delete qimage;
    }

}
void QNode::callback_PTZCamera(const sensor_msgs::ImageConstPtr& msg)
{
    //Logging
    //sensor_msgs::Image image = *msg;
    //sensorMessageWriteToFile((u_int8_t*)&image, sizeof(sensor_msgs::Image),STYPE_PTZ_CAMERA,"PTZCAMERA");

    cv::Mat cv_ptr;
    try
    {
         cv_ptr = cv_bridge::toCvShare(msg, "bgr8")->image;
    }
    catch (cv_bridge::Exception& e)
    {
        ROS_ERROR("cv_bridge exception: %s", e.what());
        return;
    }

  //  cv::imshow("ss",cv_ptr);
    cv::Mat cpy = cv_ptr.clone();
    cv::cvtColor(cpy,cpy, CV_BGR2RGB);


    Q_EMIT ptzCamera_signal(cpy);

    QImage* qimage = new QImage(cpy.data,cpy.cols,cpy.rows,cpy.step,QImage::Format_RGB888);
    if(qimage != NULL)
    {
       imageWriteToFile(qimage, STYPE_PTZ_CAMERA,"PTZCAMERA");

       delete qimage;
    }
}
void QNode::callback_PTZStatus(axis_camera::Axis msg)
{
    sensorMessageWriteToFile((u_int8_t*)&msg, sizeof(axis_camera::Axis),STYPE_PTZ_STATUS,"PTZSTATUS");

    Q_EMIT ptzStatus_signal(msg);

}
bool QNode::imageWriteToFile(QImage* qimage, int stype, char *sensorName)
{
    if(stype >= QNode::STYPE_MAX)
    {
        return false;
    }

    if(!sensorLogEnabled[stype] && !saveSingleSensorMessage[stype])
    {
        return false;
    }

    QDir dir(sensorLogDirPath);

    if(!dir.exists())
    {
        dir.mkdir(sensorLogDirPath);
    }

    if(!dir.exists())
    {
        return false;
    }

    QTime currtime = QTime::currentTime();

    QString subDir;
    QDate currDate = QDate::currentDate();

    char cstr[100];

    sprintf(cstr, "%0.4d%0.2d%0.2d",currDate.year(),currDate.month(), currDate.day() );

    if(sensorLogDirPath[strlen(sensorLogDirPath)-1] == '/')
        subDir =  (QString)sensorLogDirPath + (QString)cstr;//QString::number(currDate.year()) +QString::number(currDate.month()) + QString::number(currDate.day());
    else
        subDir =  (QString)sensorLogDirPath + "/" + (QString)cstr;//+ QString::number(currDate.year()) +QString::number(currDate.month()) + QString::number(currDate.day());

    dir = QDir(subDir);
    if(!dir.exists())
    {
        dir.mkdir(subDir);
    }

    if(!dir.exists())
    {
        return false;
    }

    subDir = subDir + "/" + sensorName;

    dir = QDir(subDir);
    if(!dir.exists())
    {
        dir.mkdir(subDir);
    }

    if(!dir.exists())
    {
        return false;
    }

    sprintf(cstr, "%0.2d%0.2d%0.2d.png",currtime.hour(),currtime.minute(),currtime.second());

    QString filePath = subDir + "/" + (QString)cstr;
 /*   QFile file(filePath);

    if(file.exists())
        file.open(QIODevice::Append);
    else
    {
       file.open(QIODevice::WriteOnly);
    }

    if(!file.isOpen())
        return false;
*/
    if(sensorLogEnabled[stype])
    {
        if(sensorLastSaveTime[stype].msecsTo(currtime) >= sensorLogMinMessagePeriodInMSec[stype])
        {
           //logging
           //logging end!
           sensorLastSaveTime[stype] = currtime;
        }
    }
    else if(saveSingleSensorMessage[stype])
    {
       //logging
        //file.write((char*)&currtime, sizeof(QTime));
        //file.write((char*)&rawMessageLen, sizeof(rawMessageLen));
        //file.write((char*)rawMessage, rawMessageLen);
        qimage->save(filePath);
       //logging end

       sensorLastSaveTime[stype] = currtime;

       saveSingleSensorMessage[stype] = false;
    }
    return true;
}

bool QNode::sensorMessageWriteToFile(u_int8_t *rawMessage, u_int32_t rawMessageLen, int stype, char *sensorName)
{
    if(stype >= QNode::STYPE_MAX)
    {
        return false;
    }

    if(!sensorLogEnabled[stype] && !saveSingleSensorMessage[stype])
    {
        return false;
    }
    if(rawMessageLen == 0 || rawMessage == NULL)
    {
        return false;
    }
    QDir dir(sensorLogDirPath);

    if(!dir.exists())
    {
        dir.mkdir(sensorLogDirPath);
    }

    if(!dir.exists())
    {
        return false;
    }

    QTime currtime = QTime::currentTime();

    QString subDir;
    QDate currDate = QDate::currentDate();

    char cstr[100];

    sprintf(cstr, "%0.4d%0.2d%0.2d",currDate.year(),currDate.month(), currDate.day() );

    if(sensorLogDirPath[strlen(sensorLogDirPath)-1] == '/')
        subDir =  (QString)sensorLogDirPath + (QString)cstr;//QString::number(currDate.year()) +QString::number(currDate.month()) + QString::number(currDate.day());
    else
        subDir =  (QString)sensorLogDirPath + "/" + (QString)cstr;//+ QString::number(currDate.year()) +QString::number(currDate.month()) + QString::number(currDate.day());

    dir = QDir(subDir);
    if(!dir.exists())
    {
        dir.mkdir(subDir);
    }

    if(!dir.exists())
    {
        return false;
    }

    subDir = subDir + "/" + sensorName;

    dir = QDir(subDir);
    if(!dir.exists())
    {
        dir.mkdir(subDir);
    }

    if(!dir.exists())
    {
        return false;
    }

    sprintf(cstr, "H%0.2d.dat",currtime.hour());

    QString filePath = subDir + "/" + (QString)cstr;
    QFile file(filePath);

    if(file.exists())
        file.open(QIODevice::Append);
    else
    {
       file.open(QIODevice::WriteOnly);
    }

    if(!file.isOpen())
        return false;

    if(sensorLogEnabled[stype])
    {
        if(sensorLastSaveTime[stype].msecsTo(currtime) >= sensorLogMinMessagePeriodInMSec[stype])
        {
           //logging
           file.write((char*)&currtime, sizeof(QTime));
           file.write((char*)&rawMessageLen, sizeof(rawMessageLen));
           file.write((char*)rawMessage, rawMessageLen);
           //logging end!
           sensorLastSaveTime[stype] = currtime;
        }
    }
    else if(saveSingleSensorMessage[stype])
    {
       //logging
        file.write((char*)&currtime, sizeof(QTime));
        file.write((char*)&rawMessageLen, sizeof(rawMessageLen));
        file.write((char*)rawMessage, rawMessageLen);
       //logging end

       sensorLastSaveTime[stype] = currtime;

       saveSingleSensorMessage[stype] = false;
    }
    return true;
}

void QNode::callback_imu(const imu_node::imuConstPtr &imu){
    char cstr[100];
    std_msgs::String msg;
    std::stringstream ss;

    QString str;
    if(imu->yaw == 0.0)
        return;

    imu_node::imu imumsg = *imu;
    sensorMessageWriteToFile((u_int8_t*)&imumsg, sizeof(imu_node::imu),STYPE_IMU,"IMU");

    sprintf(cstr,"%f",imu->accelx);
    Q_EMIT imuSignal_accelX(cstr);

    sprintf(cstr,"%f",imu->accely);
    Q_EMIT imuSignal_accelY(cstr);

    sprintf(cstr,"%f",imu->accelz);
    Q_EMIT imuSignal_accelZ(cstr);

    sprintf(cstr,"%f",imu->gyrox);
    Q_EMIT imuSignal_gyroX(cstr);

    sprintf(cstr,"%f",imu->gyroy);
    Q_EMIT imuSignal_gyroY(cstr);

    sprintf(cstr,"%f",imu->gyroz);
    Q_EMIT imuSignal_gyroZ(cstr);

    sprintf(cstr,"%f",imu->pitch);
    Q_EMIT imuSignal_magnetomX(cstr);

    sprintf(cstr,"%f",imu->roll);
    Q_EMIT imuSignal_magnetomY(cstr);

    sprintf(cstr,"%f",imu->yaw);
    Q_EMIT imuSignal_magnetomZ(cstr);

    Q_EMIT imuSignal_raw(imu->rawstr.c_str());
    //accelX->setText(QApplication::translate("MainWindowDesign", cstr, 0, QApplication::UnicodeUTF8));
    //ss<< imu->accelx;
    //msg.data = ss.str();
    //str = cstr;

    //accelX->setText("str");
    //ss << "imu_raw_data " << "accelx" << imu_->accelx;
    //msg.data = ss.str();

    //log(Info,std::string("")+msg.data);
}
void QNode::callback_gpsfix(const gps_node::GPSFixConstPtr &fix)
{
    //if(fix->status.status == -1)
    //{
    gps_node::GPSFix msg = *fix;
    sensorMessageWriteToFile((u_int8_t*)&msg, sizeof(gps_node::GPSFix),STYPE_GPS,"GPS");

    Q_EMIT gpsSignal_quality(fix->gga6GPSQualityStatus.c_str());
    Q_EMIT gpsSignal_latitude((fix->rmc3Latitude + fix->rmc4LatNorS).c_str());
    Q_EMIT gpsSignal_longtitude((fix->rmc5Longitude + fix->rmc6LongEorW).c_str());
    Q_EMIT gpsSignal_cog(fix->rmc7SpeedOverGroundInKnots.c_str());
    Q_EMIT gpsSignal_vog(fix->rmc8TrackMadeGoodDegreeTrue.c_str());
     //   return;
    //}

    Q_EMIT gpsSignal_raw(fix->lastRawData.c_str());
}

void QNode::callback_nawsatfix(const sensor_msgs::NavSatFixConstPtr &fix)
{


}

void QNode::callback_scan(const sensor_msgs::LaserScanConstPtr& scan)
{
  sensor_msgs::LaserScan msg = *scan;

  sensorMessageWriteToFile((u_int8_t*)&msg, sizeof(sensor_msgs::LaserScan),STYPE_LASER,"LASER");

  Q_EMIT scanSignal(*scan);
  //  Q_EMIT gpsSignal_raw("SCAN");
}

bool QNode::init(const std::string &master_url, const std::string &host_url) {

    ros::init(init_argc,init_argv, "imu_subscriber");
    {
            ros::NodeHandle n;
            subscriber_imu = n.subscribe("/imu", 1000,&QNode::callback_imu,this);
            subscriber_extendedfix = n.subscribe("/extended_fix", 1000,&QNode::callback_gpsfix,this);
            subscriber_fix = n.subscribe("/fix", 1000,&QNode::callback_nawsatfix,this);
            subscriber_scan = n.subscribe<sensor_msgs::LaserScan>("/scan", 1000,&QNode::callback_scan,this);
    }
    start();

    return true;
}

void QNode::run() {

    ros::Rate loop(10);
    ros::spin();

   // ros::AsyncSpinner spinner_(4);
  //  spinner_.start();
    ros::waitForShutdown();
    std::cout << "Ros shutdown, proceeding to close the gui." << std::endl;
    Q_EMIT rosShutdown(); // used to signal the gui for a shutdown (useful to roslaunch)

}
void QNode::log( const LogLevel &level, const std::string &msg) {
    logging_model.insertRows(logging_model.rowCount(),1);
    std::stringstream logging_model_msg;
    switch ( level ) {
        case(Debug) : {
                ROS_DEBUG_STREAM(msg);
                logging_model_msg << "[DEBUG] [" << ros::Time::now() << "]: " << msg;
                break;
        }
        case(Info) : {
                ROS_INFO_STREAM(msg);
                logging_model_msg << "[INFO] [" << ros::Time::now() << "]: " << msg;
                break;
        }
        case(Warn) : {
                ROS_WARN_STREAM(msg);
                logging_model_msg << "[INFO] [" << ros::Time::now() << "]: " << msg;
                break;
        }
        case(Error) : {
                ROS_ERROR_STREAM(msg);
                logging_model_msg << "[ERROR] [" << ros::Time::now() << "]: " << msg;
                break;
        }
        case(Fatal) : {
                ROS_FATAL_STREAM(msg);
                logging_model_msg << "[FATAL] [" << ros::Time::now() << "]: " << msg;
                break;
        }
    }
    QVariant new_row(QString(logging_model_msg.str().c_str()));
    logging_model.setData(logging_model.index(logging_model.rowCount()-1),new_row);
    Q_EMIT loggingUpdated(); // used to readjust the scrollbar
}
}/*end of namespace imu_gps*/
