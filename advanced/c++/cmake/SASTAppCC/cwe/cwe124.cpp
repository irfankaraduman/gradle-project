/*
 * @description
 * CWE: 124 Buffer Underwrite
 * BadSource:  Set data pointer to before the allocated memory buffer
 * GoodSource: Set data pointer to the allocated memory buffer
 * Sinks: cpy
 *    BadSink : Copy string to data using strcpy
 * Flow Variant: 33 Data flow: use of a C++ reference to data within the same function
 *
 * */
#include "cwe124.hpp"

#include <wchar.h>
#include <cstring>
#include <alloca.h>

#include "printio.hpp"

namespace CWE124_Buffer_Underwrite__char_alloca_cpy_33
{

#ifndef OMITBAD

void bad()
{
    char * data;
    char * &dataRef = data;
    char * dataBuffer = (char *)alloca(100*sizeof(char));
    std::memset(dataBuffer, 'A', 100-1);
    dataBuffer[100-1] = '\0';
    /* FLAW: Set data pointer to before the allocated memory buffer */
    data = dataBuffer - 8;
    {
        char * data = dataRef;
        {
            char source[100];
            std::memset(source, 'C', 100-1); /* fill with 'C's */
            source[100-1] = '\0'; /* null terminate */
            /* POTENTIAL FLAW: Possibly copying data to memory before the destination buffer */
            std::strcpy(data, source);
            printLine(data);
        }
    }
}

#endif /* OMITBAD */

#ifndef OMITGOOD

/* goodG2B() uses the GoodSource with the BadSink */
static void goodG2B()
{
    char * data;
    char * &dataRef = data;
    char * dataBuffer = (char *)alloca(100*sizeof(char));
    std::memset(dataBuffer, 'A', 100-1);
    dataBuffer[100-1] = '\0';
    /* FIX: Set data pointer to the allocated memory buffer */
    data = dataBuffer;
    {
        char * data = dataRef;
        {
            char source[100];
            std::memset(source, 'C', 100-1); /* fill with 'C's */
            source[100-1] = '\0'; /* null terminate */
            /* POTENTIAL FLAW: Possibly copying data to memory before the destination buffer */
            std::strcpy(data, source);
            printLine(data);
        }
    }
}

void good()
{
    goodG2B();
}

#endif /* OMITGOOD */

} /* close namespace */
