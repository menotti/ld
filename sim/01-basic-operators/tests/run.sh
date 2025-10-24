#!/bin/bash

cd tests
iverilog -o tb tb_basic$1.v ../basic.v
rm -f basic.out
./tb | grep -v '$finish called' > basic.out

if diff basic.out basic$1.ok >/dev/null; then
    echo "OK"
    exit 0
else
    echo "ERRO"
    exit 1
fi