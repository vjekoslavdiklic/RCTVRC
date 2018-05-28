// Auto-generated. Do not edit!

// (in-package motor_sc.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class motors_drive {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cnt_data0 = null;
      this.cnt_data1 = null;
      this.cnt_data2 = null;
      this.cnt_data3 = null;
      this.servo = null;
    }
    else {
      if (initObj.hasOwnProperty('cnt_data0')) {
        this.cnt_data0 = initObj.cnt_data0
      }
      else {
        this.cnt_data0 = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('cnt_data1')) {
        this.cnt_data1 = initObj.cnt_data1
      }
      else {
        this.cnt_data1 = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('cnt_data2')) {
        this.cnt_data2 = initObj.cnt_data2
      }
      else {
        this.cnt_data2 = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('cnt_data3')) {
        this.cnt_data3 = initObj.cnt_data3
      }
      else {
        this.cnt_data3 = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('servo')) {
        this.servo = initObj.servo
      }
      else {
        this.servo = new Array(4).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type motors_drive
    // Check that the constant length array field [cnt_data0] has the right length
    if (obj.cnt_data0.length !== 2) {
      throw new Error('Unable to serialize array field cnt_data0 - length must be 2')
    }
    // Serialize message field [cnt_data0]
    bufferOffset = _arraySerializer.uint8(obj.cnt_data0, buffer, bufferOffset, 2);
    // Check that the constant length array field [cnt_data1] has the right length
    if (obj.cnt_data1.length !== 2) {
      throw new Error('Unable to serialize array field cnt_data1 - length must be 2')
    }
    // Serialize message field [cnt_data1]
    bufferOffset = _arraySerializer.uint8(obj.cnt_data1, buffer, bufferOffset, 2);
    // Check that the constant length array field [cnt_data2] has the right length
    if (obj.cnt_data2.length !== 2) {
      throw new Error('Unable to serialize array field cnt_data2 - length must be 2')
    }
    // Serialize message field [cnt_data2]
    bufferOffset = _arraySerializer.uint8(obj.cnt_data2, buffer, bufferOffset, 2);
    // Check that the constant length array field [cnt_data3] has the right length
    if (obj.cnt_data3.length !== 2) {
      throw new Error('Unable to serialize array field cnt_data3 - length must be 2')
    }
    // Serialize message field [cnt_data3]
    bufferOffset = _arraySerializer.uint8(obj.cnt_data3, buffer, bufferOffset, 2);
    // Check that the constant length array field [servo] has the right length
    if (obj.servo.length !== 4) {
      throw new Error('Unable to serialize array field servo - length must be 4')
    }
    // Serialize message field [servo]
    bufferOffset = _arraySerializer.uint16(obj.servo, buffer, bufferOffset, 4);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type motors_drive
    let len;
    let data = new motors_drive(null);
    // Deserialize message field [cnt_data0]
    data.cnt_data0 = _arrayDeserializer.uint8(buffer, bufferOffset, 2)
    // Deserialize message field [cnt_data1]
    data.cnt_data1 = _arrayDeserializer.uint8(buffer, bufferOffset, 2)
    // Deserialize message field [cnt_data2]
    data.cnt_data2 = _arrayDeserializer.uint8(buffer, bufferOffset, 2)
    // Deserialize message field [cnt_data3]
    data.cnt_data3 = _arrayDeserializer.uint8(buffer, bufferOffset, 2)
    // Deserialize message field [servo]
    data.servo = _arrayDeserializer.uint16(buffer, bufferOffset, 4)
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'motor_sc/motors_drive';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c798d1a8705d37440ee2346bd48b7af3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8[2] cnt_data0 
    uint8[2] cnt_data1 
    uint8[2] cnt_data2 
    uint8[2] cnt_data3 
    uint16[4] servo
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new motors_drive(null);
    if (msg.cnt_data0 !== undefined) {
      resolved.cnt_data0 = msg.cnt_data0;
    }
    else {
      resolved.cnt_data0 = new Array(2).fill(0)
    }

    if (msg.cnt_data1 !== undefined) {
      resolved.cnt_data1 = msg.cnt_data1;
    }
    else {
      resolved.cnt_data1 = new Array(2).fill(0)
    }

    if (msg.cnt_data2 !== undefined) {
      resolved.cnt_data2 = msg.cnt_data2;
    }
    else {
      resolved.cnt_data2 = new Array(2).fill(0)
    }

    if (msg.cnt_data3 !== undefined) {
      resolved.cnt_data3 = msg.cnt_data3;
    }
    else {
      resolved.cnt_data3 = new Array(2).fill(0)
    }

    if (msg.servo !== undefined) {
      resolved.servo = msg.servo;
    }
    else {
      resolved.servo = new Array(4).fill(0)
    }

    return resolved;
    }
};

module.exports = motors_drive;
