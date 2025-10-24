cd tests
echo "Testando a sequência..." 
iverilog -g2012 -o tb.vvp ../*.sv *.sv
rm -f tb.out
vvp tb.vvp | grep -v '$finish called' > tb.out

if diff tb.out tb.ok >/dev/null; then
    echo "OK"
    exit 0
else
    echo "ERRO: saída incorreta"
    echo "ESPERADA:"
    cat tb.ok
    echo "OBTIDA:"
    cat tb.out
    exit 1
fi
