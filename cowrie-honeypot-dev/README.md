# 🐍 Dev Honeypot – A Simulated SSH Trap for Security Research

This project is a custom Cowrie honeypot designed to mimic a forgotten developer's staging box. It lures attackers with a believable Linux environment, then logs their behavior for educational and threat analysis purposes.

## 🎯 Purpose

To understand attacker behavior and improve cybersecurity awareness by observing what real or automated intruders do when they think they’ve compromised an exposed system.

## 🛠 Features

- Fake file system with:
  - `/home/dev/deploy.sh` script (suggesting internal deployment)
  - `.env` file with fake secrets
  - Developer-style terminal history
- Cowrie SSH honeypot for interaction logging
- Realistic bash prompt and folder structure

## 👨‍💻 Technologies

- 🐍 Cowrie (SSH/Telnet honeypot)
- Python (for setup)
- Linux / Bash
- Optional tools: Log parsers, visualization platforms

## 📁 Project Structure
cowrie-honeypot-dev/
├── honeyfs/
│   └── home/
│       └── dev/
│           ├── deploy.sh
│           ├── .env
│           └── README.txt
├── cowrie.cfg
├── README.md
├── setup.md
└── .gitignore

## 📚 Setup Instructions

See `setup.md` for full installation steps on Kali Linux using virtualenv.

---

Created by **Casu Laurentiu Gabriel**  
📧 [casu_gabi@yahoo.com](mailto:casu_gabi@yahoo.com)

> For educational use only. Do not deploy to production.
