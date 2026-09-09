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

#ifndef _CWE_124_HPP_
#define _CWE_124_HPP_

namespace CWE124_Buffer_Underwrite__char_alloca_cpy_33
{
#ifndef OMITBAD
void bad();
#endif /* OMITBAD */

#ifndef OMITGOOD
void good();
#endif /* OMITGOOD */
} /* close namespace */

#endif /* _CWE_124_HPP_ */
