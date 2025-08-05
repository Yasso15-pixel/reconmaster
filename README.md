# 🔍 ReconMaster

A simple, fast, and automated reconnaissance toolkit for bug bounty hunters and penetration testers.

---

## 🧰 Features

- ✅ Subdomain enumeration using [Subfinder](https://github.com/projectdiscovery/subfinder)
- ✅ Live host detection with [Httpx](https://github.com/projectdiscovery/httpx)
- ✅ Archived URL collection using [Gau](https://github.com/lc/gau)
- ✅ JavaScript file discovery
- ✅ Directory fuzzing support
- ✅ Endpoint extraction from JavaScript files
- ✅ Auto-organized output in `output/` folder
- ✅ Lightweight and easy to use

---

## ⚙️ Installation

### 🐧 Linux / macOS / WSL (Windows Subsystem for Linux)

```bash
# Clone the repository
git clone https://github.com/Yasso15-pixel/reconmaster.git
cd reconmaster

# Make scripts executable
chmod +x install.sh reconmaster.sh

# Install all dependencies and tools
./install.sh
```

- For Windows users: This toolkit is designed to run on Linux or WSL. Please install WSL if you haven't already.

#### Usage

```bash

./reconmaster.sh scope.txt

#Or run it with a single domain

./reconmaster.sh example.com



```