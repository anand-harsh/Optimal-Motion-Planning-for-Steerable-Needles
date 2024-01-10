
(cl:in-package :asdf)

(defsystem "pp_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PathPlanningPlugin" :depends-on ("_package_PathPlanningPlugin"))
    (:file "_package_PathPlanningPlugin" :depends-on ("_package"))
  ))