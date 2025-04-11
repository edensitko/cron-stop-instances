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

macOS restricts execution from `Desktop`/`Downloads`, so we recommend:

```bash
mkdir -p ~/scripts
mv stop_all_ec2.sh install_ec2_shutdown_cron.sh ~/scripts/
cd ~/scripts
chmod +x *.sh
```

---

### 2. 🛠 Install the cron job

```bash
./install_ec2_shutdown_cron.sh
```

The default time is **00:00 every day**. To change it, edit the `install_ec2_shutdown_cron.sh` file and modify the cron expression.

---

### 3. 🔍 Verify cron is active

```bash
crontab -l
```

You should see something like:

```bash
00 00 * * * ~/scripts/stop_all_ec2.sh >> /tmp/ec2_shutdown.log 2>&1
```

---

### 4. 📜 Monitor output logs

To see real-time output from the cron job:

```bash
tail -f /tmp/ec2_shutdown.log
```

---

## ⚙️ Requirements

- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- AWS credentials configured (`aws configure`)
- Bash-compatible terminal (macOS/Linux)

---

## ✅ Notes

- Make sure the machine running the script has access to AWS and proper IAM permissions to stop EC2 instances.
- You can change the cron schedule by editing the script or running `crontab -e`.

---
