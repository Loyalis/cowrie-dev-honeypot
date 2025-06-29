#!/bin/bash
echo "[+] Deploying dev app to internal staging..."
scp -r ./app/ dev@192.168.1.22:/var/www/html/
