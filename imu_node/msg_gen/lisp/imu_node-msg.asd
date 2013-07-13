
(cl:in-package :asdf)

(defsystem "imu_node-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "imu" :depends-on ("_package_imu"))
    (:file "_package_imu" :depends-on ("_package"))
  ))