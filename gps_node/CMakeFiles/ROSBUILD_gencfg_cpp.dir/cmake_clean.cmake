FILE(REMOVE_RECURSE
  "src/gps_node/msg"
  "msg_gen"
  "msg_gen"
  "CMakeFiles/ROSBUILD_gencfg_cpp"
  "cfg/cpp/gps_node/GPSConfig.h"
  "docs/GPSConfig.dox"
  "docs/GPSConfig-usage.dox"
  "src/gps_node/cfg/GPSConfig.py"
  "docs/GPSConfig.wikidoc"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gencfg_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
