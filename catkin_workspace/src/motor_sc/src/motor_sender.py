#!/usr/bin/env python
#X replace with motor ID 

import rospy
#from std_msgs.msg import String
from motor_sc.msg import mcnt_msg 





def talker():
    pub = rospy.Publisher('motor_controll_X', mcnt_msg, queue_size=10)
    rospy.init_node('motor_controll_debug_node_X', anonymous=True)
    ov=mcnt_msg()
    rate = rospy.Rate(100) # 10hz
    i=0
    while not rospy.is_shutdown():
        i=i+1
        ov.ID =1
        ov.cnt_data=[0, i]
        if i==250:
              i=0
                                
        #rospy.loginfo(ov.ID)
        pub.publish(ov)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass