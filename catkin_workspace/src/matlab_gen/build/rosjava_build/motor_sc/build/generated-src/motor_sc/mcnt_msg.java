package motor_sc;

public interface mcnt_msg extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "motor_sc/mcnt_msg";
  static final java.lang.String _DEFINITION = "uint8 ID\nuint8[2] cnt_data ";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  byte getID();
  void setID(byte value);
  org.jboss.netty.buffer.ChannelBuffer getCntData();
  void setCntData(org.jboss.netty.buffer.ChannelBuffer value);
}
