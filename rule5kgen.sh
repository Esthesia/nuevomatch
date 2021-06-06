#!/bin/bash

RULES=("acl1_seed" "acl2_seed" "acl3_seed" "acl4_seed" "acl5_seed" "fw1_seed" "fw2_seed" "fw3_seed" "fw4_seed" "fw5_seed" "ipc1_seed" "ipc2_seed")

for rules in "${RULES[@]}"
do

	./classbench generate v4 ./vendor/parameter_files/$rules --count=5000 > ./rules/$rules.5K_v4.txt
	./classbench generate v6 ./vendor/parameter_files/$rules --count=5000 >./rules/$rules.5K_v6.txt

done

./classbench generate of ./seeds/of1_seed --count=5000 > ./rules/of1_seed5K.txt
./classbench generate of ./seeds/of2_seed --count=5000 > ./rules/of2_seed5K.txt
