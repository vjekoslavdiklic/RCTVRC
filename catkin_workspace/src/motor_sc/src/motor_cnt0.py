#!/usr/bin/env python

#X replace with motor ID

import numpy
import rospy
import serial
from motor_sc.msg import motors_drive
from motor_sc.msg import motors_feedback


port0 = serial.Serial("/dev/ttyUSB0", baudrate=115200)


out=motors_feedback()
#inn=motors_drive()

pub = rospy.Publisher('motors_feedback', motors_feedback, queue_size=10)

 
def callback(data):
      
      #send data      
      port0.write(data.cnt_data0[0])
      port0.write(data.cnt_data0[1])
      port0.write('\n')
      tmp=port0.readline()
      
      #convert data
      aa=[0,0] #fail safe value
      if ("_" in tmp)and(tmp.count(".") == 2)and(tmp.count("-") <= 1): #filter errors in read 
        aa=tmp.split("_")
      cur=aa[0]
      rpm=aa[1]
      out.CUR[0]=float(cur)
      out.RPM[0]=float(rpm)
      #publish data
      pub.publish(out)
    
    
def listener():
    rospy.init_node('motor_cnt_master', anonymous=True)
    rospy.Subscriber('motors_drive', motors_drive, callback)
    
    rospy.spin()
      
    

if __name__ == '__main__':
    listener()