cd tests
echo "Testando a $1ª forma..." 
iverilog -g2012 -o tb.vvp ../*.sv *.sv
rm -f tb$1.out
vvp tb.vvp +testcase=$1 | grep -v '$finish called' > tb$1.out

if diff tb$1.out tb$1.ok >/dev/null; then
    echo "OK"
    exit 0
else
    echo "ERRO: saída incorreta"
    echo "ESPERADA:"
    cat tb$1.ok
    echo "OBTIDA:"
    cat tb$1.out
    exit 1
fi
