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

class minf_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ID = null;
      this.CURRENT = null;
      this.RPM = null;
    }
    else {
      if (initObj.hasOwnProperty('ID')) {
        this.ID = initObj.ID
      }
      else {
        this.ID = 0;
      }
      if (initObj.hasOwnProperty('CURRENT')) {
        this.CURRENT = initObj.CURRENT
      }
      else {
        this.CURRENT = 0.0;
      }
      if (initObj.hasOwnProperty('RPM')) {
        this.RPM = initObj.RPM
      }
      else {
        this.RPM = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type minf_msg
    // Serialize message field [ID]
    bufferOffset = _serializer.uint8(obj.ID, buffer, bufferOffset);
    // Serialize message field [CURRENT]
    bufferOffset = _serializer.float32(obj.CURRENT, buffer, bufferOffset);
    // Serialize message field [RPM]
    bufferOffset = _serializer.float32(obj.RPM, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type minf_msg
    let len;
    let data = new minf_msg(null);
    // Deserialize message field [ID]
    data.ID = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [CURRENT]
    data.CURRENT = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [RPM]
    data.RPM = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'motor_sc/minf_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b85c91d3c46d01d1f24f2a77e165b6ca';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 ID
    float32 CURRENT
    float32 RPM
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new minf_msg(null);
    if (msg.ID !== undefined) {
      resolved.ID = msg.ID;
    }
    else {
      resolved.ID = 0
    }

    if (msg.CURRENT !== undefined) {
      resolved.CURRENT = msg.CURRENT;
    }
    else {
      resolved.CURRENT = 0.0
    }

    if (msg.RPM !== undefined) {
      resolved.RPM = msg.RPM;
    }
    else {
      resolved.RPM = 0.0
    }

    return resolved;
    }
};

module.exports = minf_msg;
