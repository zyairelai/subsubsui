#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "$0 is not running as root. Try using sudo."
    exit 2
fi

# amass
echo "
[+] Downloading AMASS stable version"
wget -q https://github.com/owasp-amass/amass/releases/download/v3.19.2/amass_linux_amd64.zip -O /tmp/amass_linux_amd64.zip
unzip -q -j /tmp/amass_linux_amd64.zip "*/amass" -d /usr/bin/
sleep 1

# assetfinder
echo "
[+] Downloading Assetfinder stable version"
wget -q https://github.com/tomnomnom/assetfinder/releases/download/v0.1.1/assetfinder-linux-amd64-0.1.1.tgz -O /tmp/assetfinder-linux-amd64-0.1.1.tgz
tar xzf /tmp/assetfinder-linux-amd64-0.1.1.tgz -C /usr/bin/
sleep 1

# subfinder
echo "
[+] Downloading Subfinder stable version"
wget -q https://github.com/projectdiscovery/subfinder/releases/download/v2.6.3/subfinder_2.6.3_linux_amd64.zip -O /tmp/subfinder_2.6.3_linux_amd64.zip
unzip -q /tmp/subfinder_2.6.3_linux_amd64.zip -d /usr/bin/
sleep 1

rm /tmp/amass*
rm /tmp/assetfinder* 
rm /tmp/subfinder*