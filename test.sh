#!/bin/bash


echo `./build/ALPHA/gem5.opt ./configs/example/ruby_random_test.py -n 8 -l 10000 --l1d_size 8kB --l1d_assoc 4 --random_seed=10`
echo $PWD
