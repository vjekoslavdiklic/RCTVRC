package motor_sc;

public interface LED_controll extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "motor_sc/LED_controll";
  static final java.lang.String _DEFINITION = "uint8 LED_ID \nuint8[3] RGB";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  byte getLEDID();
  void setLEDID(byte value);
  org.jboss.netty.buffer.ChannelBuffer getRGB();
  void setRGB(org.jboss.netty.buffer.ChannelBuffer value);
}
