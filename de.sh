#!/bin/sh

# Decrypt the file
mkdir $HOME/secrets
# --lote para evitar o comando interativo
# --sim para supor "sim" para as perguntas
gpg --quiet --batch --yes --decrypt --passphrase="$CC_KEY" \
--output $HOME/secrets/api.txt api.txt.gpg
