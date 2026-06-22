#!/usr/bin/env bash
# Instala as ferramentas de simulação (Icarus Verilog e GTKWave).
# Detecta automaticamente o gerenciador de pacotes da distribuição.
set -e

PACOTES="iverilog gtkwave"

if command -v apt >/dev/null 2>&1; then          # Debian, Ubuntu, Mint, ...
    sudo apt update
    sudo apt install -y $PACOTES
elif command -v pacman >/dev/null 2>&1; then     # Arch, Manjaro, EndeavourOS, ...
    sudo pacman -Syu --needed --noconfirm $PACOTES
elif command -v dnf >/dev/null 2>&1; then        # Fedora, RHEL, Rocky, ...
    sudo dnf install -y $PACOTES
elif command -v zypper >/dev/null 2>&1; then     # openSUSE
    sudo zypper install -y $PACOTES
else
    echo "Gerenciador de pacotes não reconhecido."
    echo "Instale manualmente os pacotes: $PACOTES"
    exit 1
fi
