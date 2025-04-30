iverilog -o tb top.v tb_top.v 
rm -f gray.out
./tb > gray.out

if diff gray.out gray.ok >/dev/null; then
    echo "OK"
    exit 0
else
    echo "ERRO"
    exit 1
fi