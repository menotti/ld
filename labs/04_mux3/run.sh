iverilog -o tb tb_top.v top$1.v
rm -f mux.out
./tb | grep -v '$finish called' > mux.out

if diff mux.out mux$1.ok >/dev/null; then
    echo "OK"
    exit 0
else
    echo "ERRO"
    exit 1
fi
