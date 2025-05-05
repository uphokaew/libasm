#!/bin/bash

# export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

gcc -O3 -Iinclude -L. -lasm -Wl,-rpath,. test/main.c && ./a.out