
# Certbot Commands Guide

## Installation

### Install Certbot and Apache Plugin
To install Certbot and the Apache plugin on Ubuntu, use the following commands:
```bash
sudo apt update
sudo apt install certbot python3-certbot-apache
```

## Obtaining an SSL Certificate

### Obtain an SSL Certificate
To obtain an SSL certificate for your domain, run:
```bash
sudo certbot --apache
```
Follow the prompts to complete the certificate issuance process.

## Certbot Commands

### Check Renewal Status
Certbot includes a systemd timer or cron job that automatically renews certificates before they expire. You can check the status of this timer with:
```bash
sudo systemctl status certbot.timer
```

### Simulate Renewal
To simulate the renewal process without making any changes, run:
```bash
sudo certbot renew --dry-run
```
This command helps ensure that the auto-renewal process works correctly.

### List All Certificates
To list all the certificates managed by Certbot, use:
```bash
sudo certbot certificates
```

### Manually Renew Certificates
To manually renew all certificates, run:
```bash
sudo certbot renew
```

### Delete a Certificate
To delete a specific certificate, use:
```bash
sudo certbot delete --cert-name your_domain.com
```
Replace `your_domain.com` with the actual domain name of the certificate you want to delete.

## Useful Links

- [Certbot Documentation](https://certbot.eff.org/docs/)
- [Let's Encrypt Community Support](https://community.letsencrypt.org/)
- [Certbot GitHub Repository](https://github.com/certbot/certbot)

This guide provides an overview of common Certbot commands for managing SSL certificates. For more detailed information and troubleshooting, refer to the [Certbot documentation](https://certbot.eff.org/docs/).