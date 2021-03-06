# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from motor_sc/motors_drive.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class motors_drive(genpy.Message):
  _md5sum = "c798d1a8705d37440ee2346bd48b7af3"
  _type = "motor_sc/motors_drive"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """uint8[2] cnt_data0 
uint8[2] cnt_data1 
uint8[2] cnt_data2 
uint8[2] cnt_data3 
uint16[4] servo"""
  __slots__ = ['cnt_data0','cnt_data1','cnt_data2','cnt_data3','servo']
  _slot_types = ['uint8[2]','uint8[2]','uint8[2]','uint8[2]','uint16[4]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       cnt_data0,cnt_data1,cnt_data2,cnt_data3,servo

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(motors_drive, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.cnt_data0 is None:
        self.cnt_data0 = b'\0'*2
      if self.cnt_data1 is None:
        self.cnt_data1 = b'\0'*2
      if self.cnt_data2 is None:
        self.cnt_data2 = b'\0'*2
      if self.cnt_data3 is None:
        self.cnt_data3 = b'\0'*2
      if self.servo is None:
        self.servo = [0] * 4
    else:
      self.cnt_data0 = b'\0'*2
      self.cnt_data1 = b'\0'*2
      self.cnt_data2 = b'\0'*2
      self.cnt_data3 = b'\0'*2
      self.servo = [0] * 4

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self.cnt_data0
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(_get_struct_2B().pack(*_x))
      else:
        buff.write(_get_struct_2s().pack(_x))
      _x = self.cnt_data1
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(_get_struct_2B().pack(*_x))
      else:
        buff.write(_get_struct_2s().pack(_x))
      _x = self.cnt_data2
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(_get_struct_2B().pack(*_x))
      else:
        buff.write(_get_struct_2s().pack(_x))
      _x = self.cnt_data3
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(_get_struct_2B().pack(*_x))
      else:
        buff.write(_get_struct_2s().pack(_x))
      buff.write(_get_struct_4H().pack(*self.servo))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      start = end
      end += 2
      self.cnt_data0 = str[start:end]
      start = end
      end += 2
      self.cnt_data1 = str[start:end]
      start = end
      end += 2
      self.cnt_data2 = str[start:end]
      start = end
      end += 2
      self.cnt_data3 = str[start:end]
      start = end
      end += 8
      self.servo = _get_struct_4H().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.cnt_data0
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(_get_struct_2B().pack(*_x))
      else:
        buff.write(_get_struct_2s().pack(_x))
      _x = self.cnt_data1
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(_get_struct_2B().pack(*_x))
      else:
        buff.write(_get_struct_2s().pack(_x))
      _x = self.cnt_data2
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(_get_struct_2B().pack(*_x))
      else:
        buff.write(_get_struct_2s().pack(_x))
      _x = self.cnt_data3
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(_get_struct_2B().pack(*_x))
      else:
        buff.write(_get_struct_2s().pack(_x))
      buff.write(self.servo.tostring())
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      start = end
      end += 2
      self.cnt_data0 = str[start:end]
      start = end
      end += 2
      self.cnt_data1 = str[start:end]
      start = end
      end += 2
      self.cnt_data2 = str[start:end]
      start = end
      end += 2
      self.cnt_data3 = str[start:end]
      start = end
      end += 8
      self.servo = numpy.frombuffer(str[start:end], dtype=numpy.uint16, count=4)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_4H = None
def _get_struct_4H():
    global _struct_4H
    if _struct_4H is None:
        _struct_4H = struct.Struct("<4H")
    return _struct_4H
_struct_2B = None
def _get_struct_2B():
    global _struct_2B
    if _struct_2B is None:
        _struct_2B = struct.Struct("<2B")
    return _struct_2B
_struct_2s = None
def _get_struct_2s():
    global _struct_2s
    if _struct_2s is None:
        _struct_2s = struct.Struct("<2s")
    return _struct_2s
