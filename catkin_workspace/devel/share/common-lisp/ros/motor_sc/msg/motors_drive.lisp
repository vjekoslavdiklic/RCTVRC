; Auto-generated. Do not edit!


(cl:in-package motor_sc-msg)


;//! \htmlinclude motors_drive.msg.html

(cl:defclass <motors_drive> (roslisp-msg-protocol:ros-message)
  ((cnt_data0
    :reader cnt_data0
    :initarg :cnt_data0
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 2 :element-type 'cl:fixnum :initial-element 0))
   (cnt_data1
    :reader cnt_data1
    :initarg :cnt_data1
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 2 :element-type 'cl:fixnum :initial-element 0))
   (cnt_data2
    :reader cnt_data2
    :initarg :cnt_data2
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 2 :element-type 'cl:fixnum :initial-element 0))
   (cnt_data3
    :reader cnt_data3
    :initarg :cnt_data3
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 2 :element-type 'cl:fixnum :initial-element 0))
   (servo
    :reader servo
    :initarg :servo
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 4 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass motors_drive (<motors_drive>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motors_drive>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motors_drive)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name motor_sc-msg:<motors_drive> is deprecated: use motor_sc-msg:motors_drive instead.")))

(cl:ensure-generic-function 'cnt_data0-val :lambda-list '(m))
(cl:defmethod cnt_data0-val ((m <motors_drive>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:cnt_data0-val is deprecated.  Use motor_sc-msg:cnt_data0 instead.")
  (cnt_data0 m))

(cl:ensure-generic-function 'cnt_data1-val :lambda-list '(m))
(cl:defmethod cnt_data1-val ((m <motors_drive>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:cnt_data1-val is deprecated.  Use motor_sc-msg:cnt_data1 instead.")
  (cnt_data1 m))

(cl:ensure-generic-function 'cnt_data2-val :lambda-list '(m))
(cl:defmethod cnt_data2-val ((m <motors_drive>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:cnt_data2-val is deprecated.  Use motor_sc-msg:cnt_data2 instead.")
  (cnt_data2 m))

(cl:ensure-generic-function 'cnt_data3-val :lambda-list '(m))
(cl:defmethod cnt_data3-val ((m <motors_drive>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:cnt_data3-val is deprecated.  Use motor_sc-msg:cnt_data3 instead.")
  (cnt_data3 m))

(cl:ensure-generic-function 'servo-val :lambda-list '(m))
(cl:defmethod servo-val ((m <motors_drive>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:servo-val is deprecated.  Use motor_sc-msg:servo instead.")
  (servo m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motors_drive>) ostream)
  "Serializes a message object of type '<motors_drive>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'cnt_data0))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'cnt_data1))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'cnt_data2))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'cnt_data3))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'servo))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motors_drive>) istream)
  "Deserializes a message object of type '<motors_drive>"
  (cl:setf (cl:slot-value msg 'cnt_data0) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'cnt_data0)))
    (cl:dotimes (i 2)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'cnt_data1) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'cnt_data1)))
    (cl:dotimes (i 2)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'cnt_data2) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'cnt_data2)))
    (cl:dotimes (i 2)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'cnt_data3) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'cnt_data3)))
    (cl:dotimes (i 2)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'servo) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'servo)))
    (cl:dotimes (i 4)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motors_drive>)))
  "Returns string type for a message object of type '<motors_drive>"
  "motor_sc/motors_drive")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motors_drive)))
  "Returns string type for a message object of type 'motors_drive"
  "motor_sc/motors_drive")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motors_drive>)))
  "Returns md5sum for a message object of type '<motors_drive>"
  "c798d1a8705d37440ee2346bd48b7af3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motors_drive)))
  "Returns md5sum for a message object of type 'motors_drive"
  "c798d1a8705d37440ee2346bd48b7af3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motors_drive>)))
  "Returns full string definition for message of type '<motors_drive>"
  (cl:format cl:nil "uint8[2] cnt_data0 ~%uint8[2] cnt_data1 ~%uint8[2] cnt_data2 ~%uint8[2] cnt_data3 ~%uint16[4] servo~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motors_drive)))
  "Returns full string definition for message of type 'motors_drive"
  (cl:format cl:nil "uint8[2] cnt_data0 ~%uint8[2] cnt_data1 ~%uint8[2] cnt_data2 ~%uint8[2] cnt_data3 ~%uint16[4] servo~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motors_drive>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'cnt_data0) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'cnt_data1) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'cnt_data2) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'cnt_data3) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'servo) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motors_drive>))
  "Converts a ROS message object to a list"
  (cl:list 'motors_drive
    (cl:cons ':cnt_data0 (cnt_data0 msg))
    (cl:cons ':cnt_data1 (cnt_data1 msg))
    (cl:cons ':cnt_data2 (cnt_data2 msg))
    (cl:cons ':cnt_data3 (cnt_data3 msg))
    (cl:cons ':servo (servo msg))
))
