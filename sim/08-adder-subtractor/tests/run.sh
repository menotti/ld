cd tests
echo "Testando a $1ª função..." 
iverilog -o tb.vvp tb_top.v ../top.v ../full_adder.v
rm -f tb$1.out
vvp tb.vvp +testfile=values$1.tv | grep -v '$finish called' > tb$1.out

if awk '
    /\/\*/ { in_comment=1 }
    /\*\// { in_comment=0; next }
    in_comment { next }
    /\/\// { sub(/\/\/.*/, "") }
    { code = code $0 "\n" }
    END { if (code ~ /full_adder/) exit 0; else exit 1 }
' ../top.v; then
    if diff tb$1.out tb$1.ok >/dev/null; then
        echo "OK"
    else
        echo "ERRO: saída incorreta"
        echo "ESPERADA:"
        cat tb$1.ok
        echo "OBTIDA:"
        cat tb$1.out
        exit 1
    fi
else
    echo "Modo incorreto: você deve instanciar o módulo full_adder ao invés de usar o operador de adição + !"
    exit 1
fi






