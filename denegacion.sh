#!/bin/bash

echo "1. - Denegar servicios de Tango"
echo "2. - Permitir acceso a los servicios de Tango"
read k

if (( $k == 1 )); then

       iptables -I INPUT -s 199.83.168.0/21 -j DROP
       echo "Sevicios denegados"

fi
if (( $k == 2 )); then

       iptables -I INPUT -s 199.83.168.0/21 -j ACCEPT
       echo "Sevicios restaurados"      
