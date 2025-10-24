cd tests
echo "Compilando o código..." 
iverilog -o tb ../top.v
if [ $? -ne 0 ]; then
    echo "Erro ao compilar o código!"
    exit 1
else
    echo "Ele compila! Veja você o que ele faz na placa:"
    echo "https://legacy.vlab.dc.ufscar.br/camera.php"
    exit 0
fi
