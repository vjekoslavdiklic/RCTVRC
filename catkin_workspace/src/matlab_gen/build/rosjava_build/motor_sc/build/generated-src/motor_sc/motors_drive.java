package motor_sc;

public interface motors_drive extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "motor_sc/motors_drive";
  static final java.lang.String _DEFINITION = "uint8[2] cnt_data0 \nuint8[2] cnt_data1 \nuint8[2] cnt_data2 \nuint8[2] cnt_data3 \nuint16[4] servo";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  org.jboss.netty.buffer.ChannelBuffer getCntData0();
  void setCntData0(org.jboss.netty.buffer.ChannelBuffer value);
  org.jboss.netty.buffer.ChannelBuffer getCntData1();
  void setCntData1(org.jboss.netty.buffer.ChannelBuffer value);
  org.jboss.netty.buffer.ChannelBuffer getCntData2();
  void setCntData2(org.jboss.netty.buffer.ChannelBuffer value);
  org.jboss.netty.buffer.ChannelBuffer getCntData3();
  void setCntData3(org.jboss.netty.buffer.ChannelBuffer value);
  short[] getServo();
  void setServo(short[] value);
}
