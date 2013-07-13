FILE(REMOVE_RECURSE
  "src/imu_node/msg"
  "msg_gen"
  "msg_gen"
  "CMakeFiles/ROSBUILD_gencfg_cpp"
  "cfg/cpp/imu_node/IMUConfig.h"
  "docs/IMUConfig.dox"
  "docs/IMUConfig-usage.dox"
  "src/imu_node/cfg/IMUConfig.py"
  "docs/IMUConfig.wikidoc"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gencfg_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
