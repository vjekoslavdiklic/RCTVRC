;; Auto-generated. Do not edit!


(when (boundp 'motor_sc::g_sens)
  (if (not (find-package "MOTOR_SC"))
    (make-package "MOTOR_SC"))
  (shadow 'g_sens (find-package "MOTOR_SC")))
(unless (find-package "MOTOR_SC::G_SENS")
  (make-package "MOTOR_SC::G_SENS"))

(in-package "ROS")
;;//! \htmlinclude g_sens.msg.html


(defclass motor_sc::g_sens
  :super ros::object
  :slots (_Front_sens _Rear_sens ))

(defmethod motor_sc::g_sens
  (:init
   (&key
    ((:Front_sens __Front_sens) (instance motor_sc::sens9ax :init))
    ((:Rear_sens __Rear_sens) (instance motor_sc::sens9ax :init))
    )
   (send-super :init)
   (setq _Front_sens __Front_sens)
   (setq _Rear_sens __Rear_sens)
   self)
  (:Front_sens
   (&rest __Front_sens)
   (if (keywordp (car __Front_sens))
       (send* _Front_sens __Front_sens)
     (progn
       (if __Front_sens (setq _Front_sens (car __Front_sens)))
       _Front_sens)))
  (:Rear_sens
   (&rest __Rear_sens)
   (if (keywordp (car __Rear_sens))
       (send* _Rear_sens __Rear_sens)
     (progn
       (if __Rear_sens (setq _Rear_sens (car __Rear_sens)))
       _Rear_sens)))
  (:serialization-length
   ()
   (+
    ;; motor_sc/sens9ax _Front_sens
    (send _Front_sens :serialization-length)
    ;; motor_sc/sens9ax _Rear_sens
    (send _Rear_sens :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; motor_sc/sens9ax _Front_sens
       (send _Front_sens :serialize s)
     ;; motor_sc/sens9ax _Rear_sens
       (send _Rear_sens :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; motor_sc/sens9ax _Front_sens
     (send _Front_sens :deserialize buf ptr-) (incf ptr- (send _Front_sens :serialization-length))
   ;; motor_sc/sens9ax _Rear_sens
     (send _Rear_sens :deserialize buf ptr-) (incf ptr- (send _Rear_sens :serialization-length))
   ;;
   self)
  )

(setf (get motor_sc::g_sens :md5sum-) "2ba48ff788ab0557badb810806e50757")
(setf (get motor_sc::g_sens :datatype-) "motor_sc/g_sens")
(setf (get motor_sc::g_sens :definition-)
      "sens9ax Front_sens
sens9ax Rear_sens
================================================================================
MSG: motor_sc/sens9ax
uint8 ID
uint64 timestamp
float64[3] compass
float64[3] gyro
float64[3] accel
float64[3] fusionPose
float64[4] fusionQPose

")



(provide :motor_sc/g_sens "2ba48ff788ab0557badb810806e50757")


