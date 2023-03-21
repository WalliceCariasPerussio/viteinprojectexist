#!/bin/bash

# Habilitar o módulo necessário (substitua "rewrite" pelo nome do módulo que você precisa)
a2enmod rewrite

# Reinicie o Apache
/usr/sbin/service apache2 restart

Inicie o Apache em segundo plano
/usr/sbin/apache2ctl -D FOREGROUND &

Executar um loop infinito em primeiro plano
while true
do
  sleep 60
done
