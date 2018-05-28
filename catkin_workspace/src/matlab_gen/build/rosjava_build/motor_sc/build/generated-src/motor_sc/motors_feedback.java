package motor_sc;

public interface motors_feedback extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "motor_sc/motors_feedback";
  static final java.lang.String _DEFINITION = "uint8 ID\nfloat32[4] CUR\nfloat32[4] RPM";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  byte getID();
  void setID(byte value);
  float[] getCUR();
  void setCUR(float[] value);
  float[] getRPM();
  void setRPM(float[] value);
}
