#!/bin/bash

# Install dependencies
echo "[*] Installing dependencies..."
sudo apt update
sudo apt install -y git curl wget jq

# Install Go if not installed
if ! command -v go &> /dev/null; then
  echo "[*] Installing Go..."
  wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
  sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz
  echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
  source ~/.bashrc
fi

# Install tools
echo "[*] Installing subfinder, httpx, gau..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/lc/gau/v2/cmd/gau@latest

# Add Go bin to PATH
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
source ~/.bashrc

# Copy reconmaster.sh to /usr/local/bin for global access
echo "[*] Setting up global command..."
sudo cp reconmaster.sh /usr/local/bin/reconmaster
sudo chmod +x /usr/local/bin/reconmaster

echo "[+] Installation complete. You can now run the tool with: reconmaster <domain/scope.txt>"
