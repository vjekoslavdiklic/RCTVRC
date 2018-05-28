#!/usr/bin/env python


import rospy
from std_msgs.msg import String
#from motor_sc.msg import mcnt_msg 
from sensor_msgs.msg import Joy
from motor_sc.msg import motors_drive
from motor_sc.msg import LED_controll

servo_min=500
servo_max=2500
servo_mid=servo_min+(servo_max-servo_min)/2
servo_space=servo_mid-servo_min

ov=motors_drive()
led=LED_controll()

pub0 = rospy.Publisher('motor_cnt_master', motors_drive, queue_size=10)
pub1 = rospy.Publisher('LEDs', LED_controll, queue_size=10)
#pub2 = rospy.Publisher('motor2_cnt', mcnt_msg, queue_size=10)
#pub3 = rospy.Publisher('motor3_cnt', mcnt_msg, queue_size=10)

def callback(data):
    #rospy.loginfo(data)
    print(data.axes[3])
    
    #motors right analog up/down
    if data.axes[3]>=0:
      ov.cnt_data0=[0, (abs(data.axes[3])*255)]
      ov.cnt_data1=[0, (abs(data.axes[3])*255)]
      ov.cnt_data2=[0, (abs(data.axes[3])*255)]
      ov.cnt_data3=[0, (abs(data.axes[3])*255)]

    if data.axes[3]<0:
      ov.cnt_data0=[(abs(data.axes[3])*255),0]
      ov.cnt_data1=[(abs(data.axes[3])*255),0]
      ov.cnt_data2=[(abs(data.axes[3])*255),0]
      ov.cnt_data3=[(abs(data.axes[3])*255),0]
    
    
    #servo right analog left/right
    ov.servo[0]=servo_mid+((data.axes[2]))*servo_space
    ov.servo[1]=servo_mid+((data.axes[2]))*servo_space
    ov.servo[2]=servo_mid+((data.axes[2]))*servo_space
    ov.servo[3]=servo_mid+((data.axes[2]))*servo_space
    
    if(not(data.buttons[3])):#without START pressed
      #xoA[]
      if(data.buttons[14]):     #x
        print("x")
        ov.cnt_data0=[0, 255]
      if(data.buttons[13]):     #o
        print("o")
        ov.cnt_data1=[0, 255]
      if(data.buttons[12]):     #A
        print("A")
        ov.cnt_data2=[0, 255]
      if(data.buttons[15]):     #[]
        print("[]")
        ov.cnt_data3=[0, 255]
      if(data.buttons[6]):     #DOWN
        print("[]")
        ov.servo[0]=servo_max
      if(data.buttons[5]):     #RIGHT
        print("[]")
        ov.servo[1]=servo_max
      if(data.buttons[4]):     #UP
        print("[]")
        ov.servo[2]=servo_max
      if(data.buttons[7]):     #LEFT
        print("[]")
        ov.servo[3]=servo_max
      led.LED_ID=int((data.axes[1])*8+8)
      led.RGB=[0,0,0]       
        
        
       
        
    if((data.buttons[3])):#with START pressed
      #xoA[]
      if(data.buttons[14]):#x
        print("x")
        ov.cnt_data0=[255,0]
      if(data.buttons[13]):#o
        print("o")
        ov.cnt_data1=[255, 0]
      if(data.buttons[12]):#A
        print("A")
        ov.cnt_data2=[255, 0]
      if(data.buttons[15]):#[]
        print("[]")
        ov.cnt_data3=[255, 0]
      if(data.buttons[6]):     #DOWN
        print("[]")
        ov.servo[0]=servo_min
      if(data.buttons[5]):     #RIGHT
        print("[]")
        ov.servo[1]=servo_min
      if(data.buttons[4]):     #UP
        print("[]")
        ov.servo[2]=servo_min
      if(data.buttons[7]):     #LEFT
        print("[]")
        ov.servo[3]=servo_min
        
      led.LED_ID=int((data.axes[1]*8)+8)
      led.RGB=[255,255,255]
    
    
    if((data.buttons[8])):
      if((data.buttons[10])and(data.buttons[11])):#L1 and R1
          led.LED_ID=100
          led.RGB=[255,255,255] 
      else:
          led.LED_ID=100
          led.RGB=[0,0,0]
        
  
    
    pub0.publish(ov)
    pub1.publish(led)
    #pub2.publish(ov)
    #pub3.publish(ov)



def listener():

    rospy.init_node('joycnt', anonymous=False)

    rospy.Subscriber('joy', Joy, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()