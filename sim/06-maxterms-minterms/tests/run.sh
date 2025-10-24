#!/bin/bash

cd tests
iverilog -o tb top_tb.v ../*.v
rm -f top.out
./tb | grep -v '$finish called' > top.out

if awk '
    /module[[:space:]]/ { in_module = 1 }
    /;/ && in_module { in_module = 0; next }
    in_module { next }
    { code = code $0 "\n" }
    END { if (code ~ /\(/) exit 1; else exit 0 }
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
    echo "ERRO: usar a forma SOP sem parênteses!"
    exit 1
fi
