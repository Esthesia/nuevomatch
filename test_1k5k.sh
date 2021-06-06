#!/bin/bash

RULES=("acl1_seed" "acl2_seed" "acl3_seed" "acl4_seed" "acl5_seed" "fw1_seed" "fw2_seed" "fw3_seed" "fw4_seed" "fw5_seed" "ipc1_seed" "ipc2_seed")

for rules in "${RULES[@]}"
do
        ./bin/nuevomatch.py -f ../classbench-ng/rules/$rules.5K_v4.txt -o $rules.5K_v4.data --min-size 64 --max-error 64
        ./bin/tool_trace_generator.exe -f ../classbench-ng/rules/$rules.5K_v4.txt -n 10000000 -o $rules.5K_v4_trace.txt
        ./bin/tool_locality.exe --trace-file $rules.5K_v4_trace.txt --output-trace $rules.5K_v4_trace_modified.txt --zipf --alpha 0.99
        ./bin/tool_classifier.exe -m nuevomatch -l -in $rules.5K_v4.data --trace $rules.5K_v4_trace_modified.txt --parallel 1 --trace-silent --max-subsets 1 --remainder-type tuplemerge --force-remainder-build -v 6 &> $rules.5K_v4_log.txt

        ./bin/nuevomatch.py -f ../classbench-ng/rules/$rules.5K_v6.txt -o $rules.5K_v6.data --min-size 64 --max-error 64
        ./bin/tool_trace_generator.exe -f ../classbench-ng/rules/$rules.5K_v6.txt -n 10000000 -o $rules.5K_v6_trace.txt
        ./bin/tool_locality.exe --trace-file $rules.5K_v6_trace.txt --output-trace $rules.5K_v6_trace_modified.txt --zipf --alpha 0.99
        ./bin/tool_classifier.exe -m nuevomatch -l -in $rules.5K_v6.data --trace $rules.5K_v6_trace_modified.txt --parallel 1 --trace-silent --max-subsets 1 --remainder-type tuplemerge --force-remainder-build -v 6 &> $rules.5K_v6_log.txt

        ./bin/nuevomatch.py -f ../classbench-ng/rules/$rules.1K_v4.txt -o $rules.1K_v4.data --min-size 64 --max-error 64
        ./bin/tool_trace_generator.exe -f ../classbench-ng/rules/$rules.1K_v4.txt -n 10000000 -o $rules.1K_v4_trace.txt
        ./bin/tool_locality.exe --trace-file $rules.1K_v4_trace.txt --output-trace $rules.1K_v4_trace_modified.txt --zipf --alpha 0.99
        ./bin/tool_classifier.exe -m nuevomatch -l -in $rules.1K_v6.data --trace $rules.1K_v6_trace_modified.txt --parallel 1 --trace-silent --max-subsets 1 --remainder-type tuplemerge --force-remainder-build -v 6 &> $rules.1K_v4_log.txt

        ./bin/nuevomatch.py -f ../classbench-ng/rules/$rules.1K_v6.txt -o $rules.1K_v6.data --min-size 64 --max-error 64
        ./bin/tool_trace_generator.exe -f ../classbench-ng/rules/$rules.1K_v6.txt -n 10000000 -o $rules.1K_v6_trace.txt
        ./bin/tool_locality.exe --trace-file $rules.1K_v6_trace.txt --output-trace $rules.1K_v6_trace_modified.txt --zipf --alpha 0.99
        ./bin/tool_classifier.exe -m nuevomatch -l -in $rules.1K_v6.data --trace $rules.1K_v6_trace_modified.txt --parallel 1 --trace-silent --max-subsets 1 --remainder-type tuplemerge --force-remainder-build -v 6 &> $rules.1K_v6_log.txt
echo " $rules "
done


./bin/nuevomatch.py -f ../classbench-ng/rules/of1_seed5K.txt -o $of1_seed5K.data --min-size 64 --max-error 64
./bin/tool_trace_generator.exe -f ../classbench-ng/rules/of1_seed5K.txt -n 10000000 -o of1_seed5K_trace.txt
./bin/tool_locality.exe --trace-file of1_seed5K_trace.txt --output-trace of1_seed5K_trace_modified.txt --zipf --alpha 0.99
./bin/tool_classifier.exe -m nuevomatch -l -in of1_seed5K.data --trace of1_seed5K_trace_modified.txt --parallel 1 --trace-silent --max-subsets 1 --remainder-type tuplemerge --force-remainder-build -v 6 &> of1_seed5K_log.txt
./bin/nuevomatch.py -f ../classbench-ng/rules/of2_seed5K.txt -o $of2_seed5K.data --min-size 64 --max-error 64
./bin/tool_trace_generator.exe -f ../classbench-ng/rules/of2_seed5K.txt -n 10000000 -o of2_seed5K_trace.txt
./bin/tool_locality.exe --trace-file of2_seed5K_trace.txt --output-trace of2_seed5K_trace_modified.txt --zipf --alpha 0.99
./bin/tool_classifier.exe -m nuevomatch -l -in of2_seed5K.data --trace of2_seed5K_trace_modified.txt --parallel 1 --trace-silent --max-subsets 1 --remainder-type tuplemerge --force-remainder-build -v 6 &> of2_seed5K_log.txt

./bin/nuevomatch.py -f ../classbench-ng/rules/of1_seed1K.txt -o $of1_seed1K.data --min-size 64 --max-error 64
./bin/tool_trace_generator.exe -f ../classbench-ng/rules/of1_seed1K.txt -n 10000000 -o of1_seed1K_trace.txt
./bin/tool_locality.exe --trace-file of1_seed1K_trace.txt --output-trace of1_seed1K_trace_modified.txt --zipf --alpha 0.99
./bin/tool_classifier.exe -m nuevomatch -l -in of1_seed1K.data --trace of1_seed1K_trace_modified.txt --parallel 1 --trace-silent --max-subsets 1 --remainder-type tuplemerge --force-remainder-build -v 6 &> of1_seed1K_log.txt
./bin/nuevomatch.py -f ../classbench-ng/rules/of2_seed1K.txt -o $of2_seed1K.data --min-size 64 --max-error 64
./bin/tool_trace_generator.exe -f ../classbench-ng/rules/of2_seed1K.txt -n 10000000 -o of2_seed1K_trace.txt
./bin/tool_locality.exe --trace-file of2_seed1K_trace.txt --output-trace of2_seed1K_trace_modified.txt --zipf --alpha 0.99
./bin/tool_classifier.exe -m nuevomatch -l -in of2_seed1K.data --trace of2_seed1K_trace_modified.txt --parallel 1 --trace-silent --max-subsets 1 --remainder-type tuplemerge --force-remainder-build -v 6 &> of2_seed1K_log.txt
