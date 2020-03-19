#!/bin/bash 

#Citations:
#1. Bash scripting refresher
#https://linuxconfig.org/bash-scripting-tutorial-for-beginners
#2. To count the string in a file:https://stackoverflow.com/questions/6741967/how-can-i-count-the-occurrences-of-a-string-within-a-file
#3. Linux xargs command
#https://linuxize.com/post/linux-xargs-command/
#4. Parallelism using Xargs
#https://www.gnu.org/software/findutils/manual/html_node/find_html/Controlling-Parallelism.html
#I also could use the GNU Parellel tool, which is now more popular than Xargs but then it required Perl to be installed.


function summarize {
	#using xargs, default parameters, time utility
	#could also use 'seq' command, but then we need only those experiment files which have some data, so using ls command
	time ls ./log*.txt | xargs -n 1 -L 1 -P ${1-0} -I % sh -c 'echo -e "%:$(grep -c "FINAL_RESULT:" %)"' > intermediate.txt
	#sort our previous output alphabetically
	sort -V intermediate.txt > sorted.txt
	#Make it to the form as required in the document
	sed 's/:/\n/g' sorted.txt > summary.txt
	#Clean up
	rm intermediate.txt sorted.txt
}

summarize $1