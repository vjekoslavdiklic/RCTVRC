; Auto-generated. Do not edit!


(cl:in-package motor_sc-msg)


;//! \htmlinclude mcnt_msg.msg.html

(cl:defclass <mcnt_msg> (roslisp-msg-protocol:ros-message)
  ((ID
    :reader ID
    :initarg :ID
    :type cl:fixnum
    :initform 0)
   (cnt_data
    :reader cnt_data
    :initarg :cnt_data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 2 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass mcnt_msg (<mcnt_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mcnt_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mcnt_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name motor_sc-msg:<mcnt_msg> is deprecated: use motor_sc-msg:mcnt_msg instead.")))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <mcnt_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:ID-val is deprecated.  Use motor_sc-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'cnt_data-val :lambda-list '(m))
(cl:defmethod cnt_data-val ((m <mcnt_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:cnt_data-val is deprecated.  Use motor_sc-msg:cnt_data instead.")
  (cnt_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mcnt_msg>) ostream)
  "Serializes a message object of type '<mcnt_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'cnt_data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mcnt_msg>) istream)
  "Deserializes a message object of type '<mcnt_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cnt_data) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'cnt_data)))
    (cl:dotimes (i 2)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mcnt_msg>)))
  "Returns string type for a message object of type '<mcnt_msg>"
  "motor_sc/mcnt_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mcnt_msg)))
  "Returns string type for a message object of type 'mcnt_msg"
  "motor_sc/mcnt_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mcnt_msg>)))
  "Returns md5sum for a message object of type '<mcnt_msg>"
  "8f8d9d38dc81575a88dd6f44006cd842")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mcnt_msg)))
  "Returns md5sum for a message object of type 'mcnt_msg"
  "8f8d9d38dc81575a88dd6f44006cd842")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mcnt_msg>)))
  "Returns full string definition for message of type '<mcnt_msg>"
  (cl:format cl:nil "uint8 ID~%uint8[2] cnt_data ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mcnt_msg)))
  "Returns full string definition for message of type 'mcnt_msg"
  (cl:format cl:nil "uint8 ID~%uint8[2] cnt_data ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mcnt_msg>))
  (cl:+ 0
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'cnt_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mcnt_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'mcnt_msg
    (cl:cons ':ID (ID msg))
    (cl:cons ':cnt_data (cnt_data msg))
))
