; Auto-generated. Do not edit!


(cl:in-package motor_sc-msg)


;//! \htmlinclude g_sens.msg.html

(cl:defclass <g_sens> (roslisp-msg-protocol:ros-message)
  ((Front_sens
    :reader Front_sens
    :initarg :Front_sens
    :type motor_sc-msg:sens9ax
    :initform (cl:make-instance 'motor_sc-msg:sens9ax))
   (Rear_sens
    :reader Rear_sens
    :initarg :Rear_sens
    :type motor_sc-msg:sens9ax
    :initform (cl:make-instance 'motor_sc-msg:sens9ax)))
)

(cl:defclass g_sens (<g_sens>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <g_sens>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'g_sens)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name motor_sc-msg:<g_sens> is deprecated: use motor_sc-msg:g_sens instead.")))

(cl:ensure-generic-function 'Front_sens-val :lambda-list '(m))
(cl:defmethod Front_sens-val ((m <g_sens>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:Front_sens-val is deprecated.  Use motor_sc-msg:Front_sens instead.")
  (Front_sens m))

(cl:ensure-generic-function 'Rear_sens-val :lambda-list '(m))
(cl:defmethod Rear_sens-val ((m <g_sens>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_sc-msg:Rear_sens-val is deprecated.  Use motor_sc-msg:Rear_sens instead.")
  (Rear_sens m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <g_sens>) ostream)
  "Serializes a message object of type '<g_sens>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Front_sens) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Rear_sens) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <g_sens>) istream)
  "Deserializes a message object of type '<g_sens>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Front_sens) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Rear_sens) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<g_sens>)))
  "Returns string type for a message object of type '<g_sens>"
  "motor_sc/g_sens")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'g_sens)))
  "Returns string type for a message object of type 'g_sens"
  "motor_sc/g_sens")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<g_sens>)))
  "Returns md5sum for a message object of type '<g_sens>"
  "2ba48ff788ab0557badb810806e50757")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'g_sens)))
  "Returns md5sum for a message object of type 'g_sens"
  "2ba48ff788ab0557badb810806e50757")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<g_sens>)))
  "Returns full string definition for message of type '<g_sens>"
  (cl:format cl:nil "sens9ax Front_sens~%sens9ax Rear_sens~%================================================================================~%MSG: motor_sc/sens9ax~%uint8 ID~%uint64 timestamp~%float64[3] compass~%float64[3] gyro~%float64[3] accel~%float64[3] fusionPose~%float64[4] fusionQPose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'g_sens)))
  "Returns full string definition for message of type 'g_sens"
  (cl:format cl:nil "sens9ax Front_sens~%sens9ax Rear_sens~%================================================================================~%MSG: motor_sc/sens9ax~%uint8 ID~%uint64 timestamp~%float64[3] compass~%float64[3] gyro~%float64[3] accel~%float64[3] fusionPose~%float64[4] fusionQPose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <g_sens>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Front_sens))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Rear_sens))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <g_sens>))
  "Converts a ROS message object to a list"
  (cl:list 'g_sens
    (cl:cons ':Front_sens (Front_sens msg))
    (cl:cons ':Rear_sens (Rear_sens msg))
))
