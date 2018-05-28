package motor_sc;

public interface g_sens extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "motor_sc/g_sens";
  static final java.lang.String _DEFINITION = "sens9ax Front_sens\nsens9ax Rear_sens";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  motor_sc.sens9ax getFrontSens();
  void setFrontSens(motor_sc.sens9ax value);
  motor_sc.sens9ax getRearSens();
  void setRearSens(motor_sc.sens9ax value);
}
