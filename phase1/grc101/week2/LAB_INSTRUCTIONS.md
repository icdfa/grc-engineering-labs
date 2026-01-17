# **Lab 2: Linux Scripting for GRC Compliance**
# **COMPLETE STEP-BY-STEP LEARNING PATH**

## **Course:** GRC101 - Introduction to GRC & Technical Landscape  
**Week:** 2  
**Duration:** 7 Sessions (1-2 hours each)  
**Level:** **ABSOLUTE BEGINNER**

---

# **SESSION 1: ABSOLUTE BASICS - Your First Script**

## **Learning Goal:** Create and run your very first bash script

### **Part 1: Understanding the Terminal (15 min)**

**Exercise 1.1: Get Comfortable with Terminal**
```bash
# Open terminal (Ctrl+Alt+T)
# Type each command and see what happens:

# 1. See where you are
pwd

# 2. See what's in this folder
ls

# 3. Create a new folder for our lab
mkdir grc_scripts_lab
cd grc_scripts_lab

# 4. Check you're in the right place
pwd
ls
```

### **Part 2: Creating Your First Script (30 min)**

**Exercise 1.2: The "Hello World" Script**
```bash
# Step 1: Create the script file
nano hello_grc.sh

# Step 2: Type this EXACTLY:
#!/bin/bash
# My first GRC script
# This script greets the user

echo "========================================"
echo "      WELCOME TO GRC SCRIPTING"
echo "========================================"
echo ""
echo "Script started at: $(date)"
echo "Current user: $(whoami)"
echo "Current folder: $(pwd)"
echo ""
echo "✅ First script created successfully!"
echo "========================================"

# Step 3: Save (Ctrl+X, Y, Enter)
```

**Exercise 1.3: Make it Executable and Run**
```bash
# Step 1: Check current permissions
ls -la hello_grc.sh
# Notice: No 'x' in permissions = cannot run

# Step 2: Add execute permission
chmod +x hello_grc.sh

# Step 3: Check again
ls -la hello_grc.sh
# Now you should see 'x' = can run!

# Step 4: RUN IT!
./hello_grc.sh
```

### **Part 3: Practice & Understanding (15 min)**

**Exercise 1.4: Modify Your Script**
```bash
# Re-open your script
nano hello_grc.sh

# Add these lines BEFORE the last line:
echo ""
echo "System Information:"
echo "- Hostname: $(hostname)"
echo "- Kernel: $(uname -r)"
echo "- Uptime: $(uptime -p)"

# Save and run again
./hello_grc.sh
```

**Exercise 1.5: Create a Compliance Header Script**
```bash
nano compliance_header.sh

# Type this:
#!/bin/bash
# Compliance Report Header

echo "========================================"
echo "     SECURITY COMPLIANCE REPORT"
echo "========================================"
echo "Generated: $(date '+%Y-%m-%d %H:%M:%S')"
echo "Auditor: $(whoami)"
echo "System: $(hostname)"
echo "========================================"
echo ""
echo "This report documents compliance findings"
echo "for security audit purposes."
echo ""
echo "Report ID: AUDIT-$(date +%Y%m%d)-001"
echo "========================================"

# Make executable and run
chmod +x compliance_header.sh
./compliance_header.sh
```

### **SESSION 1 HOMEWORK:**
1. Create a script called `system_snapshot.sh` that shows:
   - Current date and time
   - Your username
   - System hostname
   - Current directory
   - List of files in the directory
2. Run it and save the output
3. Share with a classmate

---

# **SESSION 2: VARIABLES & INPUT - Storing and Using Data**

## **Learning Goal:** Store information in variables and get user input

### **Part 1: What are Variables? (15 min)**

**Think of variables as LABELED BOXES:**
```
COMPANY_NAME = "TechCorp Inc"    ← Box labeled "COMPANY_NAME" contains "TechCorp Inc"
AUDIT_DATE = "2024-01-15"        ← Box labeled "AUDIT_DATE" contains "2024-01-15"
```

### **Part 2: Using Variables (30 min)**

**Exercise 2.1: Basic Variable Script**
```bash
nano variables_demo.sh

#!/bin/bash
# Variables Demonstration

# Store information in variables
COMPANY="SecureTech Solutions"
AUDITOR="Jane Smith"
STANDARD="ISO 27001:2022"
TODAY=$(date '+%Y-%m-%d')
REPORT_ID="RPT-$(date +%Y%m%d)-001"

# Use the variables
echo "=== COMPLIANCE REPORT ==="
echo "Company: $COMPANY"
echo "Auditor: $AUDITOR"
echo "Standard: $STANDARD"
echo "Date: $TODAY"
echo "Report ID: $REPORT_ID"
echo "========================="

# Make executable and run
chmod +x variables_demo.sh
./variables_demo.sh
```

**Exercise 2.2: System Information Variables**
```bash
nano system_variables.sh

#!/bin/bash
# System Information using Variables

# Capture system info into variables
HOSTNAME=$(hostname)
USERNAME=$(whoami)
CURRENT_DIR=$(pwd)
SYSTEM_TIME=$(date '+%H:%M:%S')
UPTIME_DAYS=$(uptime | awk '{print $3}')

# Display using variables
echo "🖥️  SYSTEM INFORMATION"
echo "========================"
echo "Computer: $HOSTNAME"
echo "User: $USERNAME"
echo "Location: $CURRENT_DIR"
echo "Time: $SYSTEM_TIME"
echo "Uptime: $UPTIME_DAYS days"
echo "========================"

chmod +x system_variables.sh
./system_variables.sh
```

### **Part 3: Getting User Input (30 min)**

**Exercise 2.3: Ask Questions with `read`**
```bash
nano audit_input.sh

#!/bin/bash
# Audit Information Collector

echo "=== AUDIT INFORMATION COLLECTOR ==="
echo ""

# Ask for input
echo -n "Enter company name: "
read COMPANY_NAME

echo -n "Enter audit type (Security/Compliance/Privacy): "
read AUDIT_TYPE

echo -n "Enter auditor name: "
read AUDITOR_NAME

echo -n "Enter number of findings: "
read FINDING_COUNT

# Show what was entered
echo ""
echo "=== SUMMARY ==="
echo "Company: $COMPANY_NAME"
echo "Audit Type: $AUDIT_TYPE"
echo "Auditor: $AUDITOR_NAME"
echo "Findings: $FINDING_COUNT"
echo ""
echo "Report saved to: audit_$(date +%Y%m%d).txt"

# Save to file
echo "Company: $COMPANY_NAME" > audit_$(date +%Y%m%d).txt
echo "Audit Type: $AUDIT_TYPE" >> audit_$(date +%Y%m%d).txt
echo "Auditor: $AUDITOR_NAME" >> audit_$(date +%Y%m%d).txt
echo "Findings: $FINDING_COUNT" >> audit_$(date +%Y%m%d).txt

chmod +x audit_input.sh
./audit_input.sh
```

**Exercise 2.4: Password Checker (Simple)**
```bash
nano password_check.sh

#!/bin/bash
# Simple Password Check

echo "=== PASSWORD STRENGTH CHECK ==="
echo ""

# Store correct password in variable
CORRECT_PASSWORD="Secure123!"

# Ask for password (won't show typing)
echo -n "Enter password: "
read -s USER_PASSWORD
echo ""

# Compare
if [ "$USER_PASSWORD" = "$CORRECT_PASSWORD" ]; then
    echo "✅ Access Granted!"
else
    echo "❌ Access Denied!"
fi

chmod +x password_check.sh
./password_check.sh
```

### **SESSION 2 HOMEWORK:**
Create a script called `user_registry.sh` that:
1. Asks for: Full Name, Department, Employee ID, Access Level
2. Stores each in a variable
3. Shows a summary
4. Saves to a file with today's date

---

# **SESSION 3: CONDITIONALS - Making Decisions**

## **Learning Goal:** Use if/else statements to make decisions

### **Part 1: Understanding If Statements (15 min)**

**Think of if statements as DECISION TREES:**
```
          ┌─────────────────┐
          │ Is it raining?  │
          └────────┬────────┘
                   │
        Yes ───────┴─────── No
         │                   │
    Take umbrella       Wear sunglasses
```

### **Part 2: Basic If/Else (30 min)**

**Exercise 3.1: Simple Compliance Check**
```bash
nano simple_compliance_check.sh

#!/bin/bash
# Simple Compliance Check

echo "=== PASSWORD AGE COMPLIANCE CHECK ==="
echo ""

# Compliance threshold
MAX_DAYS=90

echo -n "Enter password age in days: "
read PASSWORD_AGE

# Basic if statement
if [ $PASSWORD_AGE -gt $MAX_DAYS ]; then
    echo "❌ NON-COMPLIANT: Password is $PASSWORD_AGE days old"
    echo "   Maximum allowed: $MAX_DAYS days"
    echo "   ACTION REQUIRED: Change password immediately"
else
    echo "✅ COMPLIANT: Password is $PASSWORD_AGE days old"
    echo "   Within limit of $MAX_DAYS days"
fi

chmod +x simple_compliance_check.sh
./simple_compliance_check.sh
```

**Comparison Operators:**
- `-eq` = equal to (numbers)
- `-ne` = not equal to (numbers)
- `-gt` = greater than
- `-lt` = less than
- `-ge` = greater than or equal to
- `-le` = less than or equal to
- `= ` = equal to (text)
- `!=` = not equal to (text)

**Exercise 3.2: Severity Level Classifier**
```bash
nano severity_classifier.sh

#!/bin/bash
# Security Finding Severity Classifier

echo "=== SECURITY FINDING CLASSIFIER ==="
echo ""

echo -n "Enter risk score (1-100): "
read RISK_SCORE

if [ $RISK_SCORE -ge 90 ]; then
    SEVERITY="CRITICAL"
    COLOR="🔴"
elif [ $RISK_SCORE -ge 70 ]; then
    SEVERITY="HIGH"
    COLOR="🟠"
elif [ $RISK_SCORE -ge 40 ]; then
    SEVERITY="MEDIUM"
    COLOR="🟡"
elif [ $RISK_SCORE -ge 10 ]; then
    SEVERITY="LOW"
    COLOR="🟢"
else
    SEVERITY="INFO"
    COLOR="🔵"
fi

echo ""
echo "Risk Score: $RISK_SCORE"
echo "Severity: $COLOR $SEVERITY"
echo ""

# Show recommended actions
case $SEVERITY in
    "CRITICAL")
        echo "Recommended Actions:"
        echo "1. Immediate remediation required"
        echo "2. Escalate to security team"
        echo "3. Continuous monitoring"
        ;;
    "HIGH")
        echo "Recommended Actions:"
        echo "1. Remediate within 7 days"
        echo "2. Notify management"
        ;;
    "MEDIUM")
        echo "Recommended Actions:"
        echo "1. Remediate within 30 days"
        echo "2. Document in risk register"
        ;;
    *)
        echo "Recommended Actions:"
        echo "1. Monitor and review"
        ;;
esac

chmod +x severity_classifier.sh
./severity_classifier.sh
```

### **Part 3: Multiple Conditions & Case Statements (30 min)**

**Exercise 3.3: Access Control Checker**
```bash
nano access_checker.sh

#!/bin/bash
# Access Control Checker

echo "=== ACCESS CONTROL COMPLIANCE ==="
echo ""

echo -n "Enter user role (admin/user/guest): "
read USER_ROLE

echo -n "Enter authentication method (password/mfa/certificate): "
read AUTH_METHOD

echo -n "Enter sensitivity level (public/internal/confidential): "
read SENSITIVITY

# Check multiple conditions
if [ "$USER_ROLE" = "admin" ] && [ "$AUTH_METHOD" = "mfa" ]; then
    echo "✅ COMPLIANT: Admin with MFA - Full access granted"
    
elif [ "$USER_ROLE" = "user" ] && [ "$AUTH_METHOD" = "password" ] && [ "$SENSITIVITY" != "confidential" ]; then
    echo "✅ COMPLIANT: User with password - Standard access granted"
    
elif [ "$USER_ROLE" = "guest" ] && [ "$SENSITIVITY" = "public" ]; then
    echo "⚠️  RESTRICTED: Guest access - Public data only"
    
else
    echo "❌ NON-COMPLIANT: Access configuration violates policy"
    echo "   Please review:"
    echo "   - Role: $USER_ROLE"
    echo "   - Auth: $AUTH_METHOD"
    echo "   - Sensitivity: $SENSITIVITY"
fi

chmod +x access_checker.sh
./access_checker.sh
```

**Exercise 3.4: File Permission Checker**
```bash
nano file_permission_check.sh

#!/bin/bash
# File Permission Compliance Check

echo "=== FILE PERMISSION AUDIT ==="
echo ""

echo -n "Enter file path to check: "
read FILE_PATH

# Check if file exists
if [ ! -f "$FILE_PATH" ]; then
    echo "❌ ERROR: File does not exist!"
    exit 1
fi

# Get permissions
PERMISSIONS=$(stat -c "%A" "$FILE_PATH")
OWNER=$(stat -c "%U" "$FILE_PATH")

echo ""
echo "File: $FILE_PATH"
echo "Permissions: $PERMISSIONS"
echo "Owner: $OWNER"
echo ""

# Check each permission
if [[ $PERMISSIONS == *"w"* && $OWNER != "root" ]]; then
    echo "⚠️  WARNING: World-writable file with non-root owner"
    echo "   Risk: Medium - Unauthorized modifications possible"
    
elif [[ $PERMISSIONS == *"rwx"* ]]; then
    echo "⚠️  WARNING: Full permissions (rwx) granted"
    echo "   Risk: High - Least privilege violation"
    
elif [[ $PERMISSIONS == *"r--r--r--"* ]]; then
    echo "✅ SECURE: Read-only for all"
    echo "   Risk: Low - Appropriate for public data"
    
else
    echo "📋 REVIEW NEEDED: Custom permissions detected"
    echo "   Risk: Variable - Requires manual review"
fi

chmod +x file_permission_check.sh
./file_permission_check.sh
```

### **SESSION 3 HOMEWORK:**
Create a script called `compliance_scorer.sh` that:
1. Asks for 5 compliance scores (0-100 each)
2. Calculates average
3. Assigns grade: A (90-100), B (80-89), C (70-79), F (<70)
4. Shows specific feedback for each grade

---

# **SESSION 4: LOOPS - Repeating Tasks**

## **Learning Goal:** Use loops to automate repetitive tasks

### **Part 1: Understanding Loops (15 min)**

**Think of loops as ASSEMBLY LINES:**
```
   ┌─────────────────────────────────────┐
   │ For each employee in department:    │
   │   1. Check access rights            │
   │   2. Log last login                 │
   │   3. Verify MFA status              │
   │   4. Save to report                 │
   └─────────────────────────────────────┘
```

### **Part 2: For Loops (30 min)**

**Exercise 4.1: Check Multiple Users**
```bash
nano user_audit_loop.sh

#!/bin/bash
# User Account Audit using Loop

echo "=== USER ACCOUNT COMPLIANCE AUDIT ==="
echo ""

# List of users to check
USERS="jsmith mjones arogers pwilliams lsantiago"

echo "Auditing users: $USERS"
echo "----------------------------------------"

# Loop through each user
for USER in $USERS; do
    echo "Checking: $USER"
    
    # Simulated checks (in real life, use actual commands)
    echo "  • Last login: $(date -d '10 days ago' '+%Y-%m-%d')"
    echo "  • Password age: $((RANDOM % 100)) days"
    echo "  • MFA enabled: Yes"
    echo ""
done

echo "Audit complete!"
echo "Total users checked: $(echo $USERS | wc -w)"

chmod +x user_audit_loop.sh
./user_audit_loop.sh
```

**Exercise 4.2: Check Multiple Files**
```bash
nano config_file_checker.sh

#!/bin/bash
# Configuration File Compliance Check

echo "=== CONFIGURATION FILE AUDIT ==="
echo ""

# Important config files for compliance
CONFIG_FILES="/etc/passwd /etc/shadow /etc/ssh/sshd_config /etc/sudoers"

echo "Checking system configuration files..."
echo ""

for FILE in $CONFIG_FILES; do
    echo "File: $FILE"
    
    # Check if file exists
    if [ -f "$FILE" ]; then
        # Get file info
        SIZE=$(stat -c "%s" "$FILE")
        PERMISSIONS=$(stat -c "%A" "$FILE")
        OWNER=$(stat -c "%U" "$FILE")
        
        echo "  ✓ Exists"
        echo "  Size: $SIZE bytes"
        echo "  Permissions: $PERMISSIONS"
        echo "  Owner: $OWNER"
        
        # Check if world-readable (security check)
        if [[ $PERMISSIONS == *"r--"* ]]; then
            echo "  🔒 Security: World-readable (check sensitivity)"
        fi
    else
        echo "  ✗ NOT FOUND - Possible issue!"
    fi
    
    echo ""
done

echo "Total files checked: $(echo $CONFIG_FILES | wc -w)"

chmod +x config_file_checker.sh
sudo ./config_file_checker.sh
```

### **Part 3: While Loops (30 min)**

**Exercise 4.3: Continuous Monitoring Simulation**
```bash
nano continuous_monitor.sh

#!/bin/bash
# Continuous Security Monitoring

echo "=== CONTINUOUS SECURITY MONITOR ==="
echo "Press Ctrl+C to stop monitoring"
echo ""

MONITOR_COUNT=0

# Loop until user stops it
while true; do
    MONITOR_COUNT=$((MONITOR_COUNT + 1))
    CURRENT_TIME=$(date '+%H:%M:%S')
    
    echo "=== Check #$MONITOR_COUNT at $CURRENT_TIME ==="
    
    # Check logged in users
    echo "Logged in users:"
    who | awk '{print "  • " $1 " from " $5}'
    
    # Check disk space
    echo -n "Disk usage: "
    df -h / | awk 'NR==2 {print $5 " used"}'
    
    # Check for failed logins (simulated)
    FAILED_LOGINS=$((RANDOM % 5))
    if [ $FAILED_LOGINS -gt 0 ]; then
        echo "⚠️  Failed login attempts: $FAILED_LOGINS"
    fi
    
    echo ""
    
    # Wait 10 seconds before next check
    sleep 10
done

chmod +x continuous_monitor.sh
./continuous_monitor.sh
```

**Exercise 4.4: Compliance Checklist Manager**
```bash
nano compliance_checklist.sh

#!/bin/bash
# Interactive Compliance Checklist

echo "=== COMPLIANCE CHECKLIST MANAGER ==="
echo ""

CHECKLIST=()
COMPLETED=0

echo "Enter compliance items (type 'done' when finished):"
echo "---------------------------------------------------"

ITEM_NUMBER=1
while true; do
    echo -n "Item $ITEM_NUMBER: "
    read ITEM
    
    if [ "$ITEM" = "done" ]; then
        break
    fi
    
    CHECKLIST+=("$ITEM")
    ITEM_NUMBER=$((ITEM_NUMBER + 1))
done

echo ""
echo "=== YOUR CHECKLIST ==="
for i in "${!CHECKLIST[@]}"; do
    ITEM_NUM=$((i + 1))
    echo "$ITEM_NUM. ${CHECKLIST[$i]}"
done

echo ""
echo "Mark items as completed (enter item number, type 'done' when finished):"

while true; do
    echo -n "Completed item #: "
    read COMPLETED_ITEM
    
    if [ "$COMPLETED_ITEM" = "done" ]; then
        break
    fi
    
    # Mark as completed
    if [ $COMPLETED_ITEM -ge 1 ] && [ $COMPLETED_ITEM -le ${#CHECKLIST[@]} ]; then
        echo "✓ Marked item $COMPLETED_ITEM as completed"
        COMPLETED=$((COMPLETED + 1))
    else
        echo "Invalid item number"
    fi
done

echo ""
echo "=== SUMMARY ==="
echo "Total items: ${#CHECKLIST[@]}"
echo "Completed: $COMPLETED"
if [ $COMPLETED -eq ${#CHECKLIST[@]} ]; then
    echo "✅ ALL ITEMS COMPLETED!"
else
    echo "📋 $((${#CHECKLIST[@]} - COMPLETED)) items remaining"
fi

chmod +x compliance_checklist.sh
./compliance_checklist.sh
```

### **SESSION 4 HOMEWORK:**
Create a script called `vulnerability_scanner.sh` that:
1. Checks for common vulnerabilities (use simulated checks)
2. Uses a for loop to check 10 different "services"
3. Uses a while loop to continue until user says "stop"
4. Logs all findings with timestamps

---

# **SESSION 5: FUNCTIONS - Organizing Code**

## **Learning Goal:** Use functions to create reusable code blocks

### **Part 1: Understanding Functions (15 min)**

**Think of functions as TOOLBOXES:**
```
┌─────────────────────────┐
│   SECURITY TOOLBOX      │
├─────────────────────────┤
│ • check_passwords()     │
│ • audit_users()         │
│ • scan_ports()          │
│ • generate_report()     │
└─────────────────────────┘
```

### **Part 2: Creating Basic Functions (30 min)**

**Exercise 5.1: Modular Compliance Checker**
```bash
nano modular_compliance.sh

#!/bin/bash
# Modular Compliance Checker using Functions

# ========== FUNCTION DEFINITIONS ==========

# Function 1: Check password policy
check_password_policy() {
    echo "🔐 PASSWORD POLICY CHECK"
    echo "-----------------------"
    
    # Simulated check
    MIN_LENGTH=8
    MAX_AGE=90
    
    echo "✓ Minimum length: $MIN_LENGTH characters"
    echo "✓ Maximum age: $MAX_AGE days"
    echo "✓ Complexity required: Yes"
    echo ""
}

# Function 2: Check user accounts
check_user_accounts() {
    echo "👤 USER ACCOUNT AUDIT"
    echo "---------------------"
    
    TOTAL_USERS=$(getent passwd | wc -l)
    SUDO_USERS=$(getent group sudo | cut -d: -f4 | tr ',' '\n' | wc -l)
    
    echo "✓ Total users: $TOTAL_USERS"
    echo "✓ Users with sudo: $SUDO_USERS"
    echo "✓ Default accounts disabled: Yes"
    echo ""
}

# Function 3: Check firewall
check_firewall() {
    echo "🔥 FIREWALL STATUS"
    echo "------------------"
    
    # Check if UFW is active
    if systemctl is-active --quiet ufw; then
        echo "✓ Firewall: ACTIVE"
        RULES=$(sudo ufw status numbered | grep -c "^\[")
        echo "✓ Rules configured: $RULES"
    else
        echo "✗ Firewall: INACTIVE"
        echo "⚠️  Recommendation: Enable firewall"
    fi
    echo ""
}

# Function 4: Check updates
check_updates() {
    echo "🔄 SYSTEM UPDATES"
    echo "-----------------"
    
    UPDATES=$(apt list --upgradable 2>/dev/null | wc -l)
    
    if [ $UPDATES -gt 1 ]; then
        echo "✗ Updates pending: $((UPDATES-1))"
        echo "⚠️  Recommendation: Run 'sudo apt upgrade'"
    else
        echo "✓ System up to date"
    fi
    echo ""
}

# Function 5: Generate report header
generate_header() {
    echo "========================================"
    echo "     SECURITY COMPLIANCE REPORT"
    echo "========================================"
    echo "Date: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "System: $(hostname)"
    echo "Auditor: $(whoami)"
    echo "========================================"
    echo ""
}

# Function 6: Generate report footer
generate_footer() {
    echo ""
    echo "========================================"
    echo "         REPORT COMPLETE"
    echo "========================================"
    echo "Generated by: Modular Compliance Checker"
    echo "Timestamp: $(date)"
    echo "========================================"
}

# ========== MAIN EXECUTION ==========

# Clear screen and start
clear

# Generate report
generate_header
check_password_policy
check_user_accounts
check_firewall
check_updates
generate_footer

chmod +x modular_compliance.sh
./modular_compliance.sh
```

**Exercise 5.2: Function with Parameters**
```bash
nano risk_calculator.sh

#!/bin/bash
# Risk Calculator with Functions

# Function to calculate risk score
calculate_risk() {
    local impact=$1
    local likelihood=$2
    local control_effectiveness=$3
    
    # Risk formula: Impact * Likelihood * (1 - Control Effectiveness)
    local risk_score=$((impact * likelihood * (100 - control_effectiveness) / 100))
    
    echo $risk_score
}

# Function to classify risk
classify_risk() {
    local score=$1
    
    if [ $score -ge 80 ]; then
        echo "CRITICAL"
    elif [ $score -ge 60 ]; then
        echo "HIGH"
    elif [ $score -ge 40 ]; then
        echo "MEDIUM"
    elif [ $score -ge 20 ]; then
        echo "LOW"
    else
        echo "MINIMAL"
    fi
}

# Function to recommend actions
recommend_actions() {
    local classification=$1
    
    case $classification in
        "CRITICAL")
            echo "1. Immediate remediation required"
            echo "2. Escalate to executive team"
            echo "3. Implement compensating controls"
            ;;
        "HIGH")
            echo "1. Remediate within 7 days"
            echo "2. Additional monitoring required"
            echo "3. Update risk register"
            ;;
        "MEDIUM")
            echo "1. Remediate within 30 days"
            echo "2. Regular review needed"
            ;;
        "LOW")
            echo "1. Accept risk with approval"
            echo "2. Monitor periodically"
            ;;
        *)
            echo "1. Document and monitor"
            ;;
    esac
}

# Main program
echo "=== RISK ASSESSMENT CALCULATOR ==="
echo ""

# Get inputs
echo "Enter values (1-100):"
echo -n "Impact (1-100): "
read IMPACT

echo -n "Likelihood (1-100): "
read LIKELIHOOD

echo -n "Control Effectiveness (1-100): "
read CONTROLS

# Calculate risk
RISK_SCORE=$(calculate_risk $IMPACT $LIKELIHOOD $CONTROLS)
CLASSIFICATION=$(classify_risk $RISK_SCORE)

# Show results
echo ""
echo "=== RISK ASSESSMENT RESULTS ==="
echo "Impact: $IMPACT"
echo "Likelihood: $LIKELIHOOD"
echo "Control Effectiveness: $CONTROLS%"
echo "-------------------------------"
echo "Risk Score: $RISK_SCORE"
echo "Classification: $CLASSIFICATION"
echo ""
echo "=== RECOMMENDED ACTIONS ==="
recommend_actions "$CLASSIFICATION"

chmod +x risk_calculator.sh
./risk_calculator.sh
```

### **Part 3: Advanced Function Techniques (30 min)**

**Exercise 5.3: Logging Framework**
```bash
nano logging_framework.sh

#!/bin/bash
# Logging Framework for Compliance Scripts

LOG_FILE="compliance_audit_$(date +%Y%m%d).log"

# Function: Initialize log
init_log() {
    echo "=== COMPLIANCE AUDIT LOG ===" > "$LOG_FILE"
    echo "Start time: $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE"
    echo "System: $(hostname)" >> "$LOG_FILE"
    echo "Auditor: $(whoami)" >> "$LOG_FILE"
    echo "======================================" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
}

# Function: Log message with timestamp
log_message() {
    local level=$1
    local message=$2
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    echo "[$timestamp] [$level] $message" | tee -a "$LOG_FILE"
}

# Function: Log check result
log_check() {
    local check_name=$1
    local status=$2
    local details=$3
    
    if [ "$status" = "PASS" ]; then
        log_message "PASS" "✓ $check_name: $details"
    elif [ "$status" = "FAIL" ]; then
        log_message "FAIL" "✗ $check_name: $details"
    else
        log_message "WARN" "⚠ $check_name: $details"
    fi
}

# Function: Generate summary
generate_summary() {
    echo "" >> "$LOG_FILE"
    echo "=== AUDIT SUMMARY ===" >> "$LOG_FILE"
    
    TOTAL_CHECKS=$(grep -c "\[PASS\]\|\[FAIL\]\|\[WARN\]" "$LOG_FILE")
    PASS_COUNT=$(grep -c "\[PASS\]" "$LOG_FILE")
    FAIL_COUNT=$(grep -c "\[FAIL\]" "$LOG_FILE")
    WARN_COUNT=$(grep -c "\[WARN\]" "$LOG_FILE")
    
    echo "Total checks: $TOTAL_CHECKS" >> "$LOG_FILE"
    echo "Passed: $PASS_COUNT" >> "$LOG_FILE"
    echo "Failed: $FAIL_COUNT" >> "$LOG_FILE"
    echo "Warnings: $WARN_COUNT" >> "$LOG_FILE"
    
    if [ $FAIL_COUNT -eq 0 ]; then
        echo "Overall Status: COMPLIANT" >> "$LOG_FILE"
    else
        echo "Overall Status: NON-COMPLIANT" >> "$LOG_FILE"
    fi
    
    echo "End time: $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE"
}

# Function: Show log file
show_log() {
    echo ""
    echo "=== LOG FILE CONTENTS ==="
    echo "File: $LOG_FILE"
    echo "========================"
    cat "$LOG_FILE"
}

# Main execution
main() {
    init_log
    
    log_message "INFO" "Starting compliance audit"
    
    # Simulate some checks
    log_check "Password Policy" "PASS" "Minimum 8 characters enforced"
    log_check "Firewall Status" "WARN" "Active but missing some rules"
    log_check "User Accounts" "PASS" "All accounts have MFA"
    log_check "System Updates" "FAIL" "15 security updates pending"
    log_check "Logging" "PASS" "Audit logs enabled and retained"
    
    log_message "INFO" "Audit completed"
    
    generate_summary
    show_log
}

# Run the script
main

chmod +x logging_framework.sh
./logging_framework.sh
```

### **SESSION 5 HOMEWORK:**
Create a script called `compliance_framework.sh` with:
1. 5 different functions for different compliance checks
2. A main function that calls all others
3. Error handling in each function
4. A summary function that shows overall compliance status

---

# **SESSION 6: REAL PROJECTS - Practical Applications**

## **Learning Goal:** Apply all concepts to build real-world GRC tools

### **Part 1: Complete Compliance Scanner (45 min)**

**Exercise 6.1: Enterprise Compliance Scanner**
```bash
nano enterprise_scanner.sh

#!/bin/bash
# Enterprise Compliance Scanner v1.0

# Configuration
REPORT_DIR="./compliance_reports"
REPORT_FILE="$REPORT_DIR/scan_$(date +%Y%m%d_%H%M%S).txt"
SCAN_DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Create report directory
mkdir -p "$REPORT_DIR"

# Function: Initialize report
init_report() {
    cat > "$REPORT_FILE" << EOF
╔══════════════════════════════════════════════╗
║      ENTERPRISE COMPLIANCE SCAN REPORT       ║
╠══════════════════════════════════════════════╣
║ Scan Date: $SCAN_DATE
║ System: $(hostname)
║ Auditor: $(whoami)
║ Report ID: AUDIT-$(date +%Y%m%d)-$(date +%H%M%S)
╚══════════════════════════════════════════════╝

EOF
}

# Function: Check 1 - User Account Compliance
check_users() {
    echo "SECTION 1: USER ACCOUNT COMPLIANCE" >> "$REPORT_FILE"
    echo "====================================" >> "$REPORT_FILE"
    
    # Count users
    TOTAL_USERS=$(getent passwd | wc -l)
    ACTIVE_USERS=$(who | wc -l)
    
    echo "• Total user accounts: $TOTAL_USERS" >> "$REPORT_FILE"
    echo "• Currently active users: $ACTIVE_USERS" >> "$REPORT_FILE"
    
    # Check for users without passwords
    NO_PASSWORD_USERS=$(sudo awk -F: '($2 == "" || $2 == "!") {print $1}' /etc/shadow 2>/dev/null | wc -l)
    if [ $NO_PASSWORD_USERS -gt 0 ]; then
        echo "✗ CRITICAL: $NO_PASSWORD_USERS accounts with no password!" >> "$REPORT_FILE"
    else
        echo "✓ All accounts have passwords" >> "$REPORT_FILE"
    fi
    
    # Check for duplicate UIDs
    DUPLICATE_UIDS=$(cut -f3 -d: /etc/passwd | sort | uniq -d | wc -l)
    if [ $DUPLICATE_UIDS -gt 0 ]; then
        echo "⚠ WARNING: $DUPLICATE_UIDS duplicate UIDs found" >> "$REPORT_FILE"
    else
        echo "✓ No duplicate UIDs" >> "$REPORT_FILE"
    fi
    
    echo "" >> "$REPORT_FILE"
}

# Function: Check 2 - File System Security
check_filesystem() {
    echo "SECTION 2: FILE SYSTEM SECURITY" >> "$REPORT_FILE"
    echo "=================================" >> "$REPORT_FILE"
    
    # Check world-writable files
    echo "• Checking for world-writable files..." >> "$REPORT_FILE"
    WW_FILES=$(find /home -type f -perm -0002 ! -path "*/\.*" 2>/dev/null | wc -l)
    
    if [ $WW_FILES -gt 0 ]; then
        echo "⚠ WARNING: $WW_FILES world-writable files found" >> "$REPORT_FILE"
        echo "  Sample files:" >> "$REPORT_FILE"
        find /home -type f -perm -0002 ! -path "*/\.*" 2>/dev/null | head -5 | sed 's/^/    - /' >> "$REPORT_FILE"
    else
        echo "✓ No world-writable files found" >> "$REPORT_FILE"
    fi
    
    # Check /tmp permissions
    TMP_PERMS=$(stat -c "%a" /tmp)
    if [ "$TMP_PERMS" = "1777" ]; then
        echo "✓ /tmp permissions are secure: $TMP_PERMS" >> "$REPORT_FILE"
    else
        echo "✗ /tmp permissions incorrect: $TMP_PERMS (should be 1777)" >> "$REPORT_FILE"
    fi
    
    echo "" >> "$REPORT_FILE"
}

# Function: Check 3 - Network Security
check_network() {
    echo "SECTION 3: NETWORK SECURITY" >> "$REPORT_FILE"
    echo "============================" >> "$REPORT_FILE"
    
    # Check listening ports
    echo "• Network ports in LISTEN state:" >> "$REPORT_FILE"
    netstat -tuln | grep LISTEN | awk '{print "    - " $4 " (" $6 ")"}' >> "$REPORT_FILE"
    
    # Check SSH configuration
    if grep -q "^PermitRootLogin no" /etc/ssh/sshd_config 2>/dev/null; then
        echo "✓ SSH root login disabled" >> "$REPORT_FILE"
    else
        echo "✗ SSH root login may be enabled" >> "$REPORT_FILE"
    fi
    
    # Check for unnecessary services
    UNNECESSARY_SERVICES="telnet rsh rlogin ftp"
    for service in $UNNECESSARY_SERVICES; do
        if systemctl is-active --quiet $service 2>/dev/null; then
            echo "✗ Insecure service running: $service" >> "$REPORT_FILE"
        fi
    done
    
    echo "" >> "$REPORT_FILE"
}

# Function: Check 4 - System Updates
check_updates() {
    echo "SECTION 4: SYSTEM UPDATES" >> "$REPORT_FILE"
    echo "==========================" >> "$REPORT_FILE"
    
    # Check for pending updates
    if command -v apt &> /dev/null; then
        UPDATE_COUNT=$(apt list --upgradable 2>/dev/null | wc -l)
        if [ $UPDATE_COUNT -gt 1 ]; then
            echo "✗ $((UPDATE_COUNT-1)) updates pending" >> "$REPORT_FILE"
        else
            echo "✓ System is up to date" >> "$REPORT_FILE"
        fi
    else
        echo "⚠ Update check not available (apt not found)" >> "$REPORT_FILE"
    fi
    
    # Check automatic updates
    if systemctl is-enabled --quiet unattended-upgrades 2>/dev/null; then
        echo "✓ Automatic updates enabled" >> "$REPORT_FILE"
    else
        echo "⚠ Automatic updates not enabled" >> "$REPORT_FILE"
    fi
    
    echo "" >> "$REPORT_FILE"
}

# Function: Generate Summary
generate_summary() {
    echo "SECTION 5: EXECUTIVE SUMMARY" >> "$REPORT_FILE"
    echo "=============================" >> "$REPORT_FILE"
    
    # Count findings from report
    CRITICAL_COUNT=$(grep -c "✗ CRITICAL" "$REPORT_FILE")
    WARNING_COUNT=$(grep -c "⚠ WARNING\|✗ Insecure\|✗ [0-9]* updates" "$REPORT_FILE")
    PASS_COUNT=$(grep -c "✓" "$REPORT_FILE")
    
    echo "• Total checks performed: 4 major categories" >> "$REPORT_FILE"
    echo "• Critical findings: $CRITICAL_COUNT" >> "$REPORT_FILE"
    echo "• Warnings: $WARNING_COUNT" >> "$REPORT_FILE"
    echo "• Passed checks: $PASS_COUNT" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
    
    # Overall status
    if [ $CRITICAL_COUNT -gt 0 ]; then
        echo "❌ OVERALL STATUS: NON-COMPLIANT" >> "$REPORT_FILE"
        echo "   Immediate action required for critical findings" >> "$REPORT_FILE"
    elif [ $WARNING_COUNT -gt 0 ]; then
        echo "⚠ OVERALL STATUS: NEEDS IMPROVEMENT" >> "$REPORT_FILE"
        echo "   Address warnings to achieve full compliance" >> "$REPORT_FILE"
    else
        echo "✅ OVERALL STATUS: COMPLIANT" >> "$REPORT_FILE"
        echo "   All security checks passed successfully" >> "$REPORT_FILE"
    fi
    
    echo "" >> "$REPORT_FILE"
    echo "Report generated by Enterprise Compliance Scanner v1.0" >> "$REPORT_FILE"
    echo "For questions, contact: security@example.com" >> "$REPORT_FILE"
}

# Function: Display progress
show_progress() {
    echo -n "."
    sleep 0.5
}

# Main execution
main() {
    clear
    echo "🚀 Starting Enterprise Compliance Scan"
    echo "======================================"
    echo ""
    
    # Initialize
    echo -n "Initializing report"
    show_progress
    init_report
    
    # Run checks
    echo -n "Checking user accounts"
    show_progress
    check_users
    
    echo -n "Checking file system"
    show_progress
    check_filesystem
    
    echo -n "Checking network security"
    show_progress
    check_network
    
    echo -n "Checking system updates"
    show_progress
    check_updates
    
    # Generate summary
    echo -n "Generating summary"
    show_progress
    generate_summary
    
    echo ""
    echo ""
    echo "✅ Scan complete!"
    echo ""
    echo "📋 Report saved to: $REPORT_FILE"
    echo ""
    echo "=== QUICK PREVIEW ==="
    echo "---------------------"
    tail -20 "$REPORT_FILE"
}

# Run with sudo for full access
if [ "$EUID" -ne 0 ]; then
    echo "⚠ Running without sudo - some checks may be limited"
    echo "  For full scan, run: sudo ./enterprise_scanner.sh"
    echo ""
fi

main

chmod +x enterprise_scanner.sh
# Run with: ./enterprise_scanner.sh
# For full scan: sudo ./enterprise_scanner.sh
```

## **Next Steps:**
1. **Advanced Bash Scripting** - Learn arrays, regex, advanced text processing
2. **Python for GRC** - More powerful automation capabilities  
3. **APIs & Integrations** - Connect your scripts to other systems
4. **DevSecOps** - Integrate security into development pipelines
5. **GRC Platforms** - Enterprise GRC tools like RSA Archer, ServiceNow

**Remember:** The journey doesn't end here. Keep learning, keep scripting, and keep securing! 
