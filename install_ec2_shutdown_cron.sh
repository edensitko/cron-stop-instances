#!/bin/bash

# Full path to the script that stops EC2 instances
SCRIPT_PATH="$HOME/<pathfolder>/stop_all_ec2.sh"

# Ensure the script is executable
chmod +x "$SCRIPT_PATH"

# Add a cron job to run the script every day at 00:00 with logging
(crontab -l 2>/dev/null; echo "00 00 * * * $SCRIPT_PATH >> /tmp/ec2_shutdown.log 2>&1") | crontab -

# Check if the cron job was added successfully
if crontab -l | grep -q "stop_all_ec2.sh"; then
    echo "✅ Cron job added successfully."
else
    echo "❌ Failed to add cron job."
    exit 1
fi

# Output the cron job details
echo "✅ Cron job added: will run stop_all_ec2.sh every day at 00:00"
echo "💡 Monitor it with: tail -f /tmp/ec2_shutdown.log"
