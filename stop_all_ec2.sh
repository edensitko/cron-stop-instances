#!/bin/bash

# Ensure environment is set for cron
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
echo "$(date) - Running EC2 shutdown script" >> /tmp/ec2_shutdown.log

# Script to stop all running EC2 instances in all regions
echo "Fetching all AWS regions..." >> /tmp/ec2_shutdown.log
regions=$(aws ec2 describe-regions --query "Regions[*].RegionName" --output text)

for region in $regions; do
  echo "Processing region: $region" >> /tmp/ec2_shutdown.log
  instances=$(aws ec2 describe-instances \
    --region $region \
    --filters "Name=instance-state-name,Values=running" \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output text)

  if [ -n "$instances" ]; then
    echo "Stopping instances in $region: $instances" >> /tmp/ec2_shutdown.log
    aws ec2 stop-instances --region $region --instance-ids $instances >> /tmp/ec2_shutdown.log 2>&1
  else
    echo "No running instances in $region." >> /tmp/ec2_shutdown.log
  fi
done
