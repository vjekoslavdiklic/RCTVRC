#!/usr/bin/env python
import sys, getopt

sys.path.append(".")
import RTIMU
import os.path
import time
import numpy as np
import rospy
import math

SETTINGS_FILE0 = "RTIMULib0"
SETTINGS_FILE1 = "RTIMULib1"

from motor_sc.msg import sens9ax
from motor_sc.msg import g_sens

out0=sens9ax()
out1=sens9ax()
out=g_sens()

pub = rospy.Publisher('sensors_out', g_sens, queue_size=10)


## setting file zero
##########################################################################################
print("Using settings file " + SETTINGS_FILE0 + ".ini")
if not os.path.exists(SETTINGS_FILE0 + ".ini"):
  print("Settings file does not exist, will be created")

s0 = RTIMU.Settings(SETTINGS_FILE0)
imu0 = RTIMU.RTIMU(s0)

print("IMU0 Name: " + imu0.IMUName())

if (not imu0.IMUInit()):
    print("IMU0 Init Failed")
    sys.exit(1)
else:
    print("IMU0 Init Succeeded")
##########################################################################################

## setting file zero
##########################################################################################
print("Using settings file " + SETTINGS_FILE1 + ".ini")
if not os.path.exists(SETTINGS_FILE1 + ".ini"):
  print("Settings file does not exist, will be created")

s1 = RTIMU.Settings(SETTINGS_FILE1)
imu1 = RTIMU.RTIMU(s1)

print("IMU1 Name: " + imu1.IMUName())

if (not imu1.IMUInit()):
    print("IMU1 Init Failed")
    sys.exit(1)
else:
    print("IMU1 Init Succeeded")
##########################################################################################


# this is a good time to set any fusion parameters

imu0.setSlerpPower(0.02)
imu0.setGyroEnable(True)
imu0.setAccelEnable(True)
imu0.setCompassEnable(True)

imu1.setSlerpPower(0.02)
imu1.setGyroEnable(True)
imu1.setAccelEnable(True)
imu1.setCompassEnable(True)




poll_interval = imu0.IMUGetPollInterval()
print("Recommended Poll0 Interval: %dmS\n" % poll_interval)
poll_interval = imu1.IMUGetPollInterval()
print("Recommended Poll1 Interval: %dmS\n" % poll_interval)



def showmedata(data):
    fusionPose = data["fusionPose"]
    timestamp=data["timestamp"]
    compass=data["compass"]
    gyro=data["gyro"]
    fusionQPose=data["fusionQPose"]
    accel=data["accel"]
    
    #print("r: %f p: %f y: %f" % (math.degrees(fusionPose[0]), 
    #    math.degrees(fusionPose[1]), math.degrees(fusionPose[2])))
    #print(data)#["fusionPose"])
    print("r: %f p: %f y: %f" % (math.degrees(fusionPose[0]),math.degrees(fusionPose[1]), math.degrees(fusionPose[2])))
    print("timestamp: %f" %timestamp)
    print("compass x: %f y: %f z: %f" % (compass[0],compass[1],compass[2]))
    print("gyro x: %f y: %f z: %f" % (gyro[0],gyro[1],gyro[2]))
    print("fusionQPose" ,fusionQPose)
    print("accel x: %f y: %f z: %f" % (accel[0],accel[1],accel[2]))
    print(out0)
    #time.sleep(poll_interval*10.0/1000.0)
    
    
def spi_com():
    #time.sleep(poll_interval*10.0/1000.0)
    #print("\033c")
    if imu0.IMURead():
     #x, y, z = imu.getFusionData()
     #print("%f %f %f" % (x,y,z))
     data0 = imu0.getIMUData()
     fusionQPose=data0["fusionQPose"]
     out.Front_sens.ID=0
     #print(fusionQPose)
     out.Front_sens.fusionQPose=data0["fusionQPose"]
     out.Front_sens.fusionPose=data0["fusionPose"]
     out.Front_sens.accel=data0["accel"]
     out.Front_sens.gyro=data0["gyro"]
     out.Front_sens.compass=data0["compass"]
     out.Front_sens.timestamp=data0["timestamp"]
     #print("prvi")
    # showmedata(data0)
    if imu1.IMURead():
     #x, y, z = imu.getFusionData()
     #print("%f %f %f" % (x,y,z))
     data1 = imu1.getIMUData()
     #data1 = data0
     
     out.Rear_sens.ID=1
     out.Rear_sens.fusionQPose=data1["fusionQPose"]
     out.Rear_sens.fusionPose=data1["fusionPose"]
     out.Rear_sens.accel=data1["accel"]
     out.Rear_sens.gyro=data1["gyro"]
     out.Rear_sens.compass=data1["compass"]
     out.Rear_sens.timestamp=data1["timestamp"]
     
     #print(type(out.Rear_sens.timestamp))
     #showmedata(data1)
     
    
    #out.Front_sens.ID=44
    pub.publish(out)
 
def callback_motors(data):
      pub.publish(out)


def callback_leds(LEDDATA):
      pub.publish(out)

    
    
def listener():
    rospy.init_node('spi_master', anonymous=True)
    #rospy.Subscriber('motor_cnt_master', motors_drive, callback_motors)
    #rospy.Subscriber('LEDs', LED_controll, callback_leds)
    while True:#
      spi_com()
      #time.sleep(0.1) 
    rospy.spin()

#while not rospy.is_shutdown():
   #<do stuff>
 #  if (flag==1):
     #i2c_com()
  #    print('ovo trazim') 

if __name__ == '__main__':
    listener()
