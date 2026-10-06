#!/bin/bash
# Temel korumali host politikasi (egitim amacli)
# Kullanim: sudo ./temel-korumali-host.sh
set -euo pipefail

iptables -F
iptables -X
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Aktif baglantilara devam
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# Loopback
iptables -A INPUT -i lo -j ACCEPT
# SSH (kisitli: kendi yonetim aginiza daraltin)
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW -j ACCEPT
# Web
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
# Ping flood'a karsi oran siniri
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 5/s -j ACCEPT

echo "[+] Temel politika uygulandi."
