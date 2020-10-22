#!/bin/sh

# Decrypt the file
mkdir $HOME/secrets
# --lote para evitar o comando interativo
# --sim para supor "sim" para as perguntas
gpg --quiet --batch --yes --decrypt --passphrase="$LARGE_SECRET_PASSPHRASE" \
--output $HOME/secrets/my_secret.json my_secret.json.gpg
