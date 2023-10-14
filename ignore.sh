#!/bin/bash

# Help menu
display_help() {
    echo -e "Usage: $0 [options]\n\n"
    echo "Options:"
    echo "  -h, --help              Display help information"
    echo "  -d, --domain <domain>   Domain to scan for XSS, SQLi, SSRF, etc. vulnerabilities"
    exit 0
}

while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        -h|--help)
            display_help
            ;;
        -d|--domain)
            domain="$2"
            shift
            shift
            ;;
        *)
            echo "Unknown option: $key"
            display_help
            ;;
    esac
done

# Ask the user to enter the domain name
if [ -z "$domain" ]; then
    read -p "Enter the domain name (eg: target.com): " domain
fi

# Run the subdomain enum 
echo "
[+] Running all 3 subdomain enum tools"
echo "
[+] Starting with AMASS"
/usr/bin/amass enum -passive -d $domain -o /tmp/amass.txt
sleep 1
echo "
[+] Continue with Assetfinder"
/usr/bin/assetfinder $domain > /tmp/assetfinder.txt
sleep 1
echo "
[+] Lastly with Subfinder"
/usr/bin/subfinder -d $domain -o /tmp/subfinder.txt
sleep 1

# Define the names of your text files
file1="/tmp/amass.txt"
file2="/tmp/assetfinder.txt"
file3="/tmp/subfinder.txt"

# Concatenate the files into a single file
cat "$file1" "$file2" "$file3" > /tmp/merged.txt

# Sort the merged file and remove duplicates
sort -u /tmp/merged.txt -o /tmp/merged.txt

# Nmap -sn scan to ping live target
echo "
[+] Pinging live host using nmap"
nmap -sn -iL /tmp/merged.txt > /tmp/nmap.txt

# Grep those host is up target and eliminate duplicated entries
grep "Nmap scan report for" /tmp/nmap.txt | sed 's/.*for \([^ ]*\) (.*/\1/' | sort | uniq > /tmp/live_host.txt

# Eliminate Out of Scope Domain
grep -E "${domain}\$" /tmp/live_host.txt > /tmp/in_scope_domain.txt

echo "
[+] Output saved to $(pwd)/subfucker_output.txt"
echo "
[+] Done! Lazy Mother Fucker ;)"
rm /tmp/amass*
rm /tmp/assetfinder* 
rm /tmp/subfinder*
rm /tmp/merged.txt /tmp/nmap.txt /tmp/live_host.txt 
mv /tmp/in_scope_domain.txt $(pwd)/subfucker_output.txt