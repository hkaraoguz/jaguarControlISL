FILE(REMOVE_RECURSE
  "src/gps_node/msg"
  "msg_gen"
  "msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_lisp"
  "msg_gen/lisp/GPSStatus.lisp"
  "msg_gen/lisp/_package.lisp"
  "msg_gen/lisp/_package_GPSStatus.lisp"
  "msg_gen/lisp/GPSFix.lisp"
  "msg_gen/lisp/_package.lisp"
  "msg_gen/lisp/_package_GPSFix.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
