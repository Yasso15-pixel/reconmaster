#!/bin/bash

# ReconMaster v1.0
# A simple recon wrapper using subfinder, httpx, and gau

# Check for input
if [ $# -ne 1 ]; then
    echo "Usage: $0 <domain | scope.txt>"
    exit 1
fi

input=$1
mkdir -p output

# Run recon for a single domain
recon_domain() {
    domain=$1
    out_dir="output/$domain"
    mkdir -p "$out_dir"

    echo "[*] Recon started for $domain"
    
    echo "  [+] Subdomain enumeration"
    subfinder -d "$domain" -silent > "$out_dir/subdomains.txt"

    echo "  [+] Probing live subdomains"
    httpx -l "$out_dir/subdomains.txt" -silent > "$out_dir/live_hosts.txt"

    echo "  [+] Gathering archived URLs"
    gau "$domain" > "$out_dir/urls.txt"

    echo "[✔] Finished recon for $domain. Output saved to $out_dir"
    echo ""
}

# If input is a file, process each domain
if [ -f "$input" ]; then
    while IFS= read -r domain || [ -n "$domain" ]; do
        [ -z "$domain" ] && continue
        recon_domain "$domain"
    done < "$input"
else
    recon_domain "$input"
fi
