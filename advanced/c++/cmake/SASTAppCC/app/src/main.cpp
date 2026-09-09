#include "cwe124.hpp"

#ifdef WITH_CWE401
#include "cwe401.hpp"
#endif /* WITH_CWE401 */

#ifdef WITH_CWE590
#include "cwe590.hpp"
#endif /* WITH_CWE590 */

int main (int argc, char *argv[])
{

#ifndef OMITBAD
  CWE124_Buffer_Underwrite__char_alloca_cpy_33::bad();
#endif /* OMITBAD */

#ifndef OMITGOOD
  CWE124_Buffer_Underwrite__char_alloca_cpy_33::good();
#endif /* OMITGOOD */

#ifdef WITH_CWE401
#ifndef OMITBAD
  CWE401_Memory_Leak__new_array_int_01::bad();
#endif /* OMITBAD */

#ifndef OMITGOOD
  CWE401_Memory_Leak__new_array_int_01::good();
#endif /* OMITGOOD */
#endif /* WITH_CWE401 */

#ifdef WITH_CWE590
#ifndef OMITBAD
 CWE590_Free_Memory_Not_on_Heap__delete_array_char_alloca_01::bad();
#endif /* OMITBAD */

#ifndef OMITGOOD
  CWE590_Free_Memory_Not_on_Heap__delete_array_char_alloca_01::good();
#endif /* OMITGOOD */
#endif /* WITH_CWE590 */

  return 0;
}
