#!/bin/bash

CORES=(1 2 4 6 8 12 16 32 64)
#CORES=(64)
CACHESIZE=(1 2 4 8 16 32)
CACHEASSOC=(2 4 8)
success_string='Ruby Tester completed'

rm -rf test.log

for (( i=1;i<2;i++))
do
  for (( j=0;j<${#CACHESIZE[@]};j++))
  do
    for (( k=0;k<${#CACHEASSOC[@]};k++))
    do
      for (( m=0;m<${#CORES[@]};m++)); do
        echo "starting sim: random seed with ${CORES[${m}]} cores, seed ${i}, cache size ${CACHESIZE[${j}]}KB, cache associativity ${CACHEASSOC[${k}]}."
        ./build/ALPHA/gem5.opt ./configs/example/ruby_random_test.py -n ${CORES[${m}]} -l 1000000 --l1d_size ${CACHESIZE[${j}]}kB --l1d_assoc ${CACHEASSOC[${k}]} --random_seed=${i} &> test.log
        grep "Ruby Tester completed" test.log
      done
    done
  done
done
echo "Done"
