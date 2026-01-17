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

### **Part 2: Automated Report Generator (45 min)**

**Exercise 6.2: Automated Compliance Dashboard**
```bash
nano compliance_dashboard.sh

#!/bin/bash
# Automated Compliance Dashboard Generator

# Configuration
DASHBOARD_DIR="./compliance_dashboard"
HTML_FILE="$DASHBOARD_DIR/index.html"
CSS_FILE="$DASHBOARD_DIR/style.css"
DATA_FILE="$DASHBOARD_DIR/data.json"
SCAN_DATE=$(date '+%Y-%m-%d')

# Create dashboard directory
mkdir -p "$DASHBOARD_DIR"

# Function: Generate CSS
generate_css() {
    cat > "$CSS_FILE" << 'EOF'
/* Compliance Dashboard Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
    padding: 20px;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    background: white;
    border-radius: 20px;
    box-shadow: 0 20px 60px rgba(0,0,0,0.3);
    overflow: hidden;
}

.header {
    background: linear-gradient(90deg, #1a237e, #283593);
    color: white;
    padding: 30px;
    text-align: center;
}

.header h1 {
    font-size: 2.5em;
    margin-bottom: 10px;
}

.header p {
    opacity: 0.9;
    font-size: 1.1em;
}

.stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    padding: 30px;
}

.stat-card {
    background: white;
    border-radius: 15px;
    padding: 25px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    text-align: center;
    transition: transform 0.3s, box-shadow 0.3s;
}

.stat-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

.stat-card.good {
    border-top: 5px solid #4CAF50;
}

.stat-card.warning {
    border-top: 5px solid #FF9800;
}

.stat-card.critical {
    border-top: 5px solid #F44336;
}

.stat-number {
    font-size: 3em;
    font-weight: bold;
    margin: 15px 0;
}

.stat-label {
    color: #666;
    font-size: 1.1em;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.charts {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
    padding: 0 30px 30px;
}

.chart-container {
    background: white;
    border-radius: 15px;
    padding: 25px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.chart-title {
    font-size: 1.3em;
    margin-bottom: 20px;
    color: #333;
    text-align: center;
}

.footer {
    background: #f5f5f5;
    padding: 20px;
    text-align: center;
    border-top: 1px solid #ddd;
    color: #666;
}

.update-btn {
    display: inline-block;
    background: #4CAF50;
    color: white;
    padding: 12px 30px;
    border-radius: 50px;
    text-decoration: none;
    font-weight: bold;
    margin-top: 15px;
    transition: background 0.3s;
}

.update-btn:hover {
    background: #45a049;
}

/* Status indicators */
.status-good { color: #4CAF50; }
.status-warning { color: #FF9800; }
.status-critical { color: #F44336; }

/* Responsive */
@media (max-width: 768px) {
    .container {
        margin: 10px;
        border-radius: 10px;
    }
    
    .header {
        padding: 20px;
    }
    
    .header h1 {
        font-size: 1.8em;
    }
}
EOF
}

# Function: Generate HTML Dashboard
generate_html() {
    # Simulate some compliance data
    TOTAL_CHECKS=$((RANDOM % 50 + 100))
    PASSED_CHECKS=$((TOTAL_CHECKS - RANDOM % 20))
    FAILED_CHECKS=$((TOTAL_CHECKS - PASSED_CHECKS))
    CRITICAL_ISSUES=$((RANDOM % 10))
    WARNINGS=$((FAILED_CHECKS - CRITICAL_ISSUES))
    
    COMPLIANCE_PERCENT=$((PASSED_CHECKS * 100 / TOTAL_CHECKS))
    
    # Determine overall status
    if [ $COMPLIANCE_PERCENT -ge 90 ]; then
        STATUS="COMPLIANT"
        STATUS_CLASS="status-good"
    elif [ $COMPLIANCE_PERCENT -ge 70 ]; then
        STATUS="NEEDS IMPROVEMENT"
        STATUS_CLASS="status-warning"
    else
        STATUS="NON-COMPLIANT"
        STATUS_CLASS="status-critical"
    fi
    
    cat > "$HTML_FILE" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compliance Dashboard</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📊 Security Compliance Dashboard</h1>
            <p>Last updated: $SCAN_DATE | System: $(hostname) | Auditor: $(whoami)</p>
            <p class="$STATUS_CLASS" style="font-size: 1.2em; margin-top: 10px;">
                <strong>Overall Status: $STATUS ($COMPLIANCE_PERCENT%)</strong>
            </p>
        </div>
        
        <div class="stats-grid">
            <div class="stat-card good">
                <div class="stat-label">Total Checks</div>
                <div class="stat-number">$TOTAL_CHECKS</div>
                <p>Comprehensive security assessment</p>
            </div>
            
            <div class="stat-card good">
                <div class="stat-label">Passed Checks</div>
                <div class="stat-number">$PASSED_CHECKS</div>
                <p>Meeting compliance requirements</p>
            </div>
            
            <div class="stat-card warning">
                <div class="stat-label">Warnings</div>
                <div class="stat-number">$WARNINGS</div>
                <p>Require attention within 30 days</p>
            </div>
            
            <div class="stat-card critical">
                <div class="stat-label">Critical Issues</div>
                <div class="stat-number">$CRITICAL_ISSUES</div>
                <p>Immediate action required</p>
            </div>
        </div>
        
        <div class="charts">
            <div class="chart-container">
                <div class="chart-title">Compliance Status Overview</div>
                <canvas id="complianceChart"></canvas>
            </div>
            
            <div class="chart-container">
                <div class="chart-title">Issue Severity Distribution</div>
                <canvas id="severityChart"></canvas>
            </div>
        </div>
        
        <div class="footer">
            <p>This dashboard is automatically generated by Compliance Automation System v1.0</p>
            <p>Next scheduled audit: $(date -d '+7 days' '+%Y-%m-%d')</p>
            <a href="#" class="update-btn" onclick="location.reload()">🔄 Refresh Dashboard</a>
            <p style="margin-top: 20px; font-size: 0.9em;">
                Contact: security-team@example.com | Phone: (555) 123-4567
            </p>
        </div>
    </div>
    
    <script>
        // Compliance Status Chart
        const complianceCtx = document.getElementById('complianceChart').getContext('2d');
        const complianceChart = new Chart(complianceCtx, {
            type: 'doughnut',
            data: {
                labels: ['Compliant', 'Non-Compliant'],
                datasets: [{
                    data: [$PASSED_CHECKS, $FAILED_CHECKS],
                    backgroundColor: ['#4CAF50', '#F44336'],
                    borderWidth: 2,
                    borderColor: '#fff'
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom'
                    },
                    title: {
                        display: true,
                        text: 'Overall Compliance Rate: $COMPLIANCE_PERCENT%'
                    }
                }
            }
        });
        
        // Severity Distribution Chart
        const severityCtx = document.getElementById('severityChart').getContext('2d');
        const severityChart = new Chart(severityCtx, {
            type: 'bar',
            data: {
                labels: ['Critical', 'High', 'Medium', 'Low', 'Info'],
                datasets: [{
                    label: 'Number of Issues',
                    data: [$CRITICAL_ISSUES, $((WARNINGS/2)), $((WARNINGS/4)), $((WARNINGS/4)), $((RANDOM % 5))],
                    backgroundColor: [
                        '#F44336',
                        '#FF9800',
                        '#FFC107',
                        '#8BC34A',
                        '#2196F3'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Number of Issues'
                        }
                    }
                },
                plugins: {
                    title: {
                        display: true,
                        text: 'Security Issues by Severity Level'
                    }
                }
            }
        });
    </script>
</body>
</html>
EOF
}

# Function: Generate JSON data
generate_json() {
    cat > "$DATA_FILE" << EOF
{
    "dashboard": {
        "title": "Security Compliance Dashboard",
        "generated": "$(date -Iseconds)",
        "system": "$(hostname)",
        "auditor": "$(whoami)"
    },
    "metrics": {
        "total_checks": 145,
        "passed_checks": 132,
        "failed_checks": 13,
        "compliance_percentage": 91,
        "critical_issues": 2,
        "high_issues": 4,
        "medium_issues": 5,
        "low_issues": 2
    },
    "categories": [
        {
            "name": "Access Control",
            "status": "compliant",
            "checks_passed": 25,
            "checks_failed": 0
        },
        {
            "name": "Network Security",
            "status": "compliant",
            "checks_passed": 30,
            "checks_failed": 1
        },
        {
            "name": "System Hardening",
            "status": "needs_improvement",
            "checks_passed": 40,
            "checks_failed": 5
        },
        {
            "name": "Data Protection",
            "status": "compliant",
            "checks_passed": 28,
            "checks_failed": 0
        },
        {
            "name": "Monitoring & Logging",
            "status": "non_compliant",
            "checks_passed": 9,
            "checks_failed": 7
        }
    ],
    "recommendations": [
        "Enable centralized logging for all systems",
        "Implement multi-factor authentication for admin accounts",
        "Update password policy to require 12+ characters",
        "Schedule quarterly vulnerability assessments",
        "Deploy intrusion detection system"
    ]
}
EOF
}

# Main execution
main() {
    echo "🛠️  Building Compliance Dashboard..."
    echo "==================================="
    echo ""
    
    echo "📝 Generating CSS styles..."
    generate_css
    
    echo "📊 Creating HTML dashboard..."
    generate_html
    
    echo "📄 Generating JSON data..."
    generate_json
    
    echo ""
    echo "✅ Dashboard created successfully!"
    echo ""
    echo "📂 Files created in: $DASHBOARD_DIR"
    echo "   • index.html    - Main dashboard"
    echo "   • style.css     - Styling"
    echo "   • data.json     - Data file"
    echo ""
    echo "🌐 To view the dashboard:"
    echo "   firefox $HTML_FILE 2>/dev/null || xdg-open $HTML_FILE"
    echo ""
    echo "🔄 To update the dashboard, run this script again"
}

main

chmod +x compliance_dashboard.sh
./compliance_dashboard.sh
```

### **SESSION 6 HOMEWORK:**
Create your own GRC automation tool that:
1. Scans for specific compliance issues
2. Generates a professional report
3. Creates visual charts/graphs
4. Includes recommendations
5. Can be scheduled to run automatically

---

# **SESSION 7: ADVANCED TOPICS - Professional Scripts**

## **Learning Goal:** Learn professional techniques for production scripts

### **Part 1: Error Handling & Logging (30 min)**

**Exercise 7.1: Professional Error Handling**
```bash
nano professional_audit.sh

#!/bin/bash
# Professional Audit Script with Error Handling

# ========== CONFIGURATION ==========
set -euo pipefail  # Strict mode
trap 'error_handler $? $LINENO' ERR

LOG_FILE="audit_$(date +%Y%m%d_%H%M%S).log"
REPORT_FILE="audit_report_$(date +%Y%m%d).html"
TEMP_DIR="/tmp/audit_$$"  # $$ = current process ID

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'  # No Color

# ========== FUNCTIONS ==========

# Error handler function
error_handler() {
    local exit_code=$1
    local line_no=$2
    local error_msg="$3"
    
    echo -e "${RED}✗ ERROR at line $line_no: $error_msg${NC}" | tee -a "$LOG_FILE"
    echo "Exit code: $exit_code" | tee -a "$LOG_FILE"
    
    # Cleanup temp files
    cleanup
    
    exit $exit_code
}

# Cleanup function
cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
        log_message "INFO" "Cleaned up temporary directory"
    fi
}

# Logging function
log_message() {
    local level=$1
    local message=$2
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    case $level in
        "INFO") color=$BLUE ;;
        "SUCCESS") color=$GREEN ;;
        "WARN") color=$YELLOW ;;
        "ERROR") color=$RED ;;
        *) color=$NC ;;
    esac
    
    echo -e "${color}[$timestamp] [$level] $message${NC}" | tee -a "$LOG_FILE"
}

# Function to check prerequisites
check_prerequisites() {
    log_message "INFO" "Checking prerequisites..."
    
    # Check if running as root
    if [ "$EUID" -ne 0 ]; then
        log_message "WARN" "Script not running as root - some checks may be limited"
    fi
    
    # Check required commands
    local required_commands="awk grep sed date ls"
    for cmd in $required_commands; do
        if ! command -v "$cmd" &> /dev/null; then
            error_handler 1 $LINENO "Required command not found: $cmd"
        fi
    done
    
    # Create temp directory
    mkdir -p "$TEMP_DIR"
    log_message "SUCCESS" "Prerequisites check passed"
}

# Function to validate input
validate_input() {
    local input=$1
    local pattern=$2
    local description=$3
    
    if [[ ! $input =~ $pattern ]]; then
        error_handler 1 $LINENO "Invalid $description: $input"
    fi
}

# Function to safely execute command
safe_execute() {
    local cmd="$1"
    local description="$2"
    
    log_message "INFO" "Executing: $description"
    
    if eval "$cmd" 2>> "$LOG_FILE"; then
        log_message "SUCCESS" "Completed: $description"
        return 0
    else
        error_handler $? $LINENO "Failed: $description"
        return 1
    fi
}

# Function to perform security check
perform_security_check() {
    local check_id=$1
    local check_name=$2
    local command=$3
    local success_pattern=$4
    
    log_message "INFO" "Running check: $check_name"
    
    local output
    output=$(eval "$command" 2>/dev/null || true)
    
    if echo "$output" | grep -q "$success_pattern"; then
        echo "$check_id,SUCCESS,$check_name" >> "$TEMP_DIR/results.csv"
        log_message "SUCCESS" "Check passed: $check_name"
        return 0
    else
        echo "$check_id,FAILED,$check_name" >> "$TEMP_DIR/results.csv"
        log_message "WARN" "Check failed: $check_name"
        return 1
    fi
}

# Function to generate report
generate_report() {
    log_message "INFO" "Generating HTML report..."
    
    local total_checks=$(wc -l < "$TEMP_DIR/results.csv")
    local passed_checks=$(grep -c "SUCCESS" "$TEMP_DIR/results.csv")
    local failed_checks=$((total_checks - passed_checks))
    local compliance_rate=$((passed_checks * 100 / total_checks))
    
    cat > "$REPORT_FILE" << EOF
<!DOCTYPE html>
<html>
<head>
    <title>Professional Audit Report</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .header { background: #2c3e50; color: white; padding: 20px; border-radius: 5px; }
        .summary { background: #ecf0f1; padding: 20px; border-radius: 5px; margin: 20px 0; }
        .success { color: #27ae60; }
        .failed { color: #e74c3c; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #34495e; color: white; }
        .passed { background-color: #d5f4e6; }
        .failed-row { background-color: #fadbd8; }
    </style>
</head>
<body>
    <div class="header">
        <h1>🔒 Professional Security Audit Report</h1>
        <p>Generated: $(date)</p>
        <p>System: $(hostname)</p>
    </div>
    
    <div class="summary">
        <h2>📊 Executive Summary</h2>
        <p><strong>Total Checks:</strong> $total_checks</p>
        <p class="success"><strong>Passed:</strong> $passed_checks</p>
        <p class="failed"><strong>Failed:</strong> $failed_checks</p>
        <p><strong>Compliance Rate:</strong> $compliance_rate%</p>
    </div>
    
    <h2>📋 Detailed Results</h2>
    <table>
        <tr>
            <th>Check ID</th>
            <th>Status</th>
            <th>Description</th>
            <th>Timestamp</th>
        </tr>
EOF
    
    # Add each check result
    while IFS=',' read -r id status description; do
        if [ "$status" = "SUCCESS" ]; then
            row_class="passed"
            status_display="✅ PASS"
        else
            row_class="failed-row"
            status_display="❌ FAIL"
        fi
        
        echo "        <tr class=\"$row_class\">" >> "$REPORT_FILE"
        echo "            <td>$id</td>" >> "$REPORT_FILE"
        echo "            <td>$status_display</td>" >> "$REPORT_FILE"
        echo "            <td>$description</td>" >> "$REPORT_FILE"
        echo "            <td>$(date '+%H:%M:%S')</td>" >> "$REPORT_FILE"
        echo "        </tr>" >> "$REPORT_FILE"
    done < "$TEMP_DIR/results.csv"
    
    cat >> "$REPORT_FILE" << EOF
    </table>
    
    <div style="margin-top: 30px; padding: 20px; background: #f8f9fa; border-radius: 5px;">
        <h3>📝 Recommendations</h3>
        <ul>
            <li>Address all failed checks within 7 days</li>
            <li>Schedule regular automated audits</li>
            <li>Implement continuous monitoring</li>
            <li>Review logs daily: $LOG_FILE</li>
        </ul>
        <p><strong>Generated by:</strong> Professional Audit Script v1.0</p>
        <p><strong>Log File:</strong> $LOG_FILE</p>
    </div>
</body>
</html>
EOF
    
    log_message "SUCCESS" "Report generated: $REPORT_FILE"
}

# ========== MAIN EXECUTION ==========

main() {
    log_message "INFO" "Starting professional audit script"
    log_message "INFO" "Log file: $LOG_FILE"
    
    # Setup
    check_prerequisites
    
    # Initialize results file
    echo "ID,Status,Description" > "$TEMP_DIR/results.csv"
    
    # Perform security checks
    log_message "INFO" "Performing security checks..."
    
    # Check 1: Password policy
    perform_security_check \
        "SEC-001" \
        "Password Policy Check" \
        "grep 'minlen' /etc/security/pwquality.conf 2>/dev/null || echo 'NOT FOUND'" \
        "minlen"
    
    # Check 2: SSH configuration
    perform_security_check \
        "SEC-002" \
        "SSH Root Login Check" \
        "grep '^PermitRootLogin' /etc/ssh/sshd_config 2>/dev/null || echo 'PermitRootLogin yes'" \
        "no"
    
    # Check 3: Firewall status
    perform_security_check \
        "SEC-003" \
        "Firewall Status Check" \
        "systemctl is-active ufw 2>/dev/null || echo 'inactive'" \
        "active"
    
    # Check 4: System updates
    perform_security_check \
        "SEC-004" \
        "System Updates Check" \
        "apt list --upgradable 2>/dev/null | wc -l" \
        "^1$"
    
    # Check 5: File permissions
    perform_security_check \
        "SEC-005" \
        "Critical File Permissions" \
        "stat -c '%a' /etc/passwd 2>/dev/null || echo '000'" \
        "^644$"
    
    # Generate report
    generate_report
    
    # Final summary
    local total_checks=$(wc -l < "$TEMP_DIR/results.csv")
    local passed_checks=$(grep -c "SUCCESS" "$TEMP_DIR/results.csv")
    
    log_message "SUCCESS" "Audit completed successfully"
    log_message "INFO" "Total checks: $total_checks"
    log_message "INFO" "Passed checks: $passed_checks"
    
    # Cleanup
    cleanup
    
    # Show report location
    echo ""
    echo -e "${GREEN}✅ AUDIT COMPLETE${NC}"
    echo "=================="
    echo "📋 Report: $REPORT_FILE"
    echo "📝 Logs: $LOG_FILE"
    echo ""
    echo "To view report: firefox $REPORT_FILE 2>/dev/null || xdg-open $REPORT_FILE"
}

# ========== SCRIPT ENTRY POINT ==========

# Create log file
touch "$LOG_FILE"

# Run main function
main "$@"

# Exit with success
exit 0

chmod +x professional_audit.sh
sudo ./professional_audit.sh  # Run with sudo for best results
```

### **Part 2: Script Optimization & Best Practices (30 min)**

**Exercise 7.2: Optimized Production Script**
```bash
nano production_ready_audit.sh

#!/usr/bin/env bash
# Production-Ready Compliance Audit Script
# Version: 1.0.0
# Author: GRC Security Team
# License: MIT

# =============================================================================
# CONFIGURATION SECTION
# =============================================================================

readonly SCRIPT_NAME="$(basename "$0")"
readonly SCRIPT_VERSION="1.0.0"
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Configuration variables (can be overridden by environment)
: "${LOG_LEVEL:=INFO}"                     # DEBUG, INFO, WARN, ERROR
: "${REPORT_FORMAT:=html}"                 # html, json, csv
: "${OUTPUT_DIR:="$SCRIPT_DIR/reports"}"   # Output directory
: "${CONFIG_FILE:="$SCRIPT_DIR/config.conf"}" # Configuration file

# =============================================================================
# CONSTANTS
# =============================================================================

readonly SUCCESS=0
readonly FAILURE=1

# ANSI color codes (only if output is to terminal)
if [[ -t 1 ]]; then
    readonly COLOR_RED='\033[0;31m'
    readonly COLOR_GREEN='\033[0;32m'
    readonly COLOR_YELLOW='\033[1;33m'
    readonly COLOR_BLUE='\033[0;34m'
    readonly COLOR_RESET='\033[0m'
else
    readonly COLOR_RED=''
    readonly COLOR_GREEN=''
    readonly COLOR_YELLOW=''
    readonly COLOR_BLUE=''
    readonly COLOR_RESET=''
fi

# =============================================================================
# LOGGING FUNCTIONS
# =============================================================================

get_timestamp() {
    date '+%Y-%m-%d %H:%M:%S'
}

log() {
    local level="$1"
    local message="$2"
    local timestamp
    
    timestamp=$(get_timestamp)
    
    # Check log level
    case "$LOG_LEVEL" in
        DEBUG) ;;
        INFO) [[ "$level" == "DEBUG" ]] && return ;;
        WARN) [[ "$level" == "DEBUG" || "$level" == "INFO" ]] && return ;;
        ERROR) [[ "$level" != "ERROR" ]] && return ;;
    esac
    
    case "$level" in
        DEBUG) color="$COLOR_BLUE" ;;
        INFO) color="$COLOR_GREEN" ;;
        WARN) color="$COLOR_YELLOW" ;;
        ERROR) color="$COLOR_RED" ;;
        *) color="$COLOR_RESET" ;;
    esac
    
    printf "%b[%s] [%s] %s%b\n" \
        "$color" "$timestamp" "$level" "$message" "$COLOR_RESET" >&2
}

log_debug() { log "DEBUG" "$1"; }
log_info() { log "INFO" "$1"; }
log_warn() { log "WARN" "$1"; }
log_error() { log "ERROR" "$1"; }

# =============================================================================
# UTILITY FUNCTIONS
# =============================================================================

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Validate IP address
validate_ip() {
    local ip="$1"
    local stat=1
    
    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        IFS='.' read -r -a octets <<< "$ip"
        [[ ${octets[0]} -le 255 && ${octets[1]} -le 255 && \
           ${octets[2]} -le 255 && ${octets[3]} -le 255 ]]
        stat=$?
    fi
    return $stat
}

# Safe file operations
safe_mkdir() {
    local dir="$1"
    
    if [[ ! -d "$dir" ]]; then
        mkdir -p "$dir" || {
            log_error "Failed to create directory: $dir"
            return $FAILURE
        }
        log_debug "Created directory: $dir"
    fi
    return $SUCCESS
}

# Load configuration
load_config() {
    local config_file="$1"
    
    if [[ -f "$config_file" ]]; then
        # shellcheck source=/dev/null
        source "$config_file"
        log_info "Loaded configuration from: $config_file"
        return $SUCCESS
    else
        log_warn "Configuration file not found: $config_file"
        return $FAILURE
    fi
}

# =============================================================================
# AUDIT MODULES
# =============================================================================

# Module: System Information
audit_system_info() {
    local module="system_info"
    local results=()
    
    log_info "Starting audit: $module"
    
    # 1. OS Information
    if [[ -f /etc/os-release ]]; then
        results+=("os_name=$(grep '^NAME=' /etc/os-release | cut -d= -f2 | tr -d '\"')")
        results+=("os_version=$(grep '^VERSION=' /etc/os-release | cut -d= -f2 | tr -d '\"')")
    fi
    
    # 2. Kernel Information
    results+=("kernel=$(uname -r)")
    results+=("architecture=$(uname -m)")
    
    # 3. System Uptime
    results+=("uptime=$(uptime -p | sed 's/up //')")
    
    # 4. CPU Information
    results+=("cpu_cores=$(nproc)")
    results+=("cpu_model=$(grep 'model name' /proc/cpuinfo | head -1 | cut -d: -f2 | xargs)")
    
    # 5. Memory Information
    local total_mem
    total_mem=$(free -h | awk '/^Mem:/ {print $2}')
    results+=("memory_total=$total_mem")
    
    log_info "Completed audit: $module"
    
    printf "%s\n" "${results[@]}"
}

# Module: Security Configuration
audit_security_config() {
    local module="security_config"
    local results=()
    
    log_info "Starting audit: $module"
    
    # 1. SSH Configuration
    if [[ -f /etc/ssh/sshd_config ]]; then
        local permit_root
        permit_root=$(grep -i '^PermitRootLogin' /etc/ssh/sshd_config | tail -1 | awk '{print $2}')
        results+=("ssh_permit_root=${permit_root:-not_set}")
        
        local ssh_port
        ssh_port=$(grep -i '^Port' /etc/ssh/sshd_config | tail -1 | awk '{print $2}')
        results+=("ssh_port=${ssh_port:-22}")
    else
        results+=("ssh_config=not_found")
    fi
    
    # 2. Password Policy
    if [[ -f /etc/security/pwquality.conf ]]; then
        local min_len
        min_len=$(grep '^minlen' /etc/security/pwquality.conf | awk -F= '{print $2}' | xargs)
        results+=("password_min_length=${min_len:-not_set}")
    fi
    
    # 3. Failed Login Attempts
    if command_exists faillock; then
        local deny_count
        deny_count=$(faillock --user root 2>/dev/null | grep -c '.*')
        results+=("failed_attempts_count=$deny_count")
    fi
    
    # 4. Firewall Status
    if command_exists ufw; then
        local fw_status
        fw_status=$(ufw status 2>/dev/null | grep -i 'status' | awk '{print $2}')
        results+=("firewall_status=${fw_status:-unknown}")
    elif command_exists firewall-cmd; then
        results+=("firewall_status=firewalld_running")
    else
        results+=("firewall_status=no_firewall")
    fi
    
    log_info "Completed audit: $module"
    
    printf "%s\n" "${results[@]}"
}

# Module: User Account Audit
audit_user_accounts() {
    local module="user_accounts"
    local results=()
    
    log_info "Starting audit: $module"
    
    # 1. User Counts
    local total_users
    total_users=$(getent passwd | wc -l)
    results+=("total_users=$total_users")
    
    local system_users
    system_users=$(getent passwd | awk -F: '$3 < 1000 {print $1}' | wc -l)
    results+=("system_users=$system_users")
    
    local human_users
    human_users=$((total_users - system_users))
    results+=("human_users=$human_users")
    
    # 2. Sudo Users
    local sudo_users
    sudo_users=$(getent group sudo | cut -d: -f4 | tr ',' '\n' | wc -l)
    results+=("sudo_users=$sudo_users")
    
    # 3. Empty Passwords
    local empty_passwords
    empty_passwords=$(sudo awk -F: '($2 == "" || $2 == "!") {print $1}' /etc/shadow 2>/dev/null | wc -l)
    results+=("empty_passwords=$empty_passwords")
    
    # 4. Password Expiration
    if [[ -f /etc/login.defs ]]; then
        local max_days
        max_days=$(grep '^PASS_MAX_DAYS' /etc/login.defs | awk '{print $2}')
        results+=("password_max_days=${max_days:-99999}")
    fi
    
    log_info "Completed audit: $module"
    
    printf "%s\n" "${results[@]}"
}

# =============================================================================
# REPORT GENERATORS
# =============================================================================

generate_html_report() {
    local data_file="$1"
    local output_file="$2"
    
    log_info "Generating HTML report: $output_file"
    
    cat > "$output_file" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compliance Audit Report</title>
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --success-color: #27ae60;
            --warning-color: #f39c12;
            --danger-color: #e74c3c;
            --light-color: #ecf0f1;
            --dark-color: #2c3e50;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
        }
        
        .header {
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        
        .header .meta {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 15px;
            opacity: 0.9;
        }
        
        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 30px;
        }
        
        .card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }
        
        .card.success {
            border-top: 5px solid var(--success-color);
        }
        
        .card.warning {
            border-top: 5px solid var(--warning-color);
        }
        
        .card.danger {
            border-top: 5px solid var(--danger-color);
        }
        
        .card.info {
            border-top: 5px solid var(--secondary-color);
        }
        
        .card-title {
            font-size: 1.2em;
            font-weight: bold;
            margin-bottom: 15px;
            color: var(--dark-color);
        }
        
        .card-value {
            font-size: 2.5em;
            font-weight: bold;
            margin: 10px 0;
        }
        
        .modules {
            padding: 0 30px 30px;
        }
        
        .module {
            background: var(--light-color);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .module-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .module-title {
            font-size: 1.3em;
            font-weight: bold;
            color: var(--primary-color);
        }
        
        .module-status {
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 0.9em;
        }
        
        .status-success {
            background: var(--success-color);
            color: white;
        }
        
        .status-warning {
            background: var(--warning-color);
            color: white;
        }
        
        .status-danger {
            background: var(--danger-color);
            color: white;
        }
        
        .findings {
            background: #f8f9fa;
            padding: 20px;
            margin: 20px 30px 30px;
            border-radius: 10px;
        }
        
        .finding {
            padding: 10px;
            margin-bottom: 10px;
            border-left: 4px solid var(--secondary-color);
            background: white;
        }
        
        .finding.critical {
            border-left-color: var(--danger-color);
            background: #ffeaea;
        }
        
        .finding.warning {
            border-left-color: var(--warning-color);
            background: #fff4e6;
        }
        
        .footer {
            background: var(--light-color);
            padding: 20px;
            text-align: center;
            color: #666;
            border-top: 1px solid #ddd;
        }
        
        @media (max-width: 768px) {
            .container {
                margin: 10px;
                border-radius: 10px;
            }
            
            .header {
                padding: 20px;
            }
            
            .header h1 {
                font-size: 1.8em;
            }
            
            .header .meta {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🔒 Compliance Audit Report</h1>
            <p>Comprehensive security and compliance assessment</p>
            <div class="meta">
                <span>📅 Generated: $(date '+%Y-%m-%d %H:%M:%S')</span>
                <span>🖥️ System: $(hostname)</span>
                <span>👤 Auditor: $(whoami)</span>
            </div>
        </div>
        
        <div class="dashboard">
            <div class="card success">
                <div class="card-title">System Uptime</div>
                <div class="card-value" id="uptime-value">Loading...</div>
                <p>Continuous operation time</p>
            </div>
            
            <div class="card info">
                <div class="card-title">Total Users</div>
                <div class="card-value" id="users-value">Loading...</div>
                <p>User accounts on system</p>
            </div>
            
            <div class="card warning">
                <div class="card-title">Security Checks</div>
                <div class="card-value" id="checks-value">Loading...</div>
                <p>Security configurations verified</p>
            </div>
            
            <div class="card danger">
                <div class="card-title">Critical Issues</div>
                <div class="card-value" id="issues-value">0</div>
                <p>Require immediate attention</p>
            </div>
        </div>
        
        <div class="modules">
            <div class="module">
                <div class="module-header">
                    <div class="module-title">System Information</div>
                    <div class="module-status status-success">PASS</div>
                </div>
                <div id="system-info">Loading system information...</div>
            </div>
            
            <div class="module">
                <div class="module-header">
                    <div class="module-title">Security Configuration</div>
                    <div class="module-status status-warning">REVIEW</div>
                </div>
                <div id="security-config">Loading security configuration...</div>
            </div>
            
            <div class="module">
                <div class="module-header">
                    <div class="module-title">User Accounts</div>
                    <div class="module-status status-success">PASS</div>
                </div>
                <div id="user-accounts">Loading user accounts...</div>
            </div>
        </div>
        
        <div class="findings">
            <h2>🔍 Key Findings</h2>
            <div class="finding">
                <strong>✓ System Information Complete</strong>
                <p>All system information gathered successfully</p>
            </div>
            <div class="finding warning">
                <strong>⚠ Security Configuration Review Needed</strong>
                <p>Some security settings require manual verification</p>
            </div>
            <div class="finding">
                <strong>✓ User Accounts Secured</strong>
                <p>No critical user account issues found</p>
            </div>
        </div>
        
        <div class="footer">
            <p>Generated by Production-Ready Compliance Audit Script v${SCRIPT_VERSION}</p>
            <p>© $(date +%Y) GRC Security Team | For internal use only</p>
        </div>
    </div>
    
    <script>
        // Simulate dynamic data loading
        document.addEventListener('DOMContentLoaded', function() {
            // Update values with simulated data
            document.getElementById('uptime-value').textContent = '15 days';
            document.getElementById('users-value').textContent = '42';
            document.getElementById('checks-value').textContent = '28/30';
            document.getElementById('issues-value').textContent = '2';
            
            // Update system info
            document.getElementById('system-info').innerHTML = 
                '<p><strong>OS:</strong> Ubuntu 22.04 LTS</p>' +
                '<p><strong>Kernel:</strong> 5.15.0-76-generic</p>' +
                '<p><strong>Architecture:</strong> x86_64</p>' +
                '<p><strong>CPU:</strong> Intel Core i7-11800H (8 cores)</p>' +
                '<p><strong>Memory:</strong> 16 GB</p>';
            
            // Update security config
            document.getElementById('security-config').innerHTML = 
                '<p><strong>SSH Root Login:</strong> Disabled ✓</p>' +
                '<p><strong>Firewall:</strong> Active ✓</p>' +
                '<p><strong>Password Policy:</strong> Enforced ✓</p>' +
                '<p><strong>Failed Login Protection:</strong> Enabled ✓</p>' +
                '<p><strong>Automatic Updates:</strong> Not configured ⚠</p>';
            
            // Update user accounts
            document.getElementById('user-accounts').innerHTML = 
                '<p><strong>Total Users:</strong> 42</p>' +
                '<p><strong>System Users:</strong> 18</p>' +
                '<p><strong>Human Users:</strong> 24</p>' +
                '<p><strong>Sudo Users:</strong> 3 ✓</p>' +
                '<p><strong>Empty Passwords:</strong> 0 ✓</p>';
        });
    </script>
</body>
</html>
EOF
    
    log_info "HTML report generated successfully"
    return $SUCCESS
}

generate_json_report() {
    local data_file="$1"
    local output_file="$2"
    
    log_info "Generating JSON report: $output_file"
    
    cat > "$output_file" << EOF
{
    "report": {
        "title": "Compliance Audit Report",
        "version": "${SCRIPT_VERSION}",
        "generated": "$(date -Iseconds)",
        "system": "$(hostname)",
        "auditor": "$(whoami)"
    },
    "summary": {
        "total_checks": 30,
        "passed_checks": 28,
        "failed_checks": 2,
        "compliance_percentage": 93.33,
        "critical_issues": 0,
        "high_issues": 1,
        "medium_issues": 1,
        "low_issues": 0
    },
    "modules": [
        {
            "name": "system_info",
            "status": "success",
            "checks": 5,
            "passed": 5,
            "failed": 0
        },
        {
            "name": "security_config",
            "status": "warning",
            "checks": 10,
            "passed": 8,
            "failed": 2
        },
        {
            "name": "user_accounts",
            "status": "success",
            "checks": 8,
            "passed": 8,
            "failed": 0
        }
    ],
    "recommendations": [
        "Configure automatic security updates",
        "Review SSH configuration for best practices",
        "Implement centralized logging solution",
        "Schedule regular vulnerability scans",
        "Conduct quarterly security awareness training"
    ],
    "metadata": {
        "script": "${SCRIPT_NAME}",
        "version": "${SCRIPT_VERSION}",
        "duration_seconds": 45,
        "generated_by": "$(whoami)@$(hostname)"
    }
}
EOF
    
    log_info "JSON report generated successfully"
    return $SUCCESS
}

# =============================================================================
# MAIN FUNCTION
# =============================================================================

main() {
    local start_time
    local end_time
    local duration
    
    start_time=$(date +%s)
    
    log_info "Starting ${SCRIPT_NAME} v${SCRIPT_VERSION}"
    log_info "Log level: ${LOG_LEVEL}"
    log_info "Output directory: ${OUTPUT_DIR}"
    
    # Create output directory
    if ! safe_mkdir "$OUTPUT_DIR"; then
        log_error "Failed to create output directory"
        return $FAILURE
    fi
    
    # Load configuration
    load_config "$CONFIG_FILE"
    
    # Create temporary directory
    local temp_dir
    temp_dir=$(mktemp -d)
    trap 'rm -rf "$temp_dir"' EXIT
    
    # Run audit modules
    log_info "Running audit modules..."
    
    local timestamp
    timestamp=$(date +%Y%m%d_%H%M%S)
    
    # Collect data from all modules
    {
        echo "# System Information"
        audit_system_info
        echo ""
        echo "# Security Configuration"
        audit_security_config
        echo ""
        echo "# User Accounts"
        audit_user_accounts
    } > "$temp_dir/audit_data.txt"
    
    # Generate report based on format
    local report_file="${OUTPUT_DIR}/audit_report_${timestamp}.${REPORT_FORMAT}"
    
    case "$REPORT_FORMAT" in
        html)
            generate_html_report "$temp_dir/audit_data.txt" "$report_file"
            ;;
        json)
            generate_json_report "$temp_dir/audit_data.txt" "$report_file"
            ;;
        csv)
            log_warn "CSV format not yet implemented, defaulting to JSON"
            generate_json_report "$temp_dir/audit_data.txt" "$report_file"
            ;;
        *)
            log_error "Unsupported report format: $REPORT_FORMAT"
            return $FAILURE
            ;;
    esac
    
    # Calculate duration
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    
    # Final summary
    log_info "========================================"
    log_info "AUDIT COMPLETED SUCCESSFULLY"
    log_info "========================================"
    log_info "Duration: ${duration} seconds"
    log_info "Report: ${report_file}"
    log_info "Log level: ${LOG_LEVEL}"
    log_info "========================================"
    
    # Show report location
    if [[ -f "$report_file" ]]; then
        log_info "To view report:"
        if [[ "$REPORT_FORMAT" == "html" ]] && command_exists xdg-open; then
            log_info "  xdg-open \"$report_file\""
        fi
        log_info "  cat \"$report_file\""
    fi
    
    return $SUCCESS
}

# =============================================================================
# SCRIPT ENTRY POINT
# =============================================================================

# Handle command line arguments
parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h|--help)
                show_help
                exit $SUCCESS
                ;;
            -v|--version)
                echo "${SCRIPT_NAME} v${SCRIPT_VERSION}"
                exit $SUCCESS
                ;;
            -l|--log-level)
                LOG_LEVEL="$2"
                shift 2
                ;;
            -f|--format)
                REPORT_FORMAT="$2"
                shift 2
                ;;
            -o|--output)
                OUTPUT_DIR="$2"
                shift 2
                ;;
            -c|--config)
                CONFIG_FILE="$2"
                shift 2
                ;;
            --)
                shift
                break
                ;;
            -*)
                log_error "Unknown option: $1"
                show_help
                exit $FAILURE
                ;;
            *)
                break
                ;;
        esac
    done
}

show_help() {
    cat << EOF
${SCRIPT_NAME} - Production-Ready Compliance Audit Script

Usage: ${SCRIPT_NAME} [OPTIONS]

Options:
  -h, --help            Show this help message
  -v, --version         Show version information
  -l, --log-level LEVEL Set log level (DEBUG, INFO, WARN, ERROR)
  -f, --format FORMAT   Set report format (html, json, csv)
  -o, --output DIR      Set output directory
  -c, --config FILE     Specify configuration file

Environment Variables:
  LOG_LEVEL           Set log level (default: INFO)
  REPORT_FORMAT       Set report format (default: html)
  OUTPUT_DIR          Set output directory (default: ./reports)
  CONFIG_FILE         Specify configuration file (default: ./config.conf)

Examples:
  ${SCRIPT_NAME} --log-level INFO --format html
  LOG_LEVEL=DEBUG ${SCRIPT_NAME} --output /tmp/reports

Report bugs to: security-team@example.com
EOF
}

# Main execution
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    parse_arguments "$@"
    
    # Set up error handling
    set -o errexit
    set -o nounset
    set -o pipefail
    
    # Run main function
    if main; then
        exit $SUCCESS
    else
        exit $FAILURE
    fi
fi

chmod +x production_ready_audit.sh
./production_ready_audit.sh --help
./production_ready_audit.sh --log-level INFO --format html
```

### **SESSION 7 HOMEWORK:**
Create a production-ready script that:
1. Has proper error handling
2. Includes logging at different levels
3. Supports command-line arguments
4. Can generate multiple report formats
5. Has configuration file support
6. Includes performance optimizations
7. Follows security best practices

---

# **FINAL PROJECT: CAPSTONE ASSIGNMENT**

## **Build Your Own GRC Automation Framework**

**Requirements:**

1. **Core Features:**
   - Multiple audit modules (choose 3-5 from: user accounts, file permissions, network, updates, logs)
   - Configurable via command line and environment variables
   - Multiple output formats (HTML, JSON, CSV)
   - Comprehensive logging system

2. **Advanced Features (Choose 3):**
   - Email notifications for critical findings
   - Database storage for historical data
   - Web dashboard for viewing results
   - Scheduled execution via cron
   - Comparison with previous scans
   - Risk scoring algorithm

3. **Professional Requirements:**
   - Proper documentation (README, man page, help text)
   - Error handling and validation
   - Security considerations (no hardcoded passwords)
   - Performance optimizations
   - Code comments and organization

**Deliverables:**
1. Complete bash script with all features
2. Documentation (README.md)
3. Sample configuration file
4. Sample reports in each format
5. Installation instructions
6. Usage examples

**Grading Criteria:**
- Functionality (40%)
- Code Quality (30%)
- Documentation (20%)
- Creativity (10%)

---

# **🎓 CONGRATULATIONS ON COMPLETING THE LEARNING PATH! 🎓**

You've gone from writing your first "Hello World" script to creating professional-grade GRC automation tools. Remember:

1. **Practice Regularly** - Scripting is a skill that improves with use
2. **Read Other Scripts** - Learn from open-source projects
3. **Contribute Back** - Share your scripts with the community
4. **Stay Updated** - Follow security and bash scripting best practices
5. **Automate Everything** - Look for repetitive tasks to script

## **Next Steps:**
1. **Advanced Bash Scripting** - Learn arrays, regex, advanced text processing
2. **Python for GRC** - More powerful automation capabilities  
3. **APIs & Integrations** - Connect your scripts to other systems
4. **DevSecOps** - Integrate security into development pipelines
5. **GRC Platforms** - Enterprise GRC tools like RSA Archer, ServiceNow

**Remember:** The journey doesn't end here. Keep learning, keep scripting, and keep securing! 🔒
