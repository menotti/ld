#!/bin/bash

cd tests
iverilog -o tb_hello tb_hello.v ../hello.v
rm -f hello.out
./tb_hello | grep -v '$finish called' > hello.out

if diff hello.out hello.ok >/dev/null; then
    echo "OK"
    exit 0
else
    echo "ERRO"
    exit 1
fi
