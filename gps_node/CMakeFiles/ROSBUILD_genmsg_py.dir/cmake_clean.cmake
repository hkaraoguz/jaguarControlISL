FILE(REMOVE_RECURSE
  "src/gps_node/msg"
  "msg_gen"
  "msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "src/gps_node/msg/__init__.py"
  "src/gps_node/msg/_GPSStatus.py"
  "src/gps_node/msg/_GPSFix.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
