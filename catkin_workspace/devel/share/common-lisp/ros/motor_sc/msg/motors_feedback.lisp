; Auto-generated. Do not edit!


(cl:in-package motor_sc-msg)


;//! \htmlinclude motors_feedback.msg.html

(cl:defclass <motors_feedback> (roslisp-msg-protocol:ros-message)
  ((ID
    :reader ID
    :initarg :ID
    :type cl:fixnum
    :initform 0)
   (CUR
    :reader CUR
    :initarg :CUR
    :type (cl:vector cl:float)
   :initform (cl:make-array 4 :element-type 'cl:float :initial-element 0.0))
   (RPM
    :reader RPM
    :initarg :RPM
    :type (cl:vector cl:float)
   :initform (cl:make-array 4 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass motors_feedback (<motors_feedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motors_feedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motors_feedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name motor_sc-msg:<motors_feedback> is deprecated: use motor_sc-msg:motors_feedback instead.")))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <motors_feedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:ID-val is deprecated.  Use motor_sc-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'CUR-val :lambda-list '(m))
(cl:defmethod CUR-val ((m <motors_feedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:CUR-val is deprecated.  Use motor_sc-msg:CUR instead.")
  (CUR m))

(cl:ensure-generic-function 'RPM-val :lambda-list '(m))
(cl:defmethod RPM-val ((m <motors_feedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:RPM-val is deprecated.  Use motor_sc-msg:RPM instead.")
  (RPM m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motors_feedback>) ostream)
  "Serializes a message object of type '<motors_feedback>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'CUR))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'RPM))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motors_feedback>) istream)
  "Deserializes a message object of type '<motors_feedback>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'CUR) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'CUR)))
    (cl:dotimes (i 4)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'RPM) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'RPM)))
    (cl:dotimes (i 4)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motors_feedback>)))
  "Returns string type for a message object of type '<motors_feedback>"
  "motor_sc/motors_feedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motors_feedback)))
  "Returns string type for a message object of type 'motors_feedback"
  "motor_sc/motors_feedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motors_feedback>)))
  "Returns md5sum for a message object of type '<motors_feedback>"
  "94194bc441d86cf5551f8c0ed1c128f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motors_feedback)))
  "Returns md5sum for a message object of type 'motors_feedback"
  "94194bc441d86cf5551f8c0ed1c128f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motors_feedback>)))
  "Returns full string definition for message of type '<motors_feedback>"
  (cl:format cl:nil "uint8 ID~%float32[4] CUR~%float32[4] RPM~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motors_feedback)))
  "Returns full string definition for message of type 'motors_feedback"
  (cl:format cl:nil "uint8 ID~%float32[4] CUR~%float32[4] RPM~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motors_feedback>))
  (cl:+ 0
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'CUR) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'RPM) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motors_feedback>))
  "Converts a ROS message object to a list"
  (cl:list 'motors_feedback
    (cl:cons ':ID (ID msg))
    (cl:cons ':CUR (CUR msg))
    (cl:cons ':RPM (RPM msg))
))
