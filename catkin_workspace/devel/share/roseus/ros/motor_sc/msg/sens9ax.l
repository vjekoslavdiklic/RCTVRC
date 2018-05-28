;; Auto-generated. Do not edit!


(when (boundp 'motor_sc::sens9ax)
  (if (not (find-package "MOTOR_SC"))
    (make-package "MOTOR_SC"))
  (shadow 'sens9ax (find-package "MOTOR_SC")))
(unless (find-package "MOTOR_SC::SENS9AX")
  (make-package "MOTOR_SC::SENS9AX"))

(in-package "ROS")
;;//! \htmlinclude sens9ax.msg.html


(defclass motor_sc::sens9ax
  :super ros::object
  :slots (_ID _timestamp _compass _gyro _accel _fusionPose _fusionQPose ))

(defmethod motor_sc::sens9ax
  (:init
   (&key
    ((:ID __ID) 0)
    ((:timestamp __timestamp) 0)
    ((:compass __compass) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:gyro __gyro) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:accel __accel) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:fusionPose __fusionPose) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:fusionQPose __fusionQPose) (make-array 4 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _timestamp (round __timestamp))
   (setq _compass __compass)
   (setq _gyro __gyro)
   (setq _accel __accel)
   (setq _fusionPose __fusionPose)
   (setq _fusionQPose __fusionQPose)
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:compass
   (&optional __compass)
   (if __compass (setq _compass __compass)) _compass)
  (:gyro
   (&optional __gyro)
   (if __gyro (setq _gyro __gyro)) _gyro)
  (:accel
   (&optional __accel)
   (if __accel (setq _accel __accel)) _accel)
  (:fusionPose
   (&optional __fusionPose)
   (if __fusionPose (setq _fusionPose __fusionPose)) _fusionPose)
  (:fusionQPose
   (&optional __fusionQPose)
   (if __fusionQPose (setq _fusionQPose __fusionQPose)) _fusionQPose)
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ;; uint64 _timestamp
    8
    ;; float64[3] _compass
    (* 8    3)
    ;; float64[3] _gyro
    (* 8    3)
    ;; float64[3] _accel
    (* 8    3)
    ;; float64[3] _fusionPose
    (* 8    3)
    ;; float64[4] _fusionQPose
    (* 8    4)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ID
       (write-byte _ID s)
     ;; uint64 _timestamp
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _timestamp (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _timestamp) (= (length (_timestamp . bv)) 2)) ;; bignum
              (write-long (ash (elt (_timestamp . bv) 0) 0) s)
              (write-long (ash (elt (_timestamp . bv) 1) -1) s))
             ((and (class _timestamp) (= (length (_timestamp . bv)) 1)) ;; big1
              (write-long (elt (_timestamp . bv) 0) s)
              (write-long (if (>= _timestamp 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _timestamp s)(write-long (if (>= _timestamp 0) 0 #xffffffff) s)))
     ;; float64[3] _compass
     (dotimes (i 3)
       (sys::poke (elt _compass i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[3] _gyro
     (dotimes (i 3)
       (sys::poke (elt _gyro i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[3] _accel
     (dotimes (i 3)
       (sys::poke (elt _accel i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[3] _fusionPose
     (dotimes (i 3)
       (sys::poke (elt _fusionPose i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[4] _fusionQPose
     (dotimes (i 4)
       (sys::poke (elt _fusionQPose i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint64 _timestamp
     
#+(or :alpha :irix6 :x86_64)
      (setf _timestamp (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _timestamp (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64[3] _compass
   (dotimes (i (length _compass))
     (setf (elt _compass i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[3] _gyro
   (dotimes (i (length _gyro))
     (setf (elt _gyro i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[3] _accel
   (dotimes (i (length _accel))
     (setf (elt _accel i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[3] _fusionPose
   (dotimes (i (length _fusionPose))
     (setf (elt _fusionPose i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[4] _fusionQPose
   (dotimes (i (length _fusionQPose))
     (setf (elt _fusionQPose i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(setf (get motor_sc::sens9ax :md5sum-) "ae05447afd7568f477683a6ee9035588")
(setf (get motor_sc::sens9ax :datatype-) "motor_sc/sens9ax")
(setf (get motor_sc::sens9ax :definition-)
      "uint8 ID
uint64 timestamp
float64[3] compass
float64[3] gyro
float64[3] accel
float64[3] fusionPose
float64[4] fusionQPose

")



(provide :motor_sc/sens9ax "ae05447afd7568f477683a6ee9035588")


