# Minamal CMake required
cmake_minimum_required(VERSION 3.15)

project(
  SASTAppCC
  VERSION 0.0.1
  LANGUAGES CXX
)

IF(NOT CMAKE_SYSTEM_NAME STREQUAL "Linux")
  message(FATAL_ERROR "SASTAppSampleCC is not configured for '${CMAKE_SYSTEM_NAME}' system")
ENDIF()

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_INCLUDE_CURRENT_DIR FALSE)

option(APP_TARGET_X86 "Set application target to x86" FALSE)

IF(APP_TARGET_X86)
  message(STATUS "Application target 32-bit")
  set(CMAKE_CXX_FLAGS -m32)
ELSE()
  message(STATUS "Application target 64-bit")
ENDIF()

add_subdirectory(lib)
add_subdirectory(app)
