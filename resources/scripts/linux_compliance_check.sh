#!/bin/bash

# Linux Compliance Check Script
# Purpose: Verify system compliance with security standards

echo "======================================"
echo "LINUX SYSTEM COMPLIANCE CHECK"
echo "======================================"
echo "Report Date: $(date)" > compliance_report.txt
echo "" >> compliance_report.txt

# Check password policy
echo "PASSWORD POLICY CHECK:" >> compliance_report.txt
grep -E "PASS_MAX_DAYS|PASS_MIN_DAYS|PASS_WARN_AGE" /etc/login.defs >> compliance_report.txt
echo "" >> compliance_report.txt

# Check file permissions
echo "CRITICAL FILE PERMISSIONS:" >> compliance_report.txt
echo "/etc/passwd: $(ls -l /etc/passwd)" >> compliance_report.txt
echo "/etc/shadow: $(ls -l /etc/shadow)" >> compliance_report.txt
echo "/etc/sudoers: $(ls -l /etc/sudoers)" >> compliance_report.txt
echo "" >> compliance_report.txt

# Check user accounts
echo "USER ACCOUNTS:" >> compliance_report.txt
awk -F: '$3 >= 1000 {print $1}' /etc/passwd >> compliance_report.txt
echo "" >> compliance_report.txt

# Display report
cat compliance_report.txt
