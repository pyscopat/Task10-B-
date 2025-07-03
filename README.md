
---

## 🎯 Learning Objectives

1. Automate OSINT-style subdomain enumeration.  
2. Probe for live HTTP/HTTPS hosts.  
3. Conduct service scans with Nmap.  
4. Structure and organize recon data for triage.

---

## 🛠 Prerequisites

- **Bash** (Linux / macOS)  
- Installed on your `$PATH`:
- `subfinder`
- `amass`
- `httprobe`
- `nmap`

> **Tip:** You can install these via your OS package manager or Go:  
> ```bash
> GO111MODULE=on go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
> brew install amass nmap
> go get -u github.com/tomnomnom/httprobe
> ```

---

## 🔧 Installation & Usage

1. **Clone the repo**  
 ```bash
 git clone https://github.com/pyscopat/Task10-B-.git
 cd auto-recon-bash
