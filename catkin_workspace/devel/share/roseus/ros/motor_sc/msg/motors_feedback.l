;; Auto-generated. Do not edit!


(when (boundp 'motor_sc::motors_feedback)
  (if (not (find-package "MOTOR_SC"))
    (make-package "MOTOR_SC"))
  (shadow 'motors_feedback (find-package "MOTOR_SC")))
(unless (find-package "MOTOR_SC::MOTORS_FEEDBACK")
  (make-package "MOTOR_SC::MOTORS_FEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude motors_feedback.msg.html


(defclass motor_sc::motors_feedback
  :super ros::object
  :slots (_ID _CUR _RPM ))

(defmethod motor_sc::motors_feedback
  (:init
   (&key
    ((:ID __ID) 0)
    ((:CUR __CUR) (make-array 4 :initial-element 0.0 :element-type :float))
    ((:RPM __RPM) (make-array 4 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _CUR __CUR)
   (setq _RPM __RPM)
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:CUR
   (&optional __CUR)
   (if __CUR (setq _CUR __CUR)) _CUR)
  (:RPM
   (&optional __RPM)
   (if __RPM (setq _RPM __RPM)) _RPM)
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ;; float32[4] _CUR
    (* 4    4)
    ;; float32[4] _RPM
    (* 4    4)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ID
       (write-byte _ID s)
     ;; float32[4] _CUR
     (dotimes (i 4)
       (sys::poke (elt _CUR i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[4] _RPM
     (dotimes (i 4)
       (sys::poke (elt _RPM i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32[4] _CUR
   (dotimes (i (length _CUR))
     (setf (elt _CUR i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[4] _RPM
   (dotimes (i (length _RPM))
     (setf (elt _RPM i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get motor_sc::motors_feedback :md5sum-) "94194bc441d86cf5551f8c0ed1c128f4")
(setf (get motor_sc::motors_feedback :datatype-) "motor_sc/motors_feedback")
(setf (get motor_sc::motors_feedback :definition-)
      "uint8 ID
float32[4] CUR
float32[4] RPM
")



(provide :motor_sc/motors_feedback "94194bc441d86cf5551f8c0ed1c128f4")


