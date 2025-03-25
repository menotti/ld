# Introdução ao kit de FPGA

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

# Altera / Intel® 

## Quartus II (Windows)

Para fazer o laboratório usando linha de comandos (recomendado), pressione `⊞ Win`+`R`, digite `cmd` e pressione `Enter` para abrir o **Promp de Comandos**. Em sua janela, digite a sequência de comandos a seguir, considerando o seu caminho para a pasta:

```bash
cd C:\Users\aluno\Downloads\ld\labs\01_demo
..\make_wannabe.bat
```

[Neste vídeo](https://www.youtube.com/live/Ft4z8790lw0?si=LA9uJqRTQh8aoMTf&t=2776) eu mostro como criar um projeto usando a interface gráfica da ferramenta. O áudio não está muito claro, mas é possível acompanhar a sequência das telas. 

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

