# Minimal CMake required
cmake_minimum_required(VERSION 3.15)

set(CMAKE_INCLUDE_CURRENT_DIR FALSE)
set(CMAKE_CXX_STANDARD 11)

include(../cwe/cwe.cmake)

# App source files list
set(APP_SOURCE_FILES
  src/main.cpp
  ${CWE_SOURCE_FILES}
)

add_executable(app ${APP_SOURCE_FILES})

target_include_directories(app PRIVATE
                           ${CMAKE_CURRENT_SOURCE_DIR}/include
                           ${PROJECT_SOURCE_DIR}/shared/include
                           ${PROJECT_SOURCE_DIR}/cwe
                           ${CMAKE_CURRENT_BINARY_DIR}
                           )

# force include ewe/cwe843.hpp
target_compile_options(app PRIVATE -include "${CWE_HEADER_FILES}")
# Dependenci on lib project
target_link_libraries(app PRIVATE lib)

option(WITH_CWE401 "Generate and include CWE401 case" TRUE)
option(WITH_CWE590 "Generate and include CWE590 case" TRUE)
option(CWE_OMIT_BAD "Enable CWE bad implementation" TRUE)
option(CWE_OMIT_GOOD "Enable CWE good implementation" FALSE)

IF(WITH_CWE401)
  list(APPEND TMPL_ID cwe401)
  add_compile_definitions(WITH_CWE401)
ENDIF()

IF(WITH_CWE590)
  list(APPEND TMPL_ID cwe590)
  add_compile_definitions(WITH_CWE590)
ENDIF()

IF(CWE_OMIT_BAD)
  add_compile_definitions(OMITBAD)
ENDIF()

IF(CWE_OMIT_GOOD)
  add_compile_definitions(OMITGOOD)
ENDIF()

# Generated source code
FOREACH(cwe IN LISTS TMPL_ID)

 add_custom_command(
    OUTPUT ${cwe}.cpp
    PRE_BUILD
    COMMAND ${PROJECT_SOURCE_DIR}/cmake/gen.sh ${PROJECT_SOURCE_DIR}/shared/tmpl ${cwe}
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    USES_TERMINAL
  )

  add_library(${cwe} ${cwe}.cpp)
  target_link_libraries(app PRIVATE ${cwe})
  target_include_directories(${cwe} PRIVATE
                           ${PROJECT_SOURCE_DIR}/shared/include
                           )
ENDFOREACH()
