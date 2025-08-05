#!/bin/bash

echo "[*] Installing ReconMaster dependencies..."

# Check if Go is installed
if ! command -v go &> /dev/null; then
    echo "[!] Go is not installed. Installing Go..."

    sudo apt update
    sudo apt install -y golang
fi

# Set up GOPATH and add it to PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# Install tools
echo "[*] Installing subfinder..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

echo "[*] Installing httpx..."
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

echo "[*] Installing gau..."
go install -v github.com/lc/gau@latest

# Create aliases (optional)
if ! grep -q 'go/bin' ~/.bashrc; then
    echo 'export PATH=$HOME/go/bin:$PATH' >> ~/.bashrc
fi

echo "[✔] All tools installed. You may need to run: source ~/.bashrc"
