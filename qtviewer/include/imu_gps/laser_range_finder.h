/*
 * laser_range_finder.h
 *
 *  Created on: May 6, 2012
 *      Author: ramazan
 */

#ifndef LASER_RANGE_FINDER_H_
#define LASER_RANGE_FINDER_H_

#include "types.h"

extern point_t * point_create(double x, double y);
extern void point_init(point_t *point, double x, double y);
extern void point_add(point_t *point, double x, double y);
extern double point_get_distance(double x1, double y1,double x2, double y2);
extern void line_init(line_t *line, point_t *sp, point_t *ep);
extern area_t *area_create(void);
extern llentry_t *llentry_create(void);
extern int/*0 failure*/ area_proximity_search(area_t *area, point_proximty_search_t *psresult, point_t *p, double max_search_dist);
extern int area_get_coordinates(area_t *area,float *coord, int capacity);
extern int /*1 success, 0 failure*/ area_add_line(area_t *area, line_t *line);
extern int /*1 success, 0 failure*/ area_add_point(area_t *area, point_t *point, double max_search_dist);
extern point_t* line_get_crossing_point(line_t *l1, line_t *l2);


//extern int robot_convert_coordinate(robot_t *robot,float *coord,float *dist,float angle_min,float angle_increment,float dmax,float dmin, int size);
extern int robot_add_scan_data(robot_t *robot,float *dist,float angle_min,float angle_increment,float dmax,float dmin, int size);

extern int lrf_is_point_in_reletive_distance(pointl_t *last,double x, double y, double relDist);
extern plinel_t *lrf_create_plinel(void);
extern void lrf_delete_plinel(plinel_t *root);
extern int lrf_add_point_to_line_map(line_map_t *lm,double angle,double x, double y, double dist, double relDist);
extern int line_map_merge_lines(line_map_t *dest,  line_map_t *source,double relDist);
extern int line_map_merge_lines_from_last(line_map_t *dest,  line_map_t *source,double relDist);
extern int line_map_get_line_coordinates(float *coord, int capacity,plinel_t *root);
extern int lrf_get_line_list(uInt16_t *coord, int capacity,plinel_t *root);
extern int lrf_print_line_list(plinel_t *root);
extern int lrf_add_delta_xy(plinel_t *root);

extern int line_map_merge_lines_from_right(line_map_t *dest,  line_map_t *source,double relDist);
extern int line_map_merge_lines_from_left(line_map_t *dest,  line_map_t *source,double relDist);
extern point_t *line_map_get_crossing_point(line_map_t *root,line_t *ray);
extern point_t *line_map_get_crossing_point2(line_map_t *root,line_t *ray);
extern line_t *line_map_get_crossing_line(line_map_t *root,line_t *ray);

extern int line_map_get_coord_list(float *coord, int capacity ,line_map_t *lm);
extern int line_map_is_closed(line_map_t *lm, double reldist);
extern int line_map_get_coord_first_last(float *coord, int capacity ,line_map_t *lm);
extern int line_map_sort(line_map_t *dest,  line_map_t *source);
extern int line_map_get_line_coordinates_closed(float *coord, int capacity,plinel_t *root);
extern int line_map_sort_area_list( line_map_t dest[], int dstcnt,  line_map_t *source);
extern void line_merge_sorted_line(line_map_t *dest,plinel_t *root);
extern int llist_apply_linearation(line_map_t *dest, plinel_t *root);
extern int llist_get_corners(corner_list_t *cl, plinel_t *root);
extern int corner_list_get_coord_list(float *coord, int capacity ,corner_list_t *cl);
extern void corner_list_make_empty(corner_list_t *cl);
extern int corner_find_correction_required_corners(corner_list_t *d1, corner_list_t *d2,corner_list_t *cl1,corner_list_t *cl2, double maxd, double mind);
extern double cornet_duzeltme_acisini_bul(line_t *base, line_t *curr);
extern double line_duzeltme_acisini_bul(line_t *base, line_t *curr);
extern void robot_correct_position_with_corners(robot_t *robot,corner_list_t *base,corner_list_t *curr);
extern double line_get_angle_diff(line_t *l1, line_t *l2);
extern int nlrf_split(line_map_t *lm, double treshold);
extern int nlrf_add_point(line_map_t *lm,double angle,double x, double y, double dist, double relDist);
extern void line_map_init(line_map_t *lm);
extern void line_map_make_free(line_map_t *lm);
extern void line_map_copy(line_map_t *lm,plinel_t *root);
extern int line_map_duplicate_add(line_map_t *lm, line_t *line);


#endif /* LASER_RANGE_FINDER_H_ */
