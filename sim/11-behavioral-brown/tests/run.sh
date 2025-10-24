cd tests
echo "Testando a $1ª função..." 
iverilog -g2012 -o tb.vvp ../*.sv *.sv
rm -f tb$1.out
vvp tb.vvp +testcase=$1 | grep -v '$finish called' > tb$1.out

if diff tb$1.out tb$1.ok >/dev/null; then
    echo "Saída: OK"
    if awk '
/\/\*/ { in_comment=1 }
/\*\// { in_comment=0; next }
in_comment { next }
/\/\// { sub(/\/\/.*/, "") }
{ code = code $0 "\n" }
END { if (code ~ /@/) exit 0; else exit 1 }
' ../*.sv; then
        echo "Modo incorreto: você não pode usar Verilog comportamental."
        exit 1
    else
        exit 0
    fi
else
    echo "ERRO: saída incorreta"
    echo "ESPERADA:"
    cat tb$1.ok
    echo "OBTIDA:"
    cat tb$1.out
    exit 1
fi
