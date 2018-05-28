;; Auto-generated. Do not edit!


(when (boundp 'motor_sc::LED_controll)
  (if (not (find-package "MOTOR_SC"))
    (make-package "MOTOR_SC"))
  (shadow 'LED_controll (find-package "MOTOR_SC")))
(unless (find-package "MOTOR_SC::LED_CONTROLL")
  (make-package "MOTOR_SC::LED_CONTROLL"))

(in-package "ROS")
;;//! \htmlinclude LED_controll.msg.html


(defclass motor_sc::LED_controll
  :super ros::object
  :slots (_LED_ID _RGB ))

(defmethod motor_sc::LED_controll
  (:init
   (&key
    ((:LED_ID __LED_ID) 0)
    ((:RGB __RGB) (make-array 3 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _LED_ID (round __LED_ID))
   (setq _RGB __RGB)
   self)
  (:LED_ID
   (&optional __LED_ID)
   (if __LED_ID (setq _LED_ID __LED_ID)) _LED_ID)
  (:RGB
   (&optional __RGB)
   (if __RGB (setq _RGB __RGB)) _RGB)
  (:serialization-length
   ()
   (+
    ;; uint8 _LED_ID
    1
    ;; uint8[3] _RGB
    (* 1    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _LED_ID
       (write-byte _LED_ID s)
     ;; uint8[3] _RGB
     (princ _RGB s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _LED_ID
     (setq _LED_ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8[3] _RGB
   (setq _RGB (make-array 3 :element-type :char))
   (replace _RGB buf :start2 ptr-) (incf ptr- 3)
   ;;
   self)
  )

(setf (get motor_sc::LED_controll :md5sum-) "7863f5ba3af370bb462fe9903dbd7387")
(setf (get motor_sc::LED_controll :datatype-) "motor_sc/LED_controll")
(setf (get motor_sc::LED_controll :definition-)
      "uint8 LED_ID 
uint8[3] RGB
")



(provide :motor_sc/LED_controll "7863f5ba3af370bb462fe9903dbd7387")


