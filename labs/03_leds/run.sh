iverilog -o tb tb_top.v top.v
rm -f leds.out
./tb > leds.out

if diff leds.out leds.ok >/dev/null; then
    echo "OK"
    exit 0
else
    echo "ERRO"
    exit 1
fi