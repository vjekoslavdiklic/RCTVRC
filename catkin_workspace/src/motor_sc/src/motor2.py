#!/usr/bin/env python

#X replace with motor ID

import numpy
import rospy
import serial
from motor_sc.msg import mcnt_msg
from motor_sc.msg import minf_msg


port0 = serial.Serial("/dev/ttyUSB2", baudrate=1000000)


out=minf_msg()


pub = rospy.Publisher('motor2_feedback',minf_msg, queue_size=10)

 
def callback(data):
      
      #send data      
      port0.write(data.cnt_data[0])
      port0.write(data.cnt_data[1])
      port0.write('\n')
      tmp=port0.readline()
      
      #convert data
      aa=[0,0] #fail safe value
      if ("_" in tmp)and(tmp.count(".") == 2)and(tmp.count("-") <= 1): #filter errors in read 
        aa=tmp.split("_")
      cur=aa[0]
      rpm=aa[1]
      out.CURRENT=float(cur)
      out.RPM=float(rpm)
      #publish data
      pub.publish(out)
    
    
def listener():
    rospy.init_node('motor2_node', anonymous=True)
    rospy.Subscriber('motor2_cnt',mcnt_msg, callback)
    
    rospy.spin()
      
    

if __name__ == '__main__':
    listener()