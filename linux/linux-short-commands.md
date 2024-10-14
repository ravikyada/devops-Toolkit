Get the Port of the Runnning pm2 processes:
```
ss -ntlp | grep $(pm2 ls | grep "process-name" | awk '{print $12}') | awk '{print $4}'
```

Get the SSL Info and Issuer for Domain name:
```
nmap -p 443 --script ssl-cert <domain>
```

List Folders with Highest Storage in Directory:
```
sudo du -hsx /var/log/* | sort -rh | head -n 10
```

List Files/Folders with Highest Storage in Directory:
```
sudo du -shl /var/log/* | sort -rh | head -n 10
```