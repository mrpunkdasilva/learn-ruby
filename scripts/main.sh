#!/bin/bash

#  ██████╗ ██╗   ██╗███╗   ██╗██╗  ██╗██████╗  ██████╗  ██████╗███████╗
#  ██╔══██╗██║   ██║████╗  ██║██║ ██╔╝██╔══██╗██╔═══██╗██╔════╝██╔════╝
#  ██████╔╝██║   ██║██╔██╗ ██║█████╔╝ ██║  ██║██║   ██║██║     ███████╗
#  ██╔═══╝ ██║   ██║██║╚██╗██║██╔═██╗ ██║  ██║██║   ██║██║     ╚════██║
#  ██║     ╚██████╔╝██║ ╚████║██║  ██╗██████╔╝╚██████╔╝╚██████╗███████║
#  ╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═════╝  ╚═════╝  ╚═════╝╚══════╝
                                                                      
echo "🔥 Iniciando sequência de deploy punk..."

echo "💀 Destruindo docs antigos..."
rm -rf ../docs/

echo "📦 Descompactando novos arquivos..."
./unzip_writerside.sh

echo "🚀 Enviando para o repo remoto..."
./push_remote_repo.sh

echo "✨ Deploy concluído com sucesso! Rock on! 🤘"

