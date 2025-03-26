# Introdução ao kit de FPGA

[![Primeiros passos no Intel/Altera Quartus Prime 23.1std com o kit de FPGA da Terasic DE0-CV)](https://img.youtube.com/vi/K5kXxtUSb-c/0.jpg)](https://www.youtube.com/watch?v=K5kXxtUSb-c)

Neste laboratório, teremos o primeiro contato com o kit de [FPGAs](https://www.youtube.com/watch?v=Ft4z8790lw0) usado durante o curso. 

>⚠️ Notar que os procedimentos adotados aqui dependem do fabricante/kit e do sistema operacional usados.

Os arquivos usados, que precisam estar organizados desta forma, são os seguintes:

```bash
├── 01_demo          # diretório / pasta
│   ├── README.md    # este arquivo
│   └── top.v        # implementação do circuito
├── DE0_CV.qsf       # arquivo de pinos da placa DE0_CV
├── Makefile         # arquivo do make (usado no Linux)
└── make_wannabe.bat # arquivo batch (usado no Windows)
```

Você pode obtê-los [clonando](https://docs.github.com/pt/repositories/creating-and-managing-repositories/cloning-a-repository) este repositório ou [baixando](https://docs.github.com/pt/get-started/start-your-journey/downloading-files-from-github) e descompactando um arquivo .zip dele. 

Nosso arquivo Verilog é muito simples:

```verilog
module top(
	input [9:0] SW,
	output [9:0] LEDR);

	assign LEDR = SW; 
endmodule
```

Ele apenas atribui a saida `LEDR`, que aciona os 💡LEDs da placa, usando a entrada `SW`, relativa aos 🖲️*switch buttons*. Como ambos são vetores (veremos o que isso significa mais adiante), cada botão irá acionar um LED independentemente. Os nomes escolhidos para as entradas (`input`) e saídas (`output`) são importantes, pois no arquivo de pinos da placa encontramos o seguinte:

```
set_location_assignment PIN_AA2 -to LEDR[0]
set_location_assignment PIN_AA1 -to LEDR[1]
set_location_assignment PIN_W2 -to LEDR[2]
set_location_assignment PIN_Y3 -to LEDR[3]
set_location_assignment PIN_N2 -to LEDR[4]
set_location_assignment PIN_N1 -to LEDR[5]
set_location_assignment PIN_U2 -to LEDR[6]
set_location_assignment PIN_U1 -to LEDR[7]
set_location_assignment PIN_L2 -to LEDR[8]
set_location_assignment PIN_L1 -to LEDR[9]

set_location_assignment PIN_U13 -to SW[0]
set_location_assignment PIN_V13 -to SW[1]
set_location_assignment PIN_T13 -to SW[2]
set_location_assignment PIN_T12 -to SW[3]
set_location_assignment PIN_AA15 -to SW[4]
set_location_assignment PIN_AB15 -to SW[5]
set_location_assignment PIN_AA14 -to SW[6]
set_location_assignment PIN_AA13 -to SW[7]
set_location_assignment PIN_AB13 -to SW[8]
set_location_assignment PIN_AB12 -to SW[9]
```

# Altera / Intel® 

## Quartus II (Windows)

Para fazer o laboratório usando linha de comandos (recomendado), pressione `⊞ Win`+`R`, digite `cmd` e pressione `Enter` para abrir o **Promp de Comandos**. Em sua janela, digite a sequência de comandos a seguir, considerando o seu caminho para a pasta:

```bash
cd C:\Users\aluno\Downloads\ld\labs\01_demo
..\make_wannabe.bat
```

[Neste vídeo](https://www.youtube.com/watch?v=K5kXxtUSb-c) eu mostro como criar um projeto usando a interface gráfica da ferramenta e também usando linhas de comando. 

>⚠️Notar que os procedimentos podem variar de acordo com a versão da ferramenta usada. 

# Referências

- Git

    - [Olá, Mundo](https://docs.github.com/pt/get-started/start-your-journey/hello-world)

- Altera / Intel® 

    - Quartus II

        - [Documentação](https://www.intel.com.br/content/www/br/pt/support/programmable/support-resources/design-software/user-guides.html) (atenção para a versão usada!)

    - DE0-CV

        - [Manual do usuário](DE0_CV_User_Manual)
        - [Arquivo de pinos](DE0_CV.qsf)

- AMD / Xilinx®

    - Vivado

        - [Documentação](https://www.amd.com/en/products/software/adaptive-socs-and-fpgas/vivado.html) (atenção para a versão usada!)

    - Zybo Z7-20

        - [Manual de referência](https://digilent.com/reference/programmable-logic/zybo-z7/reference-manual)
        - [Arquivo de pinos](DE0_CV.qsf)

