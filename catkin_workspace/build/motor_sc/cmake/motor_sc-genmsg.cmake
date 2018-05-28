# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "motor_sc: 7 messages, 0 services")

set(MSG_I_FLAGS "-Imotor_sc:/home/rctvrc/catkin_workspace/src/motor_sc/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(motor_sc_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_drive.msg" NAME_WE)
add_custom_target(_motor_sc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "motor_sc" "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_drive.msg" ""
)

get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/g_sens.msg" NAME_WE)
add_custom_target(_motor_sc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "motor_sc" "/home/rctvrc/catkin_workspace/src/motor_sc/msg/g_sens.msg" "motor_sc/sens9ax"
)

get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_feedback.msg" NAME_WE)
add_custom_target(_motor_sc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "motor_sc" "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_feedback.msg" ""
)

get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/mcnt_msg.msg" NAME_WE)
add_custom_target(_motor_sc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "motor_sc" "/home/rctvrc/catkin_workspace/src/motor_sc/msg/mcnt_msg.msg" ""
)

get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/LED_controll.msg" NAME_WE)
add_custom_target(_motor_sc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "motor_sc" "/home/rctvrc/catkin_workspace/src/motor_sc/msg/LED_controll.msg" ""
)

get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg" NAME_WE)
add_custom_target(_motor_sc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "motor_sc" "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg" ""
)

get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/minf_msg.msg" NAME_WE)
add_custom_target(_motor_sc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "motor_sc" "/home/rctvrc/catkin_workspace/src/motor_sc/msg/minf_msg.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_drive.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/motor_sc
)
_generate_msg_cpp(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/g_sens.msg"
  "${MSG_I_FLAGS}"
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/motor_sc
)
_generate_msg_cpp(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/motor_sc
)
_generate_msg_cpp(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/mcnt_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/motor_sc
)
_generate_msg_cpp(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/LED_controll.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/motor_sc
)
_generate_msg_cpp(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/motor_sc
)
_generate_msg_cpp(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/minf_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/motor_sc
)

### Generating Services

### Generating Module File
_generate_module_cpp(motor_sc
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/motor_sc
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(motor_sc_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(motor_sc_generate_messages motor_sc_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_drive.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_cpp _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/g_sens.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_cpp _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_feedback.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_cpp _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/mcnt_msg.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_cpp _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/LED_controll.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_cpp _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_cpp _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/minf_msg.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_cpp _motor_sc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(motor_sc_gencpp)
add_dependencies(motor_sc_gencpp motor_sc_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS motor_sc_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_drive.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/motor_sc
)
_generate_msg_eus(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/g_sens.msg"
  "${MSG_I_FLAGS}"
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/motor_sc
)
_generate_msg_eus(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/motor_sc
)
_generate_msg_eus(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/mcnt_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/motor_sc
)
_generate_msg_eus(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/LED_controll.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/motor_sc
)
_generate_msg_eus(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/motor_sc
)
_generate_msg_eus(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/minf_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/motor_sc
)

### Generating Services

### Generating Module File
_generate_module_eus(motor_sc
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/motor_sc
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(motor_sc_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(motor_sc_generate_messages motor_sc_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_drive.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_eus _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/g_sens.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_eus _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_feedback.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_eus _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/mcnt_msg.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_eus _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/LED_controll.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_eus _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_eus _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/minf_msg.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_eus _motor_sc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(motor_sc_geneus)
add_dependencies(motor_sc_geneus motor_sc_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS motor_sc_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_drive.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/motor_sc
)
_generate_msg_lisp(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/g_sens.msg"
  "${MSG_I_FLAGS}"
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/motor_sc
)
_generate_msg_lisp(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/motor_sc
)
_generate_msg_lisp(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/mcnt_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/motor_sc
)
_generate_msg_lisp(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/LED_controll.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/motor_sc
)
_generate_msg_lisp(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/motor_sc
)
_generate_msg_lisp(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/minf_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/motor_sc
)

### Generating Services

### Generating Module File
_generate_module_lisp(motor_sc
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/motor_sc
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(motor_sc_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(motor_sc_generate_messages motor_sc_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_drive.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_lisp _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/g_sens.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_lisp _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_feedback.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_lisp _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/mcnt_msg.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_lisp _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/LED_controll.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_lisp _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_lisp _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/minf_msg.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_lisp _motor_sc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(motor_sc_genlisp)
add_dependencies(motor_sc_genlisp motor_sc_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS motor_sc_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_drive.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/motor_sc
)
_generate_msg_nodejs(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/g_sens.msg"
  "${MSG_I_FLAGS}"
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/motor_sc
)
_generate_msg_nodejs(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/motor_sc
)
_generate_msg_nodejs(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/mcnt_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/motor_sc
)
_generate_msg_nodejs(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/LED_controll.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/motor_sc
)
_generate_msg_nodejs(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/motor_sc
)
_generate_msg_nodejs(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/minf_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/motor_sc
)

### Generating Services

### Generating Module File
_generate_module_nodejs(motor_sc
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/motor_sc
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(motor_sc_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(motor_sc_generate_messages motor_sc_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_drive.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_nodejs _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/g_sens.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_nodejs _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_feedback.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_nodejs _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/mcnt_msg.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_nodejs _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/LED_controll.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_nodejs _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_nodejs _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/minf_msg.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_nodejs _motor_sc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(motor_sc_gennodejs)
add_dependencies(motor_sc_gennodejs motor_sc_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS motor_sc_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_drive.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/motor_sc
)
_generate_msg_py(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/g_sens.msg"
  "${MSG_I_FLAGS}"
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/motor_sc
)
_generate_msg_py(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/motor_sc
)
_generate_msg_py(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/mcnt_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/motor_sc
)
_generate_msg_py(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/LED_controll.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/motor_sc
)
_generate_msg_py(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/motor_sc
)
_generate_msg_py(motor_sc
  "/home/rctvrc/catkin_workspace/src/motor_sc/msg/minf_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/motor_sc
)

### Generating Services

### Generating Module File
_generate_module_py(motor_sc
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/motor_sc
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(motor_sc_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(motor_sc_generate_messages motor_sc_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_drive.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_py _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/g_sens.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_py _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/motors_feedback.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_py _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/mcnt_msg.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_py _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/LED_controll.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_py _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/sens9ax.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_py _motor_sc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rctvrc/catkin_workspace/src/motor_sc/msg/minf_msg.msg" NAME_WE)
add_dependencies(motor_sc_generate_messages_py _motor_sc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(motor_sc_genpy)
add_dependencies(motor_sc_genpy motor_sc_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS motor_sc_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/motor_sc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/motor_sc
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(motor_sc_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/motor_sc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/motor_sc
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(motor_sc_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/motor_sc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/motor_sc
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(motor_sc_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/motor_sc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/motor_sc
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(motor_sc_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/motor_sc)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/motor_sc\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/motor_sc
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(motor_sc_generate_messages_py std_msgs_generate_messages_py)
endif()
