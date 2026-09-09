# CMake - compile commands

This is a synthetic CMake C++ application with pseudo generated source code. To demonstrate CMake integration with Fortify SAST.

## Basic overview of project configuration

The application contains several CWE use cases from [Juliet C/C++ 1.3](https://samate.nist.gov/SARD/test-suites/112) to simplify
the demonstration of the analyzed parts of the source code from the project. Single cases for CWE 124, 401, 590 are used in this sample.
For more information about vulnerabilities see description in the source file.

The CMake project options `CWE_OMIT_BAD` and `CWE_OMIT_GOOD` are switches for preprocessor macros `OMITBAD` and `OMITGOOD` for exclude
implementation use cases defined in the Juliet C/C++ Test suite.

The `WITH_CWE401` and `WITH_CWE590` are options for include/exclude pseudo generated source code. By disabling this option, cmake will
not generate source code using `add_custom_commands`.

_Note: To simplify the project, code generation consists only of copying source files and including them in the project._

The `APP_TARGER_X86` option demonstrate simple cross-platform support. And with forced include `cwe124.hpp` using the `target_compile_option` cmake command,
demonstrate the same include behavior.

## How to analyze the project

You must have a supported gcc based toolchain with make and cmake. In addition, for x86 `APP_TARGER_X86`,
it is necessary to have standard C++ libraries for the 32-bit platform installed.

**Configure & generate project**
```sh
$ cmake -G "Unix Makefiles" -DCMAKE_EXPORT_COMPILE_COMMANDS=yes -B _build -S .
$ cmake --build _build
```

**Analyze project**
```sh
$ cd _build
$ sourceanalyzer -b compile-commands -clean
$ sourceanalyzer -b compile-commands compile_commands.json
$ sourceanalyzer -b compile-commands -scan -scan-policy classic -f compile-commands.fpr
```

The results of the analysis should include the above-mentioned CWE depending on the project configuration. And might include
other issues depending on the version of the Rulepacks used in the scan phase.
