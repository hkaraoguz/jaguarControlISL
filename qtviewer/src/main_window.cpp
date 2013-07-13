/**
 * @file /src/main_window.cpp
 *
 * @brief Implementation for the qt gui.
 *
 * @date February 2011
 **/
/*****************************************************************************
** Includes
*****************************************************************************/

#include <QtGui>
#include <QMessageBox>
#include <iostream>
#include "../include/imu_gps/main_window.hpp"
#include <QGraphicsScene>
#include <QPainter>
#include <QStyleOption>

#include <math.h>

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <time.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <math.h>
#include <axis_camera/Axis.h>
#include <QDir>

/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace imu_gps {

using namespace Qt;



 static const double Pi = 3.14159265358979323846264338327950288419717;
 static double TwoPi = 2.0 * Pi;

 static qreal normalizeAngle(qreal angle)
 {
     while (angle < 0)
         angle += TwoPi;
     while (angle > TwoPi)
         angle -= TwoPi;
     return angle;
 }

 ScanWiew::ScanWiew()
     : angle(0), speed(0), mouseEyeDirection(0),
       color(qrand() % 256, qrand() % 256, qrand() % 256),pointCnt(0),
       laserRangeInMeter(30),arcDistanceInPixels(50),arcDistanceInMeter(5.0),startAngle(-140.0),endAngle(140.0),angleDelta(10.0)
 {
  //   //setRotation(qrand() % (360 * 16));
     g_line_map.first = NULL;
     g_line_map.last = NULL;
 }

 QRectF ScanWiew::boundingRect() const
 {
     double sizeInPixels = (laserRangeInMeter/arcDistanceInMeter)*arcDistanceInPixels+50;
     return QRectF(-sizeInPixels, -sizeInPixels,
                  sizeInPixels*2, sizeInPixels*2);
 }

 QPainterPath ScanWiew::shape() const
 {
     QPainterPath path;
     //path.addRect(-100, -200, 200, 40);
     return path;
 }

 void ScanWiew::paint(QPainter *painter, const QStyleOptionGraphicsItem *, QWidget *)
 {

     QColor cred(255,0,0);
     QColor cgreen(0,100,0);
      QColor cgreen2(0,150,0);
     QColor cblue(0,0,255);

     QPen pred(cred);
     QPen pgreen(cgreen);
     QPen pgreen2(cgreen2);
     QPen pblue(cblue);

     painter->setPen(pgreen);

     //QFont fcnew("Coruier new", 10, QFont::Normal);
     QFontMetrics fm(painter->font());

     int pixelsHeight = fm.height();
     int lineCnt = laserRangeInMeter/arcDistanceInMeter;

     for(int i = 1; i <= lineCnt; i++)
     {

         QRectF rectangle(-(i*arcDistanceInPixels), -(i*arcDistanceInPixels), i*2*arcDistanceInPixels,i*2*arcDistanceInPixels);
         int spanAngle = endAngle - startAngle+5;

         painter->drawArc(rectangle, ((int)startAngle+90-5)*16, (spanAngle+5)*16);

         int x = -::sin((startAngle-5)*TwoPi/360)*(i*arcDistanceInPixels);
         int y = -::cos((startAngle-5)*TwoPi/360)*(i*arcDistanceInPixels);


         char str[100];
         sprintf(str,"%d",i*(int)arcDistanceInMeter);
         int pixelsWide = fm.width(str);
         QPoint ptl(x-pixelsWide,y);
         QPoint pbr(x,y+pixelsHeight);
         QRect rt(ptl,pbr);

         painter->drawText(rt, Qt::AlignCenter, (QString)(str));

         x = -::sin((endAngle+5)*TwoPi/360)*(i*arcDistanceInPixels);
         y = -::cos((endAngle+5)*TwoPi/360)*(i*arcDistanceInPixels);


         QPoint ptl1(x,y);
         QPoint pbr1(x+pixelsWide,y+pixelsHeight);
         QRect rt1(ptl1,pbr1);
         painter->drawText(rt1, Qt::AlignCenter, (QString)(str));

     }


     lineCnt = (endAngle - startAngle)/angleDelta;
     double ang = startAngle;

     int distance = (laserRangeInMeter/arcDistanceInMeter)*arcDistanceInPixels;

     for(int i = 0; i <= lineCnt ; i++)
     {
         painter->setPen(pgreen);
         int x = -::sin(ang*TwoPi/360)*(distance+5);
         int y = -::cos(ang*TwoPi/360)*(distance+5);
         painter->drawLine(0,0,x,y);

         char str[100];
         sprintf(str,"%d",(int)ang);
         int pixelsWide = fm.width(str);


         x = -::sin(ang*TwoPi/360)*(distance+20);
         y = -::cos(ang*TwoPi/360)*(distance+20);

         QPoint ptl(x-pixelsWide/2,y - pixelsHeight/2);
         QPoint pbr(x+pixelsWide/2,y+pixelsHeight/2);
         QRect rt(ptl,pbr);
         painter->drawText(rt, Qt::AlignCenter, (QString)(str));

         ang += angleDelta;
     }

     double olcek =  arcDistanceInPixels/arcDistanceInMeter;
     //printf("olcek: %f\n",olcek);
     pgreen.setWidth(pgreen.width()+2);
     painter->setPen(pgreen2);
     for(int i = 0; i < pointCnt; i++)
     {
         painter->drawLine(0,0,-plist[i].y*olcek,-plist[i].x*olcek);
     }

      painter->setPen(pred);
     plinel_t *root = g_line_map.first;

     while(root != NULL)
     {
        if(root->line.length > 0.05 && root->point_cnt > 3 )//MIN_LENGTH_LINE_TO_SEND)
        {
           painter->drawLine(-root->line.sp.y*olcek,-root->line.sp.x*olcek,-root->line.ep.y*olcek,-root->line.ep.x*olcek);
        }
        root = root->next;
     }
 }
 void ScanWiew::setRange(double range){ laserRangeInMeter = range;}
 void ScanWiew::setArcDistanceInMeter(double dist){ arcDistanceInMeter = dist;}
 void ScanWiew::setArcDistanceInPixels(double dist){arcDistanceInPixels = dist;}
 void ScanWiew::setStartAngle(double angle){startAngle = angle;}
 void ScanWiew::setStopAngle(double angle){endAngle = angle;}
 void ScanWiew::setDeltaAngle(double angle){angleDelta = angle;}
 void ScanWiew::advance(int step)
 {
 }
 void ScanWiew::convertDistanceToCoordinate(float *dist, int size, double angle_min, double angle_increment)
 {

     double angle =  angle_min;
     int i;
     if(g_line_map.first != NULL)
          lrf_delete_plinel(g_line_map.first);
     g_line_map.first  = NULL;
     g_line_map.last = NULL;
     pointCnt = 0;
     for( i = 0; i < size  && i < MAX_POINT; i++)
     {
       //printf("dist[%d] = %f\n",i,dist[i]);
       plist[pointCnt].x = cos(angle)*dist[i];
       plist[pointCnt].y = sin(angle)*dist[i];
       if((plist[pointCnt].x <= 32.0 && plist[pointCnt].x >= -32.0) &&
           (plist[pointCnt].y <= 32.0 || plist[pointCnt].y >= -32.0))
       {
         nlrf_add_point(&g_line_map,angle,plist[pointCnt].x,plist[pointCnt].y,dist[i], 0.1);
         pointCnt++;
       }
       angle += angle_increment;

     }

     nlrf_split(&g_line_map,0.02);
 }
/*****************************************************************************
** Implementation [MainWindow]
*****************************************************************************/

MainWindow::MainWindow(int argc, char** argv, QWidget *parent)
	: QMainWindow(parent)
    , qnode(argc,argv)
    ,timer()
    ,scene()
    //, gps(argc,argv)
{
	ui.setupUi(this); // Calling this incidentally connects all ui's triggers to on_...() callbacks in this class.
    QObject::connect(ui.actionAbout_Qt, SIGNAL(triggered(bool)), qApp, SLOT(aboutQt())); // qApp is a global variable for the application

    ReadSettings();
	setWindowIcon(QIcon(":/images/icon.png"));
	ui.tab_manager->setCurrentIndex(0); // ensure the first tab is showing - qt-designer should have this already hardwired, but often loses it (settings?).
    QObject::connect(&qnode, SIGNAL(rosShutdown()), this, SLOT(close()));
    //QObject::connect(&gps, SIGNAL(rosShutdown()), this, SLOT(close()));
	/*********************
	** Logging
	**********************/
	ui.view_logging->setModel(qnode.loggingModel());
    QObject::connect(&qnode, SIGNAL(loggingUpdated()), this, SLOT(updateLoggingView()));

    //Mesaj detayları
    //QImuMesajEditGrup egrup;


     ui.viewFrontCamera->setSizePolicy(QSizePolicy::Ignored, QSizePolicy::Ignored);
     ui.viewFrontCamera->setScaledContents(true);

     ui.viewPTZCamera->setSizePolicy(QSizePolicy::Ignored, QSizePolicy::Ignored);
     ui.viewPTZCamera->setScaledContents(true);


    QObject::connect(&qnode,SIGNAL(imuSignal_accelX(QString)),ui.lineAccelX,SLOT(setText(QString)));

    QObject::connect(&qnode,SIGNAL(imuSignal_accelY(QString)),ui.lineAccelY,SLOT(setText(QString)));
    QObject::connect(&qnode,SIGNAL(imuSignal_accelZ(QString)),ui.lineAccelZ,SLOT(setText(QString)));

    QObject::connect(&qnode,SIGNAL(imuSignal_gyroX(QString)),ui.lineGyroX,SLOT(setText(QString)));
    QObject::connect(&qnode,SIGNAL(imuSignal_gyroY(QString)),ui.lineGyroY,SLOT(setText(QString)));
    QObject::connect(&qnode,SIGNAL(imuSignal_gyroZ(QString)),ui.lineGyroZ,SLOT(setText(QString)));
    QObject::connect(&qnode,SIGNAL(imuSignal_magnetomX(QString)),ui.lineMagnetomX,SLOT(setText(QString)));
    QObject::connect(&qnode,SIGNAL(imuSignal_magnetomY(QString)),ui.lineMagnetomY,SLOT(setText(QString)));
    QObject::connect(&qnode,SIGNAL(imuSignal_magnetomZ(QString)),ui.lineMagnetomZ,SLOT(setText(QString)));
    QObject::connect(&qnode,SIGNAL(imuSignal_raw(QString)),ui.lineIMURaw,SLOT(setText(QString)));


    QObject::connect(&qnode,SIGNAL(gpsSignal_raw(QString)),ui.lineGPSRaw,SLOT(setText(QString)));
    QObject::connect(&qnode,SIGNAL(gpsSignal_latitude(QString)),ui.lineLatitude,SLOT(setText(QString)));
    QObject::connect(&qnode,SIGNAL(gpsSignal_longtitude(QString)),ui.lineLongtitude,SLOT(setText(QString)));
    QObject::connect(&qnode,SIGNAL(gpsSignal_cog(QString)),ui.lineGPSCOG,SLOT(setText(QString)));
    QObject::connect(&qnode,SIGNAL(gpsSignal_vog(QString)),ui.lineGPSVOG,SLOT(setText(QString)));
    QObject::connect(&qnode,SIGNAL(gpsSignal_quality(QString)),ui.lineGPSQuality,SLOT(setText(QString)));
    qRegisterMetaType<sensor_msgs::LaserScan>("sensor_msgs::LaserScan");
    QObject::connect(&qnode,SIGNAL(scanSignal(const sensor_msgs::LaserScan)),this,SLOT(updateScan(sensor_msgs::LaserScan)));


    qRegisterMetaType<cv::Mat>("cv::Mat");
    QObject::connect(&qnode,SIGNAL(frontCamera_signal(cv::Mat)),this,SLOT(getFrontCameraImage(cv::Mat)));
    QObject::connect(&qnode,SIGNAL(ptzCamera_signal(cv::Mat)),this,SLOT(getPTZCameraImage(cv::Mat)));

     qRegisterMetaType<axis_camera::Axis>("axis_camera::Axis");
     QObject::connect(&qnode,SIGNAL(ptzStatus_signal(axis_camera::Axis)),this,SLOT(getPTZCameraStatus(axis_camera::Axis)));


    QObject::connect(ui.buttonPTZPan,SIGNAL(clicked()),this,SLOT(button_PTZPan_clicked()));

    QObject::connect(ui.buttonPTZTilt,SIGNAL(clicked()),this,SLOT(button_PTZTilt_clicked()));

    /*********************
    ** Auto Start
    **********************/
    if ( ui.checkbox_remember_settings->isChecked() ) {
        on_button_connect_clicked(true);
    }

    ////////////////////////////////////////////////////////////////////////
    qsrand(QTime(0,0,0).secsTo(QTime::currentTime()));

    scene.setSceneRect(-1600,-1600, 3200, 3200);
    scene.setItemIndexMethod(QGraphicsScene::NoIndex);


    scanview = new ScanWiew();
    scanview->setPos(0,0);
    scene.addItem(scanview);
    /*
    for (int i = 0; i < MouseCount; ++i) {
        ScanWiew *mouse = new ScanWiew;
        mouse->setPos(::sin((i * 6.28) / MouseCount) * 200,
                      ::cos((i * 6.28) / MouseCount) * 200);
        scene.addItem(mouse);
    }*/

   // QGraphicsView view(&scene);
    ui.graphicsView->setScene(&scene);
    ui.graphicsView->setRenderHint(QPainter::Antialiasing);
    QColor  color( 0, 0, 0);
    ui.graphicsView->setBackgroundBrush(color);//QPixmap(":/images/cheese.jpg"));
    ui.graphicsView->setCacheMode(QGraphicsView::CacheBackground);
    ui.graphicsView->setViewportUpdateMode(QGraphicsView::BoundingRectViewportUpdate);
    ui.graphicsView->setDragMode(QGraphicsView::ScrollHandDrag);

#if defined(Q_WS_S60) || defined(Q_WS_MAEMO_5) || defined(Q_WS_SIMULATOR)
    ui.graphicsView->showMaximized();
#else
    //ui.graphicsView.resize(400, 300);
    //view.show();
#endif


    //QObject::connect(&timer, SIGNAL(timeout()), &scene, SLOT(advance()));
    QObject::connect(this, SIGNAL(sceneUpdate()), &scene, SLOT(update()));
    QObject::connect(ui.spinBox_ArcDistanceInMeter,SIGNAL(	valueChanged (int)),this,SLOT(setArcDistanceInMeter(int)));
    QObject::connect(ui.spinBox_arcDistanceInPixels,SIGNAL(	valueChanged (int)),this,SLOT(setArcDistanceInPixels(int)));
    QObject::connect(ui.spinBox_LaserRange,SIGNAL(	valueChanged (int)),this,SLOT(setRange(int)));
    //timer.start(1000 / 33);

     ui.line_log_dir_path->setText( QDir::currentPath());

     QObject::connect(ui.button_single_save,SIGNAL(clicked()),this,SLOT(button_single_save_clicked()));

     QObject::connect(ui.checkbox_enable_sensor_logging,SIGNAL(stateChanged(int)),this,SLOT(checkbox_enable_sensor_logging_changed(int)));
}
void MainWindow::setRange(int deg){ scanview->setRange(deg); Q_EMIT sceneUpdate();}
void MainWindow::setArcDistanceInMeter(int deg){ scanview->setArcDistanceInMeter(deg);Q_EMIT sceneUpdate();}
void MainWindow::setArcDistanceInPixels(int deg){ scanview->setArcDistanceInPixels(deg);Q_EMIT sceneUpdate();}
void MainWindow::setStartAngle(int deg){ scanview->setStartAngle(deg);Q_EMIT sceneUpdate();}
void MainWindow::setStopAngle(int deg){ scanview->setStopAngle(deg);Q_EMIT sceneUpdate();}
void MainWindow::setDeltaAngle(int deg){ scanview->setDeltaAngle(deg);Q_EMIT sceneUpdate();}


MainWindow::~MainWindow() {}

/*****************************************************************************
** Implementation [Slots]
*****************************************************************************/

void MainWindow::showNoMasterMessage() {
	QMessageBox msgBox;
	msgBox.setText("Couldn't find the ros master.");
	msgBox.exec();
    close();
}
void MainWindow::button_single_save_clicked()
{
    qnode.setSensorLoggingDirPath( ui.line_log_dir_path->text().toStdString().c_str());
    qnode.setAllSensorSaveSingleMessage();
}
void MainWindow::checkbox_enable_sensor_logging_changed(int state)
{
    QString interArrivalTime =  ui.line_edit_log_period->text();
    qnode.setAllSensorLogEnabled(ui.checkbox_remember_settings->isChecked(), interArrivalTime.toInt());
}

void MainWindow::button_PTZPan_clicked()
{
    axis_camera::Axis cmd;


    float pan = ui.linePTZPan->text().toFloat();

    if(pan > 180)pan = 180;
    else if(pan < -180)pan = -180;

    ui.linePTZPan->setText(QString::number((int)pan));

    cmd.brightness = 5000;
    cmd.pan = pan;
    cmd.tilt = currentPTZStatus.tilt;
    //cmd.focus = 0;
    cmd.autofocus = true;

    qnode.publisher_ptz_command.publish(cmd);

}
void MainWindow::button_PTZTilt_clicked()
{
    axis_camera::Axis cmd;

    float tilt = ui.linePTZTilt->text().toFloat();

    if(tilt > 180)tilt = 180;
    else if(tilt < -180)tilt = -180;

    ui.linePTZTilt->setText(QString::number((int)tilt));

    cmd.brightness = 5000;
    cmd.pan = currentPTZStatus.pan;
    cmd.tilt = tilt;
    //cmd.focus = 0;
    cmd.autofocus = true;

    qnode.publisher_ptz_command.publish(cmd);

}

void MainWindow::getFrontCameraImage(cv::Mat image)
{

    QImage* qimage = new QImage(image.data,image.cols,image.rows,image.step,QImage::Format_RGB888);

    ui.viewFrontCamera->setPixmap(QPixmap::fromImage(*qimage));
}

void MainWindow::getPTZCameraImage(cv::Mat image)
{

    QImage* qimage = new QImage(image.data,image.cols,image.rows,image.step,QImage::Format_RGB888);

    ui.viewPTZCamera->setPixmap(QPixmap::fromImage(*qimage));
}
void MainWindow::getPTZCameraStatus(axis_camera::Axis msg)
{
    currentPTZStatus = msg;

    ui.linePTZPanCurrent->setInputMask("000.00");
    ui.linePTZPanCurrent->setText(QString::number(msg.pan,'%3.2f',6));

    ui.linePTZTiltCurrent->setInputMask("000.00");
    ui.linePTZTiltCurrent->setText(QString::number(msg.tilt,'%3.2f',6));

    ui.linePTZZoomCurrent->setText(QString::number(msg.zoom));
}
/*
 * These triggers whenever the button is clicked, regardless of whether it
 * is already checked or not.
 */

void MainWindow::on_button_connect_clicked(bool check ) {
	if ( ui.checkbox_use_environment->isChecked() ) {
		if ( !qnode.init() ) {
			showNoMasterMessage();
		} else {
			ui.button_connect->setEnabled(false);
		}
    } else
    {
		if ( ! qnode.init(ui.line_edit_master->text().toStdString(),
                   ui.line_edit_host->text().toStdString()))
            /* //! gps.init(ui.line_edit_master->text().toStdString(),
             //                   ui.line_edit_host->text().toStdString()))*/
        {
			showNoMasterMessage();
		} else {
			ui.button_connect->setEnabled(false);
			ui.line_edit_master->setReadOnly(true);
			ui.line_edit_host->setReadOnly(true);
			ui.line_edit_topic->setReadOnly(true);
		}
	}
}


void MainWindow::on_checkbox_use_environment_stateChanged(int state) {
	bool enabled;
	if ( state == 0 ) {
		enabled = true;
	} else {
		enabled = false;
	}
	ui.line_edit_master->setEnabled(enabled);
	ui.line_edit_host->setEnabled(enabled);
	//ui.line_edit_topic->setEnabled(enabled);
}

/*****************************************************************************
** Implemenation [Slots][manually connected]
*****************************************************************************/

/**
 * This function is signalled by the underlying model. When the model changes,
 * this will drop the cursor down to the last line in the QListview to ensure
 * the user can always see the latest log message.
 */
void MainWindow::updateLoggingView() {
        ui.view_logging->scrollToBottom();
}
void MainWindow::updateScan(const sensor_msgs::LaserScan scan) {
    scanview->convertDistanceToCoordinate((float*)scan.ranges.data(),scan.ranges.size(), scan.angle_min,scan.angle_increment);
     Q_EMIT sceneUpdate();
}
/*****************************************************************************
** Implementation [Menu]
*****************************************************************************/

void MainWindow::on_actionAbout_triggered() {
    QMessageBox::about(this, tr("About ..."),tr("<h2>PACKAGE_NAME Test Program 0.10</h2><p>Copyright Yujin Robot</p><p>This package needs an about description.</p>"));
}

/*****************************************************************************
** Implementation [Configuration]
*****************************************************************************/

void MainWindow::ReadSettings() {
    QSettings settings("Qt-Ros Package", "imu_gps");
    restoreGeometry(settings.value("geometry").toByteArray());
    restoreState(settings.value("windowState").toByteArray());
    QString master_url = settings.value("master_url",QString("http://192.168.1.2:11311/")).toString();
    QString host_url = settings.value("host_url", QString("192.168.1.3")).toString();
    //QString topic_name = settings.value("topic_name", QString("/chatter")).toString();
    ui.line_edit_master->setText(master_url);
    ui.line_edit_host->setText(host_url);
    //ui.line_edit_topic->setText(topic_name);
    bool remember = settings.value("remember_settings", false).toBool();
    ui.checkbox_remember_settings->setChecked(remember);
    bool checked = settings.value("use_environment_variables", false).toBool();
    ui.checkbox_use_environment->setChecked(checked);
    if ( checked ) {
    	ui.line_edit_master->setEnabled(false);
    	ui.line_edit_host->setEnabled(false);
    	//ui.line_edit_topic->setEnabled(false);
    }
}

void MainWindow::WriteSettings() {
    QSettings settings("Qt-Ros Package", "imu_gps");
    settings.setValue("master_url",ui.line_edit_master->text());
    settings.setValue("host_url",ui.line_edit_host->text());
    //settings.setValue("topic_name",ui.line_edit_topic->text());
    settings.setValue("use_environment_variables",QVariant(ui.checkbox_use_environment->isChecked()));
    settings.setValue("geometry", saveGeometry());
    settings.setValue("windowState", saveState());
    settings.setValue("remember_settings",QVariant(ui.checkbox_remember_settings->isChecked()));

}

void MainWindow::closeEvent(QCloseEvent *event)
{
	WriteSettings();
	QMainWindow::closeEvent(event);
}

point_t * point_create(double x, double y)
{
    point_t *npoint = (point_t*)malloc(sizeof(point_t));

    if(npoint != NULL)
    {
        npoint->x = x;
        npoint->y = y;
    }

    return npoint;
}
void point_init(point_t *point, double x, double y)
{
    if(point == NULL)
        return;
    point->x = x;
    point->y = y;
}

void point_add(point_t *point, double x, double y)
{
    if(point == NULL)
        return;
    point->x += x;
    point->y += y;
}
void line_init(line_t *line, point_t *sp, point_t *ep)
{
  if(line == NULL || sp == NULL || ep == NULL)
      return;

  line->sp = *sp;
  line->ep = *ep;

  line->xLine = 0;
  line->yLine = 0;

  if(line->sp.x - line->ep.x == 0)
  {
      line->slope = 0;
      line->constant = line->sp.x;
      line->angle = M_PI/2;
      line->xLine = 1;
  }
  else if(line->sp.y - line->ep.y == 0)
  {
      line->slope = 0;
      line->constant = line->sp.y;
      line->angle = 0;
      line->yLine = 1;
  }
  else
  {
      line->slope = (double)(line->sp.y - line->ep.y) / (double)(line->sp.x - line->ep.x);
      line->angle = atan(line->slope);
      line->constant = line->sp.y - line->slope * line->sp.x;
  }

  line->length = sqrt((line->sp.x-line->ep.x)*(line->sp.x-line->ep.x)+(line->sp.y-line->ep.y)*(line->sp.y-line->ep.y));

}
point_t* line_get_crossing_point(line_t *l1, line_t *l2)
{
       double cx = 10000.0;
       double cy = 10000.0;

       int onL1 = 0;
       int onL2 = 0;

       point_t *crossingPoint = NULL;

       if(!(l1->xLine || l1->yLine || l2->xLine || l2->yLine))
       {
            cx = -(l1->constant - l2->constant) / (l1->slope - l2->slope);
            cy = l1->slope*cx+l1->constant;
       }
       else if(l1->xLine)
       {
          if(l2->yLine)
          {
            cy = l2->sp.y;
            cx = l1->sp.x;

          }
          else if(!l2->xLine)
          {
            cy = l2->slope*l1->sp.x + l2->constant;
            cx = l1->sp.x;
          }
       }
       else if(l1->yLine)
       {
          if(l2->xLine)
          {
            cy = l1->sp.y;
            cx = l2->sp.x;
          }
          else if(!l2->yLine)
          {
            cy = l1->sp.y;
            cx = (l1->sp.y-l2->constant)/l2->slope;
          }
       }
       else if(l2->xLine)
       {
          if(l1->yLine)
          {
            cy = l1->sp.y;
            cx = l2->sp.x;

          }
          else if(!l1->xLine)
          {
            cy = l1->slope*l2->sp.x + l1->constant;
            cx = l2->sp.x;
          }
       }
       else if(l2->yLine)
       {
          if(l1->xLine)
          {
            cy = l2->sp.y;
            cx = l1->sp.x;
          }
          else if(!l1->yLine)
          {
            cy = l2->sp.y;
            cx = (l2->sp.y-l1->constant)/l1->slope;
          }
       }
       if(((l1->sp.x <= cx && l1->ep.x >= cx)||(l1->sp.x >= cx && l1->ep.x <= cx)) &&
          ((l1->sp.y <= cy && l1->ep.y >= cy)||(l1->sp.y >= cy && l1->ep.y <= cy)))
                    onL1 = 1;
       if(((l2->sp.x <= cx && l2->ep.x >= cx)||(l2->sp.x >= cx && l2->ep.x <= cx)) &&
          ((l2->sp.y <= cy && l2->ep.y >= cy)||(l2->sp.y >= cy && l2->ep.y <= cy)))
                    onL2 = 1;
       if(onL1 && onL2)
       {
          crossingPoint = point_create(cx, cy);
       }
       return crossingPoint;
}

llentry_t *llentry_create(void)
{
    llentry_t *llentry = (llentry_t*)malloc(sizeof(llentry_t));
    if(llentry != NULL)
      memset(llentry, 0, sizeof(llentry_t));
    return llentry;
}
int lrf_is_point_in_reletive_distance(pointl_t *last,double x, double y, double relDist)
{
  double distance;
  double deltaX;
  double deltaY;
  while(last != NULL)
  {
      deltaX = last->x - x;
      deltaY = last->y - y;

      distance = sqrt( deltaX*deltaX + deltaY*deltaY );
      if(distance <= relDist)
          return 1;

      last = last->pre;
  }
  return 0;
}
double  point_get_distance(double x1, double y1,double x2, double y2)
{
  double distance;
  double deltaX;
  double deltaY;
  deltaX = x1 - x2;
  deltaY = y1 - y2;

  distance = sqrt( deltaX*deltaX + deltaY*deltaY );

  return distance;
}
double line_get_distance_to_point(line_t *line, double x, double y)
{

  double a1;
  double a2;

  line_t hipotenus;

  double distance;
  double angleDiffrence;
  point_t point;

  point_init(&point,x,y);

  line_init(&hipotenus,&line->sp,&point);

  a1 = line->angle;
  a2 = hipotenus.angle;

  if(a1 < 0)
      a1 = M_PI + a1;
  if(a2 < 0)
      a2 = M_PI + a2;

  angleDiffrence = line->angle - hipotenus.angle;

  if(angleDiffrence < 0)
      angleDiffrence = -angleDiffrence;

  /*if(angleDiffrence > M_PI / 2)
      distance = 1000;
  else*/

  distance = sin(angleDiffrence)*hipotenus.length;

  return distance;

}

double pointl_get_average_distance(pointl_t *root, line_t *line, int point_cnt)
{
  double distance;

  distance = 0;
  while(root != NULL)
  {
      distance += line_get_distance_to_point(line,root->x,root->y)/(double)point_cnt;

      root = root->next;
  }
  return distance;
}

int lrf_is_point_in_reletive_direction(pointl_t *last,pointl_t *first,double x, double y, double relDirection)
{
  double distance;
  double deltaX;
  double deltaY;
  while(last != NULL)
  {
      deltaX = last->x - x;
      deltaY = last->y - y;

      distance = sqrt( deltaX*deltaX + deltaY*deltaY );
      if(distance <= relDirection)
          return 1;

      last = last->pre;
  }
  return 0;
}
plinel_t *lrf_create_plinel(void)
{
    plinel_t *pl = (plinel_t*)malloc(sizeof(plinel_t));

    if(pl == NULL)
      return 0;

    pl->first = NULL;
    pl->last  = NULL;
    pl->next  = NULL;
    pl->pre  = NULL;
    pl->length = 0.0;
    pl->point_cnt = 0;
    return pl;
}
void lrf_delete_plinel(plinel_t *root)
{
  plinel_t *line;
  pointl_t *point;

  while(root != NULL)
  {
      while(root->first != NULL)
      {
          point = root->first;
          root->first = root->first->next;
          free(point);
      }
      line = root;
      root = root->next;
      free(line);
  }
}
pointl_t *lrf_create_point_list(double angle,double x, double y, double dist)
{
  pointl_t *point;

  point =  (pointl_t*)malloc(sizeof(pointl_t));

  if(point == NULL)
      return NULL;

  point->angle = angle;
  point->dist  = dist;
  point->x = x;
  point->y = y;
  point->next = NULL;
  point->pre  = NULL;

  return point;

}

int line_map_get_coord_list(float *coord, int capacity ,line_map_t *lm)
{
    int index = 0;
    plinel_t *root = lm->first;
    while(root != NULL)
    {

        if(index >= capacity)
            return index;

        if(root->line.length > 50)
        {
            coord[index++] = root->line.sp.x;
            coord[index++] = root->line.sp.y;
            coord[index++] = root->line.ep.x;
            coord[index++] = root->line.ep.y;
        }
        root = root->next;
      }
      return index;
}
int line_map_get_coord_first_last(float *coord, int capacity ,line_map_t *lm)
{
    int index = 0;

    if(lm->first != NULL  || lm->last != NULL)
    {

        if(index >= capacity)
            return index;

        coord[index++] = lm->first->line.sp.x;
        coord[index++] = lm->first->line.sp.y;
        coord[index++] = lm->first->line.ep.x;
        coord[index++] = lm->first->line.ep.y;

        coord[index++] = lm->last->line.sp.x;
        coord[index++] = lm->last->line.sp.y;
        coord[index++] = lm->last->line.ep.x;
        coord[index++] = lm->last->line.ep.y;

      }
      return index;
}

int lrf_get_line_list(uInt16_t *coord, int capacity,plinel_t *root)
{
  int index = 0;
  while(root != NULL)
  {

    if(index >= capacity)
        return index;

    if(root->first != NULL)
    {
        coord[index++] = root->first->x;

        if(root->first->y < 0)
        {
            coord[index++] = -root->first->y;
            coord[index++] = 1;
        }

        else
        {
            coord[index++] = root->first->y;
            coord[index++] = 0;
        }

        coord[index++] = root->last->x;
        if(root->last->y < 0)
        {
            coord[index++] = -root->last->y;
            coord[index++] = 1;
        }
        else
        {
            coord[index++] = root->last->y;
            coord[index++] = 0;
        }
        if(root->line.length > 50 || root->point_cnt > 5)
            printf("line length %f, point number: %d\n",root->line.length,root->point_cnt);

    }
    root = root->next;
  }
  return index;
}

int lrf_print_line_list(plinel_t *root)
{
  int i = 0;

  while(root != NULL)
  {
    printf("line %d: ",i);

    while(root->first != NULL)
    {
        printf("(%lf,%lf),",root->first->x,root->first->y);
        root->first = root->first->next;
    }
    root = root->next;
    printf("\n");
    i++;
  }
  return 1;
}

double line_duzeltme_acisini_bul(line_t *base, line_t *curr)
{
   double angle = 0.0;
   if(base->angle >= 0 && curr->angle >= 0)
   {
      angle = base->angle - curr->angle;
   }
   else if(base->angle <= 0 && curr->angle <= 0)
   {
      angle = base->angle - curr->angle;
   }
   else if(base->angle > 0 && curr->angle < 0)
   {
      double ta = M_PI+curr->angle;
      angle = base->angle - ta;
   }
   else if(base->angle < 0 && curr->angle > 0)
   {
      double ta = M_PI+base->angle;
          angle = ta - curr->angle;
   }

   return angle;
}

double line_get_angle_diff(line_t *l1, line_t *l2)
{
    double a1;
    double a2;
    a1 = l1->angle;
    a2 = l2->angle;
    if(a1 < 0)
        a1 = M_PI + a1;
    if(a2 < 0)
        a2 = M_PI + a2;
    double angleDiff = a1 - a2;
    if(angleDiff < 0)
        angleDiff = -angleDiff;
    return angleDiff;
}

int nlrf_split_line(plinel_t *ll, double treshold)
{
    double dist;
    double maxdist;
    point_t p,sp,ep;
    if(ll == NULL)
        return 0;



    pointl_t *point = ll->first;

    pointl_t *uzakNokta = NULL;

    plinel_t *tpl;

    plinel_t *next;
    plinel_t *pre;

    maxdist = 0;

    ll->point_cnt = 0;
    while(point != NULL)
    {
        dist = line_get_distance_to_point(&ll->line,point->x, point->y);

        if(dist > maxdist &&  point != ll->first &&  point != ll->last)
        {
            maxdist = dist;
            uzakNokta = point;
        }
        point = point->next;

        ll->point_cnt++;
    }

    if(maxdist >= treshold && uzakNokta != NULL)
    {
        tpl = lrf_create_plinel();

        if(tpl == NULL)
             return 0;



        tpl->first = uzakNokta;
        ll->last  = uzakNokta->pre;

        ll->last->next = NULL;

        tpl->first->pre = NULL;
        tpl->last = ll->last;
        tpl->last->next = NULL;


        point_init(&sp, tpl->first->x, tpl->first->y);
        point_init(&ep, tpl->last->x, tpl->last->y);
        line_init(&tpl->line,&sp,&ep);


        point_init(&sp, ll->first->x, ll->first->y);
        point_init(&ep, ll->last->x, ll->last->y);
        line_init(&ll->line,&sp,&ep);


        next = ll->next;
        pre  = ll;

        if(pre != NULL)
        {
          pre->next = tpl;
        }
        tpl->pre = pre;
        if(next != NULL)
        {
            next->pre = tpl;
        }
        tpl->next = next;

        return 1;
    }
    else
        return 0;
}
int nlrf_split(line_map_t *lm, double treshold)
{
    plinel_t *tpl;

    int bolunmeVar = 1;
    if(lm == NULL)
        return 0;
    do
    {
        tpl = lm->first;
        bolunmeVar = 0;
        while(tpl != NULL)
        {
            if(nlrf_split_line(tpl,treshold))
                bolunmeVar = 1;
            tpl = tpl->next;
        }
    }while(bolunmeVar);

    return 1;
}

int nlrf_add_point(line_map_t *lm,double angle,double x, double y, double dist, double relDist)
{
   point_t sp,ep;

   double distance;

   plinel_t *tpl;
   pointl_t *point;


   if(lm == NULL)
       return 0;

   tpl = lm->last;

   if(tpl != NULL && tpl->last != NULL)
   {
      distance = point_get_distance(tpl->last->x, tpl->last->y, x, y);

      if(distance < relDist)
      {
          point = lrf_create_point_list(angle,x,y,dist);

          if(point == NULL)
             return 0;

          point->pre = tpl->last;
          tpl->last->next = point;
          tpl->last = point;


          point_init(&sp, tpl->first->x, tpl->first->y);
          point_init(&ep, tpl->last->x, tpl->last->y);

          line_init(&tpl->line,&sp,&ep);
          tpl->point_cnt++;

          return 1;
      }

   }

   tpl = lrf_create_plinel();

   if(tpl == NULL)
     return 0;

   point = lrf_create_point_list(angle,x,y,dist);

   if(point == NULL)
   {
      free(tpl);
      return 0;
   }

   tpl->first = point;
   tpl->last  = point;
   tpl->point_cnt++;


   if(lm->first == NULL)
   {
     lm->first = tpl;
     lm->lineCount = 0;
   }
   if(lm->last != NULL)
     lm->last->next = tpl;

   tpl->pre = lm->last;
   lm->last = tpl;

   point_init(&sp, tpl->first->x, tpl->first->y);
   point_init(&ep, tpl->last->x, tpl->last->y);

   line_init(&tpl->line,&sp,&ep);

   tpl->point_cnt = 1;

   lm->lineCount++;

   return 1;
}

int line_map_get_line_coordinates(float *coord, int capacity,plinel_t *root)
{
  int index = 0;
  while(root != NULL)
  {

    if(index >= capacity)
        return index;

    if(root->line.length > 5 && root->point_cnt > 3 )//MIN_LENGTH_LINE_TO_SEND)
    {
        coord[index++] = root->line.sp.x;
        coord[index++] = root->line.sp.y;
        coord[index++] = root->line.ep.x;
        coord[index++] = root->line.ep.y;
    }
    root = root->next;
  }
  return index;
}


void line_map_init(line_map_t *lm)
{
    if(lm == NULL)
        return;
    lm->first = NULL;
    lm->last = NULL;
    lm->lineCount = 0;
    lm->totalLen = 0;
}
void line_map_make_free(line_map_t *lm)
{
    if(lm == NULL)
        return;
    lrf_delete_plinel(lm->first);
    line_map_init(lm);
}

void line_map_copy(line_map_t *lm,plinel_t *root)
{
  pointl_t *point;

  while(root != NULL)
  {

    point = root->first;
    while(point != NULL)
    {
        nlrf_add_point(lm,point->angle,point->x,point->y,point->dist, 10);
        point = point->next;
    }
    root = root->next;
  }
  nlrf_split(lm,2);
}

}  // namespace imu_gps

