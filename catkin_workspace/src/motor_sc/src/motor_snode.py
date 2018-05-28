#!/usr/bin/env python

#X replace with motor ID

import numpy
import rospy
import serial
from std_msgs.msg import String
from motor_sc.msg import mcnt_msg 
from motor_sc.msg import minf_msg


port = serial.Serial("/dev/ttyUSB0", baudrate=1000000, timeout=3.0)
port1 = serial.Serial("/dev/ttyUSB1", baudrate=1000000, timeout=3.0)
feedback=minf_msg()
feedback.ID=1 #here goes ID
pub = rospy.Publisher('motor_feedback_X', minf_msg, queue_size=10)

def callback(data):
      
      #send data      
      port.write(data.cnt_data[0])
      port.write(data.cnt_data[1])
      port.write('\n')
      port1.write(data.cnt_data[0])
      port1.write(data.cnt_data[1])
      port1.write('\n')
      
      #read data
      tmp=port.readline()
      
      #convert data
      aa=[0,0] #fail safe value
      if ("_" in tmp)and(tmp.count(".") == 2)and(tmp.count("-") <= 1): #filter errors in read 
        aa=tmp.split("_")
      cur=aa[0]
      rpm=aa[1]
      feedback.CURRENT=float(cur)
      feedback.RPM=float(rpm)
      
      #publish data
      pub.publish(feedback)
    
    
    
def listener():
    rospy.init_node('motor_snode_X', anonymous=True)
    rospy.Subscriber('motor_controll_X', mcnt_msg, callback)
    
    rospy.spin()
      
    

if __name__ == '__main__':
    listener()