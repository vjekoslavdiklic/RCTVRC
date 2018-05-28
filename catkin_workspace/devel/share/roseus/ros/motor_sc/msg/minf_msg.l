;; Auto-generated. Do not edit!


(when (boundp 'motor_sc::minf_msg)
  (if (not (find-package "MOTOR_SC"))
    (make-package "MOTOR_SC"))
  (shadow 'minf_msg (find-package "MOTOR_SC")))
(unless (find-package "MOTOR_SC::MINF_MSG")
  (make-package "MOTOR_SC::MINF_MSG"))

(in-package "ROS")
;;//! \htmlinclude minf_msg.msg.html


(defclass motor_sc::minf_msg
  :super ros::object
  :slots (_ID _CURRENT _RPM ))

(defmethod motor_sc::minf_msg
  (:init
   (&key
    ((:ID __ID) 0)
    ((:CURRENT __CURRENT) 0.0)
    ((:RPM __RPM) 0.0)
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _CURRENT (float __CURRENT))
   (setq _RPM (float __RPM))
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:CURRENT
   (&optional __CURRENT)
   (if __CURRENT (setq _CURRENT __CURRENT)) _CURRENT)
  (:RPM
   (&optional __RPM)
   (if __RPM (setq _RPM __RPM)) _RPM)
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ;; float32 _CURRENT
    4
    ;; float32 _RPM
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ID
       (write-byte _ID s)
     ;; float32 _CURRENT
       (sys::poke _CURRENT (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _RPM
       (sys::poke _RPM (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _CURRENT
     (setq _CURRENT (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _RPM
     (setq _RPM (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get motor_sc::minf_msg :md5sum-) "b85c91d3c46d01d1f24f2a77e165b6ca")
(setf (get motor_sc::minf_msg :datatype-) "motor_sc/minf_msg")
(setf (get motor_sc::minf_msg :definition-)
      "uint8 ID
float32 CURRENT
float32 RPM
")



(provide :motor_sc/minf_msg "b85c91d3c46d01d1f24f2a77e165b6ca")


