#!/bin/bash

cd tests
iverilog -o tb tb_vector.v ../vector.v
rm -f vector.out
./tb | grep -v '$finish called' > vector.out

if diff vector.out vector.ok >/dev/null; then
    echo "OK"
    exit 0
else
    echo "ERRO"
    exit 1
fi