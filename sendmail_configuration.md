# Sendmail Configuration on RHEL

This guide provides step-by-step instructions to install and configure Sendmail on a Red Hat Enterprise Linux (RHEL) system.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Install Sendmail](#install-sendmail)
3. [Configure Sendmail](#configure-sendmail)
   - [Backup Configuration Files](#backup-configuration-files)
   - [Edit `sendmail.mc` Configuration File](#edit-sendmailmc-configuration-file)
   - [Rebuild the Sendmail Configuration](#rebuild-the-sendmail-configuration)
4. [Start and Enable Sendmail](#start-and-enable-sendmail)
5. [Test Sendmail](#test-sendmail)
6. [Troubleshooting](#troubleshooting)

## Prerequisites

- You must have root or sudo privileges to install and configure Sendmail on your RHEL system.
- Make sure your system is updated.

## Install Sendmail

Install Sendmail and related utilities using the package manager.

```bash
sudo yum install sendmail sendmail-cf mailx -y
```

## Configure Sendmail

Sendmail configuration is managed through the /etc/mail/sendmail.mc file, which is used to generate the actual configuration file /etc/mail/sendmail.cf.

### Backup Configuration Files
Before making any changes, back up the existing configuration files:

```
sudo cp /etc/mail/sendmail.mc /etc/mail/sendmail.mc.bak
sudo cp /etc/mail/sendmail.cf /etc/mail/sendmail.cf.bak
```

### Edit sendmail.mc Configuration File

Open the sendmail.mc file in a text editor to modify Sendmail's configuration:
```
sudo nano /etc/mail/sendmail.mc
```

### Rebuild the Sendmail Configuration
After editing sendmail.mc, generate the new sendmail.cf configuration file:
```
sudo m4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf
```

## Start and Enable Sendmail
Once Sendmail is configured, start the service and enable it to run on startup:
```
sudo systemctl start sendmail
sudo systemctl enable sendmail
```
## Test Sendmail
To test your Sendmail configuration, send a test email:
```
echo "This is a test email from Sendmail" | mail -s "Sendmail Test" your-email@example.com
```

### Check the Email

Verify that the test email arrives in the intended recipient's mailbox. If there are issues, check the Sendmail logs for any errors:
```
sudo tail -f /var/log/maillog
```

## Troubleshooting

1. **Check Configuration:** Use the sendmail -bt command to run Sendmail in test mode and verify configuration details.
2. **Check Firewall:** Ensure that the firewall is not blocking SMTP traffic on port 25.
3. **DNS Configuration:** Proper DNS settings are required for mail delivery. Make sure your hostname and MX records are correctly configured.