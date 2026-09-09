REPORT Z_FTFY_SAMPLE_01.

PARAMETERS: password TYPE string DEFAULT 'secret'.

TYPES: BEGIN OF struc_type,
          d1 TYPE i,
          d2 TYPE c LENGTH 3,
          d3 TYPE string,
          END OF struc_type.
  
DATA(struc) = VALUE struc_type( d1 = 2 d2 = 'abc' d3 = password ).
WRITE struc-d3.