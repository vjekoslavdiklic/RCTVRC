; Auto-generated. Do not edit!


(cl:in-package motor_sc-msg)


;//! \htmlinclude minf_msg.msg.html

(cl:defclass <minf_msg> (roslisp-msg-protocol:ros-message)
  ((ID
    :reader ID
    :initarg :ID
    :type cl:fixnum
    :initform 0)
   (CURRENT
    :reader CURRENT
    :initarg :CURRENT
    :type cl:float
    :initform 0.0)
   (RPM
    :reader RPM
    :initarg :RPM
    :type cl:float
    :initform 0.0))
)

(cl:defclass minf_msg (<minf_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <minf_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'minf_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name motor_sc-msg:<minf_msg> is deprecated: use motor_sc-msg:minf_msg instead.")))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <minf_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:ID-val is deprecated.  Use motor_sc-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'CURRENT-val :lambda-list '(m))
(cl:defmethod CURRENT-val ((m <minf_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:CURRENT-val is deprecated.  Use motor_sc-msg:CURRENT instead.")
  (CURRENT m))

(cl:ensure-generic-function 'RPM-val :lambda-list '(m))
(cl:defmethod RPM-val ((m <minf_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:RPM-val is deprecated.  Use motor_sc-msg:RPM instead.")
  (RPM m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <minf_msg>) ostream)
  "Serializes a message object of type '<minf_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'CURRENT))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'RPM))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <minf_msg>) istream)
  "Deserializes a message object of type '<minf_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'CURRENT) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'RPM) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<minf_msg>)))
  "Returns string type for a message object of type '<minf_msg>"
  "motor_sc/minf_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'minf_msg)))
  "Returns string type for a message object of type 'minf_msg"
  "motor_sc/minf_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<minf_msg>)))
  "Returns md5sum for a message object of type '<minf_msg>"
  "b85c91d3c46d01d1f24f2a77e165b6ca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'minf_msg)))
  "Returns md5sum for a message object of type 'minf_msg"
  "b85c91d3c46d01d1f24f2a77e165b6ca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<minf_msg>)))
  "Returns full string definition for message of type '<minf_msg>"
  (cl:format cl:nil "uint8 ID~%float32 CURRENT~%float32 RPM~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'minf_msg)))
  "Returns full string definition for message of type 'minf_msg"
  (cl:format cl:nil "uint8 ID~%float32 CURRENT~%float32 RPM~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <minf_msg>))
  (cl:+ 0
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <minf_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'minf_msg
    (cl:cons ':ID (ID msg))
    (cl:cons ':CURRENT (CURRENT msg))
    (cl:cons ':RPM (RPM msg))
))
