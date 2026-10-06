# Firewall Kuralları

SYA119 Güvenlik Duvarları dersi için iptables / nftables örnek seti. Her dosya tek bir prensibi gösterir.

## İçerik

- `iptables/temel-korumali-host.sh` — varsayılan DROP, sadece 22/80/443
- `nftables/temel.nft` — aynı politikanın nftables karşılığı
- `pfsense/notlar.md` — pfSense'e uyarlama notları

Kurallar laboratuvar VM'inde test edilmiştir; üretime uygulamadan önce IP'leri değiştirin.
