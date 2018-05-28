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

class sens9ax {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ID = null;
      this.timestamp = null;
      this.compass = null;
      this.gyro = null;
      this.accel = null;
      this.fusionPose = null;
      this.fusionQPose = null;
    }
    else {
      if (initObj.hasOwnProperty('ID')) {
        this.ID = initObj.ID
      }
      else {
        this.ID = 0;
      }
      if (initObj.hasOwnProperty('timestamp')) {
        this.timestamp = initObj.timestamp
      }
      else {
        this.timestamp = 0;
      }
      if (initObj.hasOwnProperty('compass')) {
        this.compass = initObj.compass
      }
      else {
        this.compass = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('gyro')) {
        this.gyro = initObj.gyro
      }
      else {
        this.gyro = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('accel')) {
        this.accel = initObj.accel
      }
      else {
        this.accel = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('fusionPose')) {
        this.fusionPose = initObj.fusionPose
      }
      else {
        this.fusionPose = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('fusionQPose')) {
        this.fusionQPose = initObj.fusionQPose
      }
      else {
        this.fusionQPose = new Array(4).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sens9ax
    // Serialize message field [ID]
    bufferOffset = _serializer.uint8(obj.ID, buffer, bufferOffset);
    // Serialize message field [timestamp]
    bufferOffset = _serializer.uint64(obj.timestamp, buffer, bufferOffset);
    // Check that the constant length array field [compass] has the right length
    if (obj.compass.length !== 3) {
      throw new Error('Unable to serialize array field compass - length must be 3')
    }
    // Serialize message field [compass]
    bufferOffset = _arraySerializer.float64(obj.compass, buffer, bufferOffset, 3);
    // Check that the constant length array field [gyro] has the right length
    if (obj.gyro.length !== 3) {
      throw new Error('Unable to serialize array field gyro - length must be 3')
    }
    // Serialize message field [gyro]
    bufferOffset = _arraySerializer.float64(obj.gyro, buffer, bufferOffset, 3);
    // Check that the constant length array field [accel] has the right length
    if (obj.accel.length !== 3) {
      throw new Error('Unable to serialize array field accel - length must be 3')
    }
    // Serialize message field [accel]
    bufferOffset = _arraySerializer.float64(obj.accel, buffer, bufferOffset, 3);
    // Check that the constant length array field [fusionPose] has the right length
    if (obj.fusionPose.length !== 3) {
      throw new Error('Unable to serialize array field fusionPose - length must be 3')
    }
    // Serialize message field [fusionPose]
    bufferOffset = _arraySerializer.float64(obj.fusionPose, buffer, bufferOffset, 3);
    // Check that the constant length array field [fusionQPose] has the right length
    if (obj.fusionQPose.length !== 4) {
      throw new Error('Unable to serialize array field fusionQPose - length must be 4')
    }
    // Serialize message field [fusionQPose]
    bufferOffset = _arraySerializer.float64(obj.fusionQPose, buffer, bufferOffset, 4);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sens9ax
    let len;
    let data = new sens9ax(null);
    // Deserialize message field [ID]
    data.ID = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [timestamp]
    data.timestamp = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [compass]
    data.compass = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [gyro]
    data.gyro = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [accel]
    data.accel = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [fusionPose]
    data.fusionPose = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [fusionQPose]
    data.fusionQPose = _arrayDeserializer.float64(buffer, bufferOffset, 4)
    return data;
  }

  static getMessageSize(object) {
    return 137;
  }

  static datatype() {
    // Returns string type for a message object
    return 'motor_sc/sens9ax';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ae05447afd7568f477683a6ee9035588';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 ID
    uint64 timestamp
    float64[3] compass
    float64[3] gyro
    float64[3] accel
    float64[3] fusionPose
    float64[4] fusionQPose
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sens9ax(null);
    if (msg.ID !== undefined) {
      resolved.ID = msg.ID;
    }
    else {
      resolved.ID = 0
    }

    if (msg.timestamp !== undefined) {
      resolved.timestamp = msg.timestamp;
    }
    else {
      resolved.timestamp = 0
    }

    if (msg.compass !== undefined) {
      resolved.compass = msg.compass;
    }
    else {
      resolved.compass = new Array(3).fill(0)
    }

    if (msg.gyro !== undefined) {
      resolved.gyro = msg.gyro;
    }
    else {
      resolved.gyro = new Array(3).fill(0)
    }

    if (msg.accel !== undefined) {
      resolved.accel = msg.accel;
    }
    else {
      resolved.accel = new Array(3).fill(0)
    }

    if (msg.fusionPose !== undefined) {
      resolved.fusionPose = msg.fusionPose;
    }
    else {
      resolved.fusionPose = new Array(3).fill(0)
    }

    if (msg.fusionQPose !== undefined) {
      resolved.fusionQPose = msg.fusionQPose;
    }
    else {
      resolved.fusionQPose = new Array(4).fill(0)
    }

    return resolved;
    }
};

module.exports = sens9ax;
