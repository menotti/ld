cd tests
echo "Testando a $1ª função..." 
iverilog -o tb tb_top$1.v ../top.v
rm -f karn.out
./tb | grep -v '$finish called' > karn.out

if diff karn.out karn$1.ok >/dev/null; then
    echo "OK"
else
    echo "ERRO: saída incorreta"
    echo "ESPERADA:"
    cat karn$1.ok
    echo "OBTIDA:"
    cat karn.out
    exit 1
fi