Compile formatstring.c and run it.
	
Normally, it simply echos the text that you entered, truncated after you have
entered MAX_SIZE characters. There are a few ways you can exploit
this program:
- You can crash the program by entering something like: %x%s
- You can see what is on the stack by entering %08x%08x%08x... etc.
For more information on these and other exploits, see Exploiting Software [2004 Hoglund & McGraw] p.317-324

Note: You must have the gcc or the cl compiler installed on your
system to analyze this sample.

Run OpenText SAST (Fortify) on formatstring.c by typing the following commands:

$ sourceanalyzer -b formatstring -clean

$ sourceanalyzer -b formatstring gcc formatstring.c
 - or -
$ sourceanalyzer -b formatstring cl formatstring.c

$ sourceanalyzer -b formatstring -scan -scan-policy classic -f formatstring.fpr

Open the results in Audit Workbench:

$ auditworkbench formatstring.fpr

The output should contain a Format String vulnerability. 
The Fortify analysis results might include other categories of vulnerabilities 
depending on the Rulepack version used in the scan.
