#!/bin/bash

# Auto Recon Tool for tesla.com
# Tools: subfinder, amass, httprobe, nmap

# Target Domain
domain="tesla.com"
output_dir="$domain"

# Create output directory
mkdir -p "$output_dir"
echo "[+] Output directory created: $output_dir"

# Subfinder
echo "[+] Running subfinder..."
subfinder -d "$domain" -silent > "$output_dir/subfinder.txt"

# Amass
echo "[+] Running amass..."
amass enum -d "$domain" -silent > "$output_dir/amass.txt"

# Merge and sort unique subdomains
cat "$output_dir/subfinder.txt" "$output_dir/amass.txt" | sort -u > "$output_dir/unique_subdomains.txt"
echo "[+] Merged subdomains saved to unique_subdomains.txt"

# Httprobe to find live subdomains
echo "[+] Probing live subdomains..."
cat "$output_dir/unique_subdomains.txt" | httprobe > "$output_dir/live_subdomains.txt"
echo "[+] Live subdomains saved to live_subdomains.txt"

# Nmap scanning on live subdomains
echo "[+] Starting Nmap scans..."
while read -r url; do
    host=$(echo "$url" | sed 's|http[s]*://||')
    echo "[*] Scanning $host with Nmap..."
    nmap -sS -T4 -Pn "$host" -oN "$output_dir/nmap_$host.txt"
done < "$output_dir/live_subdomains.txt"

echo "[+] Recon completed. Results are saved in $output_dir/"
