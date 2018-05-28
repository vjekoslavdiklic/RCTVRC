#!/usr/bin/env python


import rospy
from std_msgs.msg import String
from motor_sc.msg import mcnt_msg 
from sensor_msgs.msg import Joy

ov=mcnt_msg()
ov.ID =1
pub = rospy.Publisher('motor_controll_X', mcnt_msg, queue_size=10)

def callback(data):
    #rospy.loginfo(data)
    print(data.axes[3])
    if data.axes[3]>=0:
      ov.cnt_data=[0, (abs(data.axes[3])*255)]
    if data.axes[3]<0:
      ov.cnt_data=[(abs(data.axes[3])*255),0]
    
    pub.publish(ov)

def listener():

    rospy.init_node('joycnt', anonymous=False)

    rospy.Subscriber('joy', Joy, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()