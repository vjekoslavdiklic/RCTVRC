package motor_sc;

public interface sens9ax extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "motor_sc/sens9ax";
  static final java.lang.String _DEFINITION = "uint8 ID\nuint64 timestamp\nfloat64[3] compass\nfloat64[3] gyro\nfloat64[3] accel\nfloat64[3] fusionPose\nfloat64[4] fusionQPose\n";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  byte getID();
  void setID(byte value);
  long getTimestamp();
  void setTimestamp(long value);
  double[] getCompass();
  void setCompass(double[] value);
  double[] getGyro();
  void setGyro(double[] value);
  double[] getAccel();
  void setAccel(double[] value);
  double[] getFusionPose();
  void setFusionPose(double[] value);
  double[] getFusionQPose();
  void setFusionQPose(double[] value);
}
