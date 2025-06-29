# 🛠️ Cowrie Dev Honeypot – Setup Guide

# 🛠️ Cowrie Dev Honeypot – Full Setup Guide

A step-by-step walkthrough to create a believable honeypot that mimics a forgotten developer's staging box using Cowrie.

---

## ⚙️ Requirements

- Kali Linux or Debian-based distro
- Python 3.8+ and Git
- VirtualBox (if running Kali in a VM)
- Internet connection

---

## 📥 Step 1: Install System Packages

sudo apt update
sudo apt install git python3 python3-venv python3-pip libssl-dev libffi-dev build-essential

## 🐍 Step 2: Clone Cowrie & Set Up Environment
git clone https://github.com/cowrie/cowrie.git
cd cowrie
python3 -m venv cowrie-env
source cowrie-env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

## 🗝️ Step 3: Set Up Cowrie User & Permissions
> Optional, but recommended for real deployments.

sudo adduser --disabled-password cowrieuser
sudo chown -R cowrieuser:cowrieuser cowrie

## 🗃️ Step 4: Copy Over Custom Files
> From your honeypot project folder:
cp -r ~/cowrie-honeypot-dev/honeyfs ./honeyfs
cp ~/cowrie-honeypot-dev/cowrie.cfg ./etc/cowrie.cfg

## 💡 Step 5: Create Fake Dev Files
> Ensure these paths exist in the fake file system:
mkdir -p honeyfs/home/dev
nano honeyfs/home/dev/deploy.sh
nano honeyfs/home/dev/.env
echo "# Dev placeholder" > honeyfs/home/dev/README.txt
chmod +x honeyfs/home/dev/deploy.sh

> Example deploy.sh:
#!/bin/bash
echo "[+] Deploying dev app to internal staging..."
scp -r ./app/ dev@192.168.1.22:/var/www/html/


## 🩺 Step 6: Fix Missing Directory Visibility (important)
> Create a .keep file in /home to help Cowrie render the folder:
touch honeyfs/home/.keep

## 🔄 Step 7: Clear FS Cache & Restart Cowrie
bin/cowrie stop
rm -f var/lib/cowrie/fs.pickle*
bin/cowrie start

## 🔓 Step 8: Simulate an Attacker
ssh -p 2222 root@127.0.0.1

> Once in, try this:
cd /home/dev
ls
./deploy.sh
> You should see:
[+] Deploying dev app to internal staging...

## 📋 Step 9: View Logs
cat var/log/cowrie.log
ls var/log/tty/

> To Note: 
> Cowrie logs:

    Full command history

    Keystroke timings

    Uploaded/downloaded files

    IPs and login attempts

## 🔒 Safety Notice

Do not expose this honeypot to the open internet unless you fully understand the risks. Keep it firewalled or use it in an isolated VM environment.

[+] That’s the complete setup! You now have a fully interactive fake dev box ripe for attacker curiosity
