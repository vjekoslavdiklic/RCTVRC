; Auto-generated. Do not edit!


(cl:in-package motor_sc-msg)


;//! \htmlinclude LED_controll.msg.html

(cl:defclass <LED_controll> (roslisp-msg-protocol:ros-message)
  ((LED_ID
    :reader LED_ID
    :initarg :LED_ID
    :type cl:fixnum
    :initform 0)
   (RGB
    :reader RGB
    :initarg :RGB
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 3 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass LED_controll (<LED_controll>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LED_controll>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LED_controll)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name motor_sc-msg:<LED_controll> is deprecated: use motor_sc-msg:LED_controll instead.")))

(cl:ensure-generic-function 'LED_ID-val :lambda-list '(m))
(cl:defmethod LED_ID-val ((m <LED_controll>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:LED_ID-val is deprecated.  Use motor_sc-msg:LED_ID instead.")
  (LED_ID m))

(cl:ensure-generic-function 'RGB-val :lambda-list '(m))
(cl:defmethod RGB-val ((m <LED_controll>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:RGB-val is deprecated.  Use motor_sc-msg:RGB instead.")
  (RGB m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LED_controll>) ostream)
  "Serializes a message object of type '<LED_controll>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LED_ID)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'RGB))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LED_controll>) istream)
  "Deserializes a message object of type '<LED_controll>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LED_ID)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'RGB) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'RGB)))
    (cl:dotimes (i 3)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LED_controll>)))
  "Returns string type for a message object of type '<LED_controll>"
  "motor_sc/LED_controll")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LED_controll)))
  "Returns string type for a message object of type 'LED_controll"
  "motor_sc/LED_controll")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LED_controll>)))
  "Returns md5sum for a message object of type '<LED_controll>"
  "7863f5ba3af370bb462fe9903dbd7387")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LED_controll)))
  "Returns md5sum for a message object of type 'LED_controll"
  "7863f5ba3af370bb462fe9903dbd7387")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LED_controll>)))
  "Returns full string definition for message of type '<LED_controll>"
  (cl:format cl:nil "uint8 LED_ID ~%uint8[3] RGB~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LED_controll)))
  "Returns full string definition for message of type 'LED_controll"
  (cl:format cl:nil "uint8 LED_ID ~%uint8[3] RGB~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LED_controll>))
  (cl:+ 0
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'RGB) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LED_controll>))
  "Converts a ROS message object to a list"
  (cl:list 'LED_controll
    (cl:cons ':LED_ID (LED_ID msg))
    (cl:cons ':RGB (RGB msg))
))
