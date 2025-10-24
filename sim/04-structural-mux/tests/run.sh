#!/bin/bash

cd tests
iverilog -o tb mux_tb.v ../*.v
rm -f top.out
./tb | grep -v '$finish called' > top.out

if grep -qw "assign" ../top.v; then
    echo "ERRO: usar as primitivas básicas and, or e xor ou invés de assign"
    exit 1
else
    if diff top.out top.ok >/dev/null; then
        echo "OK"
        exit 0
    else
        echo "ERRO: saída incorreta"
        echo "ESPERADA:"
        cat top.ok
        echo "OBTIDA:"
        cat top.out
        exit 1
    fi
fi
