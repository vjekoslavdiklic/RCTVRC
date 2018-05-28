// Auto-generated. Do not edit!

// (in-package motor_sc.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sens9ax = require('./sens9ax.js');

//-----------------------------------------------------------

class g_sens {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Front_sens = null;
      this.Rear_sens = null;
    }
    else {
      if (initObj.hasOwnProperty('Front_sens')) {
        this.Front_sens = initObj.Front_sens
      }
      else {
        this.Front_sens = new sens9ax();
      }
      if (initObj.hasOwnProperty('Rear_sens')) {
        this.Rear_sens = initObj.Rear_sens
      }
      else {
        this.Rear_sens = new sens9ax();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type g_sens
    // Serialize message field [Front_sens]
    bufferOffset = sens9ax.serialize(obj.Front_sens, buffer, bufferOffset);
    // Serialize message field [Rear_sens]
    bufferOffset = sens9ax.serialize(obj.Rear_sens, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type g_sens
    let len;
    let data = new g_sens(null);
    // Deserialize message field [Front_sens]
    data.Front_sens = sens9ax.deserialize(buffer, bufferOffset);
    // Deserialize message field [Rear_sens]
    data.Rear_sens = sens9ax.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 274;
  }

  static datatype() {
    // Returns string type for a message object
    return 'motor_sc/g_sens';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2ba48ff788ab0557badb810806e50757';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    sens9ax Front_sens
    sens9ax Rear_sens
    ================================================================================
    MSG: motor_sc/sens9ax
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
    const resolved = new g_sens(null);
    if (msg.Front_sens !== undefined) {
      resolved.Front_sens = sens9ax.Resolve(msg.Front_sens)
    }
    else {
      resolved.Front_sens = new sens9ax()
    }

    if (msg.Rear_sens !== undefined) {
      resolved.Rear_sens = sens9ax.Resolve(msg.Rear_sens)
    }
    else {
      resolved.Rear_sens = new sens9ax()
    }

    return resolved;
    }
};

module.exports = g_sens;
