/**
 * @file /include/imu_gps/main_window.hpp
 *
 * @brief Qt based gui for imu_gps.
 *
 * @date November 2010
 **/
#ifndef imu_gps_MAIN_WINDOW_H
#define imu_gps_MAIN_WINDOW_H

/*****************************************************************************
** Includes
*****************************************************************************/

#include <QtGui/QMainWindow>
#include "ui_main_window.h"
#include "qnode.hpp"
#include <QGraphicsItem>
#include <QtGui>
/*****************************************************************************
** Namespace
*****************************************************************************/

namespace imu_gps {

#ifndef uInt8_t
typedef unsigned char uInt8_t;
typedef unsigned short uInt16_t;
typedef unsigned int uInt32_t;
#endif



typedef struct _point_type_
{
  double x;
  double y;
}point_t;

typedef struct _point_list_type_
{
  double x;
  double y;
  double dist;
  double angle;
  struct _point_list_type_ *next;
  struct _point_list_type_ *pre;

}pointl_t;

typedef struct _line_type
{
    point_t sp;
    point_t ep;

    double slope;
    double constant;
    double length;
    double angle;
    int xLine;
    int yLine;
}line_t;

typedef struct _line_list_type_
{
  line_t line;
  pointl_t *first;
  pointl_t *last;
  double length;
  int    point_cnt;
  struct _line_list_type_ *next;
  struct _line_list_type_ *pre;

  int addedToSrotedList;
}plinel_t;

typedef struct _corner_type_
{
  line_t  first_line;
  line_t  second_line;
  point_t point;

  struct _corner_type_ *next;
  struct _corner_type_ *pre;

}corner_t;

typedef struct _corner_list_type_
{
    corner_t *first;
    corner_t *last;
}corner_list_t;
typedef struct _line_map_type_
{
  plinel_t *first;
  plinel_t *last;

  uInt32_t lineCount;
  double totalLen;
}line_map_t;


typedef struct liee_link_entry_
{
   line_t line;
   struct liee_link_entry_  *next;
   struct liee_link_entry_  *pre;
}llentry_t;


 class ScanWiew : public QGraphicsItem
 {
 public:
     ScanWiew();

     QRectF boundingRect() const;
     QPainterPath shape() const;
     void paint(QPainter *painter, const QStyleOptionGraphicsItem *option,
                QWidget *widget);

 protected:
     void advance(int step);

 private:
     double laserRangeInMeter;
     double arcDistanceInPixels;
     double arcDistanceInMeter;
     double startAngle;
     double endAngle;
     double angleDelta;
     QColor color;
     qreal angle;
     qreal speed;
     qreal mouseEyeDirection;

public:
     void setRange(double range);
     void setArcDistanceInMeter(double dist);
     void setArcDistanceInPixels(double dist);
     void setStartAngle(double angle);
     void setStopAngle(double angle);
     void setDeltaAngle(double angle);

typedef struct
     {
         double x;
         double y;
     }point_t;

     line_map_t g_line_map;

     static const int MAX_POINT= 1500;

     point_t plist[MAX_POINT];
     int pointCnt;
     point_t pline_s[MAX_POINT];
     point_t pline_e[MAX_POINT];

     void convertDistanceToCoordinate(float *dist, int size, double angle_min, double angle_increment);
 };
/*****************************************************************************
** Interface [MainWindow]
*****************************************************************************/
/**
 * @brief Qt central, all operations relating to the view part here.
 */
class MainWindow : public QMainWindow {
Q_OBJECT

public:
	MainWindow(int argc, char** argv, QWidget *parent = 0);
	~MainWindow();

	void ReadSettings(); // Load up qt program settings at startup
	void WriteSettings(); // Save qt program settings when closing

	void closeEvent(QCloseEvent *event); // Overloaded function
	void showNoMasterMessage();

public Q_SLOTS:
	/******************************************
	** Auto-connections (connectSlotsByName())
	*******************************************/
	void on_actionAbout_triggered();
	void on_button_connect_clicked(bool check );
	void on_checkbox_use_environment_stateChanged(int state);


    /******************************************
    ** Manual connections
    *******************************************/
    void updateLoggingView(); // no idea why this can't connect automatically

    void updateScan(const sensor_msgs::LaserScan scan);
    void setRange(int);
    void setArcDistanceInMeter(int);
    void setArcDistanceInPixels(int);
    void setStartAngle(int);
    void setStopAngle(int);
    void setDeltaAngle(int);

    void getFrontCameraImage(cv::Mat);
    void getPTZCameraImage(cv::Mat);
    void getPTZCameraStatus(axis_camera::Axis);
    void button_PTZPan_clicked();
    void button_PTZTilt_clicked();

    //logging!
    void button_single_save_clicked();
    void checkbox_enable_sensor_logging_changed(int state);
Q_SIGNALS:
    void sceneUpdate();

private:
    Ui::MainWindow ui;
    QNode qnode;
    //QGPSNode gps;
    QTimer timer;
    QGraphicsScene scene;
    ScanWiew *scanview;
    axis_camera::Axis currentPTZStatus;
};

extern point_t * point_create(double x, double y);
extern void point_init(point_t *point, double x, double y);
extern void point_add(point_t *point, double x, double y);
extern double point_get_distance(double x1, double y1,double x2, double y2);
extern void line_init(line_t *line, point_t *sp, point_t *ep);
extern llentry_t *llentry_create(void);
extern int lrf_is_point_in_reletive_distance(pointl_t *last,double x, double y, double relDist);
extern plinel_t *lrf_create_plinel(void);
extern void lrf_delete_plinel(plinel_t *root);
extern int lrf_get_line_list(uInt16_t *coord, int capacity,plinel_t *root);
extern int lrf_print_line_list(plinel_t *root);
extern int lrf_add_delta_xy(plinel_t *root);
extern void line_merge_sorted_line(line_map_t *dest,plinel_t *root);
extern int llist_apply_linearation(line_map_t *dest, plinel_t *root);
extern double line_duzeltme_acisini_bul(line_t *base, line_t *curr);
extern double line_get_angle_diff(line_t *l1, line_t *l2);
extern int nlrf_split(line_map_t *lm, double treshold);
extern int nlrf_add_point(line_map_t *lm,double angle,double x, double y, double dist, double relDist);
}  // namespace imu_gps

#endif // imu_gps_MAIN_WINDOW_H
