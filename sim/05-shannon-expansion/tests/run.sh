#!/bin/bash

cd tests
iverilog -o tb top_tb.v ../*.v
rm -f top.out
./tb | grep -v '$finish called' > top.out

if awk '
    /\/\*/ { in_comment=1 }
    /\*\// { in_comment=0; next }
    in_comment { next }
    /\/\// { sub(/\/\/.*/, "") }
    { code = code $0 "\n" }
    END { if (code ~ /\?/) exit 0; else exit 1 }
' ../top.v; then
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
else
    echo "ERRO: usar operador ternário!"
    exit 1
fi
