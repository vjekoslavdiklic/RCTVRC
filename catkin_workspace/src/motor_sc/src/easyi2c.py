#!/usr/bin/env python

# Contributed by Raju and updated by Jim
# 
# Use:
# import easyi2c 
# dev = easyi2c.IIC(<device i2c address 7 bit>,<Bus number>)
# example
# dev = easyi2c.IIC(0x32,1)
# dev.i2c([10,1,0,1],1) # sends bytes 10,1,0,1 and returns 1 byte
# dev.close()
#
import io
import fcntl

I2C_SLAVE=0x0703

# linuxi2c.py
# 2017-03-19
# Public Domain

# Based on 'notSMB' for an easier way to access the i2c bus using just one
# function. The main difference between this and notSMB is that the bus
# here will be dedicated to 1 device address
class IIC:
   def __init__(self, device, bus):

      self.fr = io.open("/dev/i2c-"+str(bus), "rb", buffering=0)
      self.fw = io.open("/dev/i2c-"+str(bus), "wb", buffering=0)

      # set device address

      fcntl.ioctl(self.fr, I2C_SLAVE, device)
      fcntl.ioctl(self.fw, I2C_SLAVE, device)

   def write(self, data):
      if type(data) is list:
         data = bytes(data)
      self.fw.write(data)

   def read(self, count):
      s = ''
      l = []
      s = self.fr.read(count)
      if len(s) != 0:
         for n in s:
            l.append(ord(n))
      return l
    

   def close(self):
      self.fw.close()
      self.fr.close()
      
   def i2c(self,listin,nout):
       rv=0	
       self.write(bytearray(listin))
       if nout != 0:
           rv = self.read(nout)
       return rv    

