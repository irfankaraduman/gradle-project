# Minimal CMake required
cmake_minimum_required(VERSION 3.15)

set(CMAKE_INCLUDE_CURRENT_DIR FALSE)

set(LIB_SOURCE_FILES
  src/printio.cpp
)

add_library(lib OBJECT ${LIB_SOURCE_FILES})
target_compile_definitions(lib PUBLIC OBJLIB)
target_include_directories(lib PRIVATE
                          ${PROJECT_SOURCE_DIR}/shared/include
                          )

