package motor_sc;

public interface minf_msg extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "motor_sc/minf_msg";
  static final java.lang.String _DEFINITION = "uint8 ID\nfloat32 CURRENT\nfloat32 RPM";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  byte getID();
  void setID(byte value);
  float getCURRENT();
  void setCURRENT(float value);
  float getRPM();
  void setRPM(float value);
}
