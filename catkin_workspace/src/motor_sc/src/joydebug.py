#!/usr/bin/env python


import rospy
from std_msgs.msg import String
from motor_sc.msg import mcnt_msg 
from sensor_msgs.msg import Joy


ov=mcnt_msg()

pub0 = rospy.Publisher('motor0_cnt', mcnt_msg, queue_size=10)
pub1 = rospy.Publisher('motor1_cnt', mcnt_msg, queue_size=10)
pub2 = rospy.Publisher('motor2_cnt', mcnt_msg, queue_size=10)
pub3 = rospy.Publisher('motor3_cnt', mcnt_msg, queue_size=10)

def callback(data):
    #rospy.loginfo(data)
    print(data.axes[3])
    if data.axes[3]>=0:
      ov.cnt_data=[0, (abs(data.axes[3])*255)]

    if data.axes[3]<0:
      ov.cnt_data=[(abs(data.axes[3])*255),0]

    
    pub0.publish(ov)
    pub1.publish(ov)
    pub2.publish(ov)
    pub3.publish(ov)



def listener():

    rospy.init_node('joycnt', anonymous=False)

    rospy.Subscriber('joy', Joy, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()