cd tests
echo "Testando a função..." 
iverilog -g2012 -o tb ../*.sv test.sv
rm -f test.out
./tb | grep -v '$finish called' > test.out

if awk '
    /\/\*/ { in_comment=1 }
    /\*\// { in_comment=0; next }
    in_comment { next }
    /\/\// { sub(/\/\/.*/, "") }
    { code = code $0 "\n" }
    END { if (code ~ /@/) exit 0; else exit 1 }
' ../top.sv; then
    echo "Modo incorreto: você não pode usar Verilog comportamental."
    exit 1
else
    if diff test.out test.ok >/dev/null; then
        echo "OK"
    else
        echo "ERRO: saída incorreta"
        echo "ESPERADA:"
        cat test.ok
        echo "OBTIDA:"
        cat test.out
        exit 1
    fi
fi
