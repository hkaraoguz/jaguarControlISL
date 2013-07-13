
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

#include <drrobot_jaguarV2_player/MotorInfo.h>
#include <drrobot_jaguarV2_player/MotorInfoArray.h>
#include <drrobot_jaguarV2_player/RangeArray.h>
#include <drrobot_jaguarV2_player/Range.h>
#include <drrobot_jaguarV2_player/PowerInfo.h>
#include <drrobot_jaguarV2_player/StandardSensor.h>
#include <drrobot_jaguarV2_player/CustomSensor.h>
#include <std_msgs/Header.h>


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
    {
/*linearVel = 0;
    angularVel = 0;
    armVel = 0;*/

}

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
    
    subscriber_motorSensorSub = n.subscribe("drrobot_motor", 1,&QNode::motorSensorCallback,this);
    
    velocityPublisher = n.advertise<geometry_msgs::Twist>("drrobot_player1/drrobot_cmd_vel",1);
    
    start();

    return true;
}

/*
void clbck(const imu_node::imuConstPtr& scan)
{
   printf("acclx: %f\n",scan->accelx);
}

struct arg
{
    int init_argc;
    char** init_argv;
};
void* deneme(void *prm)
{
        arg* robot =  (arg*)prm;

        ros::init(robot->init_argc, robot->init_argv, "goget_it_laser_subscriber");
        {
                ros::NodeHandle nodeHandle;
                ros::Subscriber subscriber;
                subscriber = nodeHandle.subscribe<imu_node::imu>("/imu", 1000,clbck);
                ros::AsyncSpinner spinner(4);
                spinner.start();
                ros::waitForShutdown();
        }
        return NULL;
}*/
void QNode::callback_frontCamera(const sensor_msgs::ImageConstPtr& msg)
{
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


}
    
void QNode::motorSensorCallback(const drrobot_jaguarV2_player::MotorInfoArray::ConstPtr& msg)
    {
        int msgSize = msg->motorInfos.capacity();
        
        if (msgSize == 6)
        {
            ROS_INFO("Motor Encoder Pos: [%d, %d, %d, %d, %d, %d]", msg->motorInfos[0].encoder_pos, msg->motorInfos[1].encoder_pos, msg->motorInfos[2].encoder_pos
                     , msg->motorInfos[3].encoder_pos, msg->motorInfos[4].encoder_pos, msg->motorInfos[5].encoder_pos);
            ROS_INFO("Motor Encoder Vel: [%d, %d, %d, %d, %d, %d]", msg->motorInfos[0].encoder_vel, msg->motorInfos[1].encoder_vel, msg->motorInfos[2].encoder_vel
                     , msg->motorInfos[3].encoder_vel, msg->motorInfos[4].encoder_vel, msg->motorInfos[5].encoder_vel);
            ROS_INFO("Motor Encoder Dir: [%d, %d, %d, %d, %d, %d]", msg->motorInfos[0].encoder_dir, msg->motorInfos[1].encoder_dir, msg->motorInfos[2].encoder_dir
                     , msg->motorInfos[3].encoder_dir, msg->motorInfos[4].encoder_dir, msg->motorInfos[5].encoder_dir);
            ROS_INFO("Motor Motor Current: [%2.2f, %2.2f, %2.2f, %2.2f, %2.2f, %2.2f]", msg->motorInfos[0].motor_current, msg->motorInfos[1].motor_current, msg->motorInfos[2].motor_current
                     , msg->motorInfos[3].motor_current, msg->motorInfos[4].motor_current, msg->motorInfos[5].motor_current);
            ROS_INFO("Motor Motor_PWM: [%d, %d, %d, %d, %d, %d]", msg->motorInfos[0].motor_pwm, msg->motorInfos[1].motor_pwm, msg->motorInfos[2].motor_pwm
                     , msg->motorInfos[3].motor_pwm, msg->motorInfos[4].motor_pwm, msg->motorInfos[5].motor_pwm);
        }
    
}

/*void QNode::sendVelocityCommand(float linearVel, float angularVel, float armVel)
    {
        velocityVector.linear.x = linearVel;
        
        this->velocityVector.angular.z = angularVel;
        
        this->velocityVector.linear.y = armVel;
        
        this->velocityPublisher.publish(velocityVector);
        
        
    }
    
 */   
void QNode::callback_PTZCamera(const sensor_msgs::ImageConstPtr& msg)
{

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


}
void QNode::callback_PTZStatus(axis_camera::Axis msg)
{
    Q_EMIT ptzStatus_signal(msg);

}

void QNode::callback_imu(const imu_node::imuConstPtr &imu){
    char cstr[100];
    std_msgs::String msg;
    std::stringstream ss;

    QString str;
    if(imu->yaw == 0.0)
        return;
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

            subscriber_motorSensorSub = n.subscribe("drrobot_motor", 1,&QNode::motorSensorCallback,this);
    
            velocityPublisher = n.advertise<geometry_msgs::Twist>("drrobot_player1/drrobot_cmd_vel",1);
    }
    start();

    return true;
}

void QNode::run() {

  
  

  ros::Rate loop(10);

	while(ros::ok())
	{
 		

		ros::spinOnce();

		sendVelocityCommand(velocityVector.linear.x,velocityVector.angular.z,velocityVector.linear.y); 

		loop.sleep();

	}

    
    

 velocityVector.linear.x = 0;
    this->sendVelocityCommand(0,0,0);

   // ros::AsyncSpinner spinner_(4);
  //  spinner_.start();
    ros::waitForShutdown();
    std::cout << "Ros shutdown, proceeding to close the gui." << std::endl;
    Q_EMIT rosShutdown(); // used to signal the gui for a shutdown (useful to roslaunch)

}

void QNode::sendVelocityCommand(float linearVel, float angularVel, float armVel)
{
    velocityVector.linear.x = linearVel;

    this->velocityVector.angular.z = angularVel;

    this->velocityVector.linear.y = armVel;

    this->velocityPublisher.publish(velocityVector);
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
}
