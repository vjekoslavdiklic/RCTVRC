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

class motors_feedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ID = null;
      this.CUR = null;
      this.RPM = null;
    }
    else {
      if (initObj.hasOwnProperty('ID')) {
        this.ID = initObj.ID
      }
      else {
        this.ID = 0;
      }
      if (initObj.hasOwnProperty('CUR')) {
        this.CUR = initObj.CUR
      }
      else {
        this.CUR = new Array(4).fill(0);
      }
      if (initObj.hasOwnProperty('RPM')) {
        this.RPM = initObj.RPM
      }
      else {
        this.RPM = new Array(4).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type motors_feedback
    // Serialize message field [ID]
    bufferOffset = _serializer.uint8(obj.ID, buffer, bufferOffset);
    // Check that the constant length array field [CUR] has the right length
    if (obj.CUR.length !== 4) {
      throw new Error('Unable to serialize array field CUR - length must be 4')
    }
    // Serialize message field [CUR]
    bufferOffset = _arraySerializer.float32(obj.CUR, buffer, bufferOffset, 4);
    // Check that the constant length array field [RPM] has the right length
    if (obj.RPM.length !== 4) {
      throw new Error('Unable to serialize array field RPM - length must be 4')
    }
    // Serialize message field [RPM]
    bufferOffset = _arraySerializer.float32(obj.RPM, buffer, bufferOffset, 4);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type motors_feedback
    let len;
    let data = new motors_feedback(null);
    // Deserialize message field [ID]
    data.ID = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [CUR]
    data.CUR = _arrayDeserializer.float32(buffer, bufferOffset, 4)
    // Deserialize message field [RPM]
    data.RPM = _arrayDeserializer.float32(buffer, bufferOffset, 4)
    return data;
  }

  static getMessageSize(object) {
    return 33;
  }

  static datatype() {
    // Returns string type for a message object
    return 'motor_sc/motors_feedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '94194bc441d86cf5551f8c0ed1c128f4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 ID
    float32[4] CUR
    float32[4] RPM
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new motors_feedback(null);
    if (msg.ID !== undefined) {
      resolved.ID = msg.ID;
    }
    else {
      resolved.ID = 0
    }

    if (msg.CUR !== undefined) {
      resolved.CUR = msg.CUR;
    }
    else {
      resolved.CUR = new Array(4).fill(0)
    }

    if (msg.RPM !== undefined) {
      resolved.RPM = msg.RPM;
    }
    else {
      resolved.RPM = new Array(4).fill(0)
    }

    return resolved;
    }
};

module.exports = motors_feedback;
