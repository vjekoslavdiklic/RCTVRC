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

class mcnt_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ID = null;
      this.cnt_data = null;
    }
    else {
      if (initObj.hasOwnProperty('ID')) {
        this.ID = initObj.ID
      }
      else {
        this.ID = 0;
      }
      if (initObj.hasOwnProperty('cnt_data')) {
        this.cnt_data = initObj.cnt_data
      }
      else {
        this.cnt_data = new Array(2).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mcnt_msg
    // Serialize message field [ID]
    bufferOffset = _serializer.uint8(obj.ID, buffer, bufferOffset);
    // Check that the constant length array field [cnt_data] has the right length
    if (obj.cnt_data.length !== 2) {
      throw new Error('Unable to serialize array field cnt_data - length must be 2')
    }
    // Serialize message field [cnt_data]
    bufferOffset = _arraySerializer.uint8(obj.cnt_data, buffer, bufferOffset, 2);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mcnt_msg
    let len;
    let data = new mcnt_msg(null);
    // Deserialize message field [ID]
    data.ID = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [cnt_data]
    data.cnt_data = _arrayDeserializer.uint8(buffer, bufferOffset, 2)
    return data;
  }

  static getMessageSize(object) {
    return 3;
  }

  static datatype() {
    // Returns string type for a message object
    return 'motor_sc/mcnt_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8f8d9d38dc81575a88dd6f44006cd842';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 ID
    uint8[2] cnt_data 
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mcnt_msg(null);
    if (msg.ID !== undefined) {
      resolved.ID = msg.ID;
    }
    else {
      resolved.ID = 0
    }

    if (msg.cnt_data !== undefined) {
      resolved.cnt_data = msg.cnt_data;
    }
    else {
      resolved.cnt_data = new Array(2).fill(0)
    }

    return resolved;
    }
};

module.exports = mcnt_msg;
