# subsubsui
Combining 3 subdomain enumeration tool + nmap pinging to filter live target 

# INSTALLATION
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
