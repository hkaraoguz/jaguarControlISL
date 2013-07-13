/*
 * robot.h
 *
 *  Created on: May 20, 2012
 *      Author: ramazan
 */

#ifndef ROBOT_H_
#define ROBOT_H_

#include "types.h"

extern void robot_init(robot_t *robot, point_t *probot, point_t *pdirection, double radius,double olcek);
extern void robot_set_direction_point(robot_t *robot, point_t *pdirection);
extern point_t robot_get_new_position(robot_t *robot, double delta);
extern void robot_set_position(robot_t *robot);
extern point_t robot_get_new_direction_point(robot_t *robot,double angle);
extern void robot_set_velocity(robot_t *robot, double angular, double linear);
//extern point_t robot_get_laser_point_if_turn(robot_t *robot,double angle);
extern void robot_turn(robot_t *robot,double angle);
extern void robot_go(robot_t *robot,double delta);
extern void robot_go_back(robot_t *robot,double delta);
extern line_t robot_get_ray(robot_t *robot,double angle);
extern line_t robot_get_ray_from_robot_point(robot_t *robot,double angle);
extern point_t robot_add_pont(robot_t *robot, double distance, double angle, double relDist);

extern void robot_get_laser_point_if_turn(point_t *plaser, point_t *pdirection,robot_t *robot,double angle);
#endif /* ROBOT_H_ */
