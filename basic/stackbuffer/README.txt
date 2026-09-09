This sample demonstrates a stack buffer overflow.

Note: You must have the g++ or the cl compiler installed on your
system to analyze this sample.

To analyze the sample, type the following commands:

$ sourceanalyzer -b stackbuffer -clean

$ sourceanalyzer -b stackbuffer g++ stackbuffer.cpp
 - or -
$ sourceanalyzer -b stackbuffer cl stackbuffer.cpp

$ sourceanalyzer -b stackbuffer -scan -f stackbuffer.fpr

Open the results in Audit Workbench:

$ auditworkbench stackbuffer.fpr

The Fortify analysis results should contain a Buffer Overflow issue.
Other types of issues might also be present.

The Buffer Overflow issue indicates that user input enters the program through
the scanf call on line 24, which reads data into argument 1. Arguments are
0-indexed, so argument 1 is the second argument to scanf, &bytes. This data
is then passed as argument 2 to doMemCpy(), which then sends the data to
argument 2 of memcpy(). This enables a user to cause an arbitrary amount
of data to be written to the 64-byte buffer buf, potentially overflowing
that buffer.
