#!/bin/bash

# Atualiza a lista de pacotes
sudo apt update

# Instala o OpenJDK 17
sudo apt install -y openjdk-17-jdk

# Altera a porta SSH para 51352 e ajusta as configurações de segurança
sudo sed -i 's/^#Port 22/Port 51352/' /etc/ssh/sshd_config
sudo sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Reinicia o serviço SSH para aplicar as mudanças
sudo systemctl restart sshd

# Exibe uma mensagem de conclusão
echo "Configurações aplicadas com sucesso."
