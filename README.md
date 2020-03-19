# Parallel Processing
## Motive 
Use xargs to parralelise the data search
 
## Problem
Consider that we have a long-running program that runs many experiments
in parallel. Each of these experiments can take days to finish. As each
experiment runs, it writes its output to its own log file in a directory called
data.

Each experiment consists of 1000 runs of some program. Each run prints
a lot of information to stdout, which we have rerouted to the output files.
At the end of its execution, this program writes a line that begins with
“FINAL_RESULT:”. We can therefore, at any time, determine how much
progress an experiment has made by counting the number of lines in its
output file that begin with “FINAL_RESULT:”.

Each of these files is very large (on the order of megabytes), and we
have tens of thousands of them (1000 times k, where k is the number of
experiments. We would like to, at any time, produce a summary file that
looks like the following:

./log_experiment_1.txt

193

./log_experiment_2.txt

993

...

./log_experiment_1000k.txt

12

where, for each log file, we print the name of the log file on one line and
then the number of lines that begin with “FINAL_RESULT:” on the next
line. This summary file would give us an instant look at the progress of our
experiments.

The log files have many more lines than just those beginning with
“FINAL_RESULT:”. You need to specifically count these lines.

Note : “FINAL_RESULT:” is always at the beginning of the line it is on.

The program running does not start producing output until it starts
running an experiment (e.g., the log file log_experiment_72.txt will
not exist until experiment 72 starts running). Your utility does not
need to report 0 for log files that do not exist. In other words, only
worry about the log files that already exist.

It contains a shell script called produce_summmary.sh to run your utility.

The utility should produce a file called summary.txt that contains the
information described above.

Since the number of files is very large, the utility is able to
perform its job in parallel. Once the output is calculated, you may
write to the summary file sequentially in order to preserve ordering.
 The number of subprocesses is specified by a positional parameter.
 
 
 ## Data
 Each file(log_experiment_x.txt) is about 275MB in size, which is then compressed into log_data_x.zip
 files in batches of 10 to upload to Github.
 This data was generated to show the proof of concept.
