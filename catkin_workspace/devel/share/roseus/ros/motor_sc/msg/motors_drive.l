;; Auto-generated. Do not edit!


(when (boundp 'motor_sc::motors_drive)
  (if (not (find-package "MOTOR_SC"))
    (make-package "MOTOR_SC"))
  (shadow 'motors_drive (find-package "MOTOR_SC")))
(unless (find-package "MOTOR_SC::MOTORS_DRIVE")
  (make-package "MOTOR_SC::MOTORS_DRIVE"))

(in-package "ROS")
;;//! \htmlinclude motors_drive.msg.html


(defclass motor_sc::motors_drive
  :super ros::object
  :slots (_cnt_data0 _cnt_data1 _cnt_data2 _cnt_data3 _servo ))

(defmethod motor_sc::motors_drive
  (:init
   (&key
    ((:cnt_data0 __cnt_data0) (make-array 2 :initial-element 0 :element-type :char))
    ((:cnt_data1 __cnt_data1) (make-array 2 :initial-element 0 :element-type :char))
    ((:cnt_data2 __cnt_data2) (make-array 2 :initial-element 0 :element-type :char))
    ((:cnt_data3 __cnt_data3) (make-array 2 :initial-element 0 :element-type :char))
    ((:servo __servo) (make-array 4 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _cnt_data0 __cnt_data0)
   (setq _cnt_data1 __cnt_data1)
   (setq _cnt_data2 __cnt_data2)
   (setq _cnt_data3 __cnt_data3)
   (setq _servo __servo)
   self)
  (:cnt_data0
   (&optional __cnt_data0)
   (if __cnt_data0 (setq _cnt_data0 __cnt_data0)) _cnt_data0)
  (:cnt_data1
   (&optional __cnt_data1)
   (if __cnt_data1 (setq _cnt_data1 __cnt_data1)) _cnt_data1)
  (:cnt_data2
   (&optional __cnt_data2)
   (if __cnt_data2 (setq _cnt_data2 __cnt_data2)) _cnt_data2)
  (:cnt_data3
   (&optional __cnt_data3)
   (if __cnt_data3 (setq _cnt_data3 __cnt_data3)) _cnt_data3)
  (:servo
   (&optional __servo)
   (if __servo (setq _servo __servo)) _servo)
  (:serialization-length
   ()
   (+
    ;; uint8[2] _cnt_data0
    (* 1    2)
    ;; uint8[2] _cnt_data1
    (* 1    2)
    ;; uint8[2] _cnt_data2
    (* 1    2)
    ;; uint8[2] _cnt_data3
    (* 1    2)
    ;; uint16[4] _servo
    (* 2    4)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8[2] _cnt_data0
     (princ _cnt_data0 s)
     ;; uint8[2] _cnt_data1
     (princ _cnt_data1 s)
     ;; uint8[2] _cnt_data2
     (princ _cnt_data2 s)
     ;; uint8[2] _cnt_data3
     (princ _cnt_data3 s)
     ;; uint16[4] _servo
     (dotimes (i 4)
       (write-word (elt _servo i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8[2] _cnt_data0
   (setq _cnt_data0 (make-array 2 :element-type :char))
   (replace _cnt_data0 buf :start2 ptr-) (incf ptr- 2)
   ;; uint8[2] _cnt_data1
   (setq _cnt_data1 (make-array 2 :element-type :char))
   (replace _cnt_data1 buf :start2 ptr-) (incf ptr- 2)
   ;; uint8[2] _cnt_data2
   (setq _cnt_data2 (make-array 2 :element-type :char))
   (replace _cnt_data2 buf :start2 ptr-) (incf ptr- 2)
   ;; uint8[2] _cnt_data3
   (setq _cnt_data3 (make-array 2 :element-type :char))
   (replace _cnt_data3 buf :start2 ptr-) (incf ptr- 2)
   ;; uint16[4] _servo
   (dotimes (i (length _servo))
     (setf (elt _servo i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;;
   self)
  )

(setf (get motor_sc::motors_drive :md5sum-) "c798d1a8705d37440ee2346bd48b7af3")
(setf (get motor_sc::motors_drive :datatype-) "motor_sc/motors_drive")
(setf (get motor_sc::motors_drive :definition-)
      "uint8[2] cnt_data0 
uint8[2] cnt_data1 
uint8[2] cnt_data2 
uint8[2] cnt_data3 
uint16[4] servo
")



(provide :motor_sc/motors_drive "c798d1a8705d37440ee2346bd48b7af3")


