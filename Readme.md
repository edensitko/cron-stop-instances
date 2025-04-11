# 🖥 EC2 Auto Shutdown with Cron

Automatically stop all running AWS EC2 instances across **all regions** every day at a scheduled time using a cron job.

## ✨ Features

- ⏰ Runs daily via `cron` (default: 00:00, can be customized)
- 🌐 Works across **all AWS regions**
- ✅ Logs output and errors to `/tmp/ec2_shutdown.log`
- 🛡 Compatible with macOS cron security restrictions

---

## 📦 Files

| File | Description |
|------|-------------|
| `stop_all_ec2.sh` | Bash script that lists and stops all running EC2 instances in all AWS regions |
| `install_ec2_shutdown_cron.sh` | Script that adds a `cron` job to run the shutdown script daily |
| `/tmp/ec2_shutdown.log` | File where logs are written (created automatically) |

---

## 🚀 Setup Instructions

### 1. 📁 Move scripts to a safe folder (macOS users!)

macOS restricts execution from `Desktop`/`Downloads`, so recommended:

```bash
mkdir -p ~/scripts
mv stop_all_ec2.sh install_ec2_shutdown_cron.sh ~/scripts/
cd ~/scripts
chmod +x *.sh
