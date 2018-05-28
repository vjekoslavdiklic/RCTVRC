#!/usr/bin/env python

#X replace with motor ID
import time
import easyi2c
import numpy
import rospy
import serial
from motor_sc.msg import motors_drive
from motor_sc.msg import motors_feedback
from motor_sc.msg import LED_controll

out_values0=[]#[0x00,0x00,0x00,0x0a]
out_values1=[]#[0x00,0x00,0x00,0x0a]
out_values2=[]#[0x00,0x00,0x00,0x0a]
out_values3=[]#[0x00,0x00,0x00,0x0a]
out_valuess=[]#[0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x0a]
out_values_led=[]

income_data0=[]
income_data1=[]
income_data2=[]
income_data3=[]
servo_income=[]
income_data_led=[]


flag=0

servo_up_limit=2300
servo_down_limit=1300


#i2c address
address0 = 0x04 #motor0
address1 = 0x08 #motor1
address2 = 0x16 #motor2
address3 = 0x20 #motor3
address4 = 0x30 #servos
address5 = 0x77 #LEDs

bus0=easyi2c.IIC(address0,1)
bus1=easyi2c.IIC(address1,1)
bus2=easyi2c.IIC(address2,1)
bus3=easyi2c.IIC(address3,1)
bus4=easyi2c.IIC(address4,1)
bus5=easyi2c.IIC(address5,1)

out=motors_feedback()

pub = rospy.Publisher('motors_feedback', motors_feedback, queue_size=10)

def l2dig(n):#function taking last 2 digits of number
    return int (str(n)[-3:]) if '.' in str(n)[-2:] else int(str(n)[-2:])

def conv_data(indata): #function form income date rading  
  indata=((indata.split("\r\n")))
  indata=indata[0] 
  indata=indata.split("_")
  cresult=[float(indata[0]),float(indata[1])]    
  return cresult
 
def i2c_com():
      #print(out_values0)
      income_data0=("".join(map(chr,bus0.i2c(out_values0,15))))
      income_data1=("".join(map(chr,bus1.i2c(out_values1,15))))
      income_data2=("".join(map(chr,bus2.i2c(out_values2,15))))
      income_data3=("".join(map(chr,bus3.i2c(out_values3,15))))
      servo_income=(bus4.i2c(out_valuess,0))
      income_data_led=(bus5.i2c(out_values_led,0))
      
      feedback0=conv_data(income_data0)
      feedback1=conv_data(income_data1)
      feedback2=conv_data(income_data2)
      feedback3=conv_data(income_data3)
      
      out.CUR[0]=feedback0[0]
      out.RPM[0]=feedback0[1]      
      out.CUR[1]=feedback1[0]
      out.RPM[1]=feedback1[1]     
      out.CUR[2]=feedback2[0]
      out.RPM[2]=feedback2[1]      
      out.CUR[3]=feedback3[0]
      out.RPM[3]=feedback3[1]
      
      pub.publish(out)
      
      

  
 
def callback_motors(data):
      
      #prepare data to send
      out_values0 = [0x00, data.cnt_data0[0],data.cnt_data0[1],0x0a] #[0x00,b_pwm,f_pwm,0x0a]
      out_values1 = [0x00, data.cnt_data1[0],data.cnt_data1[1],0x0a] #[0x00,b_pwm,f_pwm,0x0a]
      out_values2 = [0x00, data.cnt_data2[0],data.cnt_data2[1],0x0a] #[0x00,b_pwm,f_pwm,0x0a]
      out_values3 = [0x00, data.cnt_data3[0],data.cnt_data3[1],0x0a] #[0x00,b_pwm,f_pwm,0x0a]   
      out_valuess = [12,int(data.servo[0]/100),l2dig(data.servo[0]),int(data.servo[1]/100),l2dig(data.servo[1]),int(data.servo[2]/100),l2dig(data.servo[2]),int(data.servo[3]/100),l2dig(data.servo[3]),0x0a] #[0x00,ser,vo0,ser,vo1,ser,vo2,ser,vo3,0x0a] 
      
      #send recive rutine
      print(out_values0)
      income_data0=("".join(map(chr,bus0.i2c(out_values0,15))))
      income_data1=("".join(map(chr,bus1.i2c(out_values1,15))))
      income_data2=("".join(map(chr,bus2.i2c(out_values2,15))))
      income_data3=("".join(map(chr,bus3.i2c(out_values3,15))))
      servo_income=(bus4.i2c(out_valuess,0))
      
      
      feedback0=conv_data(income_data0)
      feedback1=conv_data(income_data1)
      feedback2=conv_data(income_data2)
      feedback3=conv_data(income_data3)
      
   
     
      out.CUR[0]=feedback0[0]
      out.RPM[0]=feedback0[1]      
      out.CUR[1]=feedback1[0]
      out.RPM[1]=feedback1[1]     
      out.CUR[2]=feedback2[0]
      out.RPM[2]=feedback2[1]      
      out.CUR[3]=feedback3[0]
      out.RPM[3]=feedback3[1]
      
      #publish data
      #pub.publish(out)
      #i2c_com()
      #flag=1
      

def callback_leds(LEDDATA):
      out_values_led = [LEDDATA.LED_ID,LEDDATA.RGB[0],LEDDATA.RGB[1],LEDDATA.RGB[2]]
      income_data_led=(bus5.i2c(out_values_led,1))
    
    
def listener():
    rospy.init_node('i2c_master', anonymous=True)
    rospy.Subscriber('motor_cnt_master', motors_drive, callback_motors)
    rospy.Subscriber('LEDs', LED_controll, callback_leds)
    while True:
      i2c_com()
      time.sleep(0.1) 
    #rospy.spin()

#while not rospy.is_shutdown():
   #<do stuff>
 #  if (flag==1):
     #i2c_com()
  #    print('ovo trazim') 

if __name__ == '__main__':
    listener()
