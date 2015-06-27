#/usr/bin/env pyhton

import sys, time, subprocess
from scapy.all import *

#ipdisp = `commands.getoutput("hostname -I)`
#ipdisp1 = ipdisp.strip("'")
ipdisp= "192.168.0.2"
iptango= "199.83.169.50"

print "IP Disp", ipdisp
print "IP Tango", iptango

puerto1= 50436
puerto2= 80
data= "INYECCION DE PAQUETES"

print puerto1, puerto2, data

paquete= IP(src=ipdisp,dst=iptango)/TCP(sport=puerto1,dport=puerto2)/data

while(True):
      send(paquete)
      time.sleep(1)
