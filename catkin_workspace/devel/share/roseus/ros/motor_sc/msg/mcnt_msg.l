;; Auto-generated. Do not edit!


(when (boundp 'motor_sc::mcnt_msg)
  (if (not (find-package "MOTOR_SC"))
    (make-package "MOTOR_SC"))
  (shadow 'mcnt_msg (find-package "MOTOR_SC")))
(unless (find-package "MOTOR_SC::MCNT_MSG")
  (make-package "MOTOR_SC::MCNT_MSG"))

(in-package "ROS")
;;//! \htmlinclude mcnt_msg.msg.html


(defclass motor_sc::mcnt_msg
  :super ros::object
  :slots (_ID _cnt_data ))

(defmethod motor_sc::mcnt_msg
  (:init
   (&key
    ((:ID __ID) 0)
    ((:cnt_data __cnt_data) (make-array 2 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _cnt_data __cnt_data)
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:cnt_data
   (&optional __cnt_data)
   (if __cnt_data (setq _cnt_data __cnt_data)) _cnt_data)
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ;; uint8[2] _cnt_data
    (* 1    2)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ID
       (write-byte _ID s)
     ;; uint8[2] _cnt_data
     (princ _cnt_data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8[2] _cnt_data
   (setq _cnt_data (make-array 2 :element-type :char))
   (replace _cnt_data buf :start2 ptr-) (incf ptr- 2)
   ;;
   self)
  )

(setf (get motor_sc::mcnt_msg :md5sum-) "8f8d9d38dc81575a88dd6f44006cd842")
(setf (get motor_sc::mcnt_msg :datatype-) "motor_sc/mcnt_msg")
(setf (get motor_sc::mcnt_msg :definition-)
      "uint8 ID
uint8[2] cnt_data 
")



(provide :motor_sc/mcnt_msg "8f8d9d38dc81575a88dd6f44006cd842")


