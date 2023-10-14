# subsubsui
Combining 3 subdomain enumeration tool + nmap pinging to filter live target 

# PORTABLE VERSION
If you don't want to mess up your original AMASS, Assetfinder and Subfinder version.  
You can use the portable version, it will download those static binary everytime you run the script
```
wget https://raw.githubusercontent.com/zyairelai/subsubsui/main/portable.sh
chmod a+x portable.sh
sudo mv portable.sh /usr/bin/subsubsui
```

# INSTALLATION
If you are an old school prefer to use stable version of AMASS, Assetfinder and Subfinder
```
wget https://raw.githubusercontent.com/zyairelai/subsubsui/main/setup.sh
chmod a+x setup.sh
sudo ./setup.sh
```
Once you done installing those stable static binaries, proceed to download the script
```
wget https://raw.githubusercontent.com/zyairelai/subsubsui/main/subsubsui.sh
chmod a+x subsubsui.sh
sudo mv subsubsui.sh /usr/bin/subsubsui
```

# USAGE
```
subsubsui -d <target.com>
```
```
subsubsui -h
Usage: /usr/bin/subsubsui [options]


Options:
  -h, --help              Display help information
  -d, --domain <domain>   Domain to scan for XSS, SQLi, SSRF, etc. vulnerabilities
```

# HOW IT WORKS
1. Combining all 3 AMASS, Assetfinder and Subfinder
2. Merge + Sort + Eliminate Duplicate Entries
3. Nmap ping live host
4. Grep scope only matched with the domain we input
5. Output nice and clean targets
6. Getting roasted by me 
