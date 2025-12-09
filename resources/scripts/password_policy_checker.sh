#!/bin/bash

# Password Policy Checker
# Purpose: Verify password policy compliance

echo "PASSWORD POLICY COMPLIANCE CHECK"
echo "================================"

# Check password aging
echo "Checking password aging settings..."
grep -E "PASS_MAX_DAYS|PASS_MIN_DAYS|PASS_WARN_AGE" /etc/login.defs

# Check for users with no expiration
echo ""
echo "Users with no password expiration:"
for user in $(cut -f1 -d: /etc/passwd); do
    max_days=$(chage -l $user 2>/dev/null | grep "Maximum" | awk -F: '{print $2}' | xargs)
    if [ "$max_days" = "never" ] || [ "$max_days" = "-1" ]; then
        echo "  WARNING: $user"
    fi
done
