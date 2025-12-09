# Lab 2: Linux Scripting for Compliance

**Course:** GRC101 - Introduction to GRC & Technical Landscape  
**Week:** 2  
**Duration:** 5 days  
**Level:** Beginner to Intermediate  
**Prerequisites:** Lab 1 - Linux for GRC Operations

## Lab Overview

This lab introduces bash scripting for compliance automation. Participants will write scripts to check system configurations, detect unauthorized users, and generate compliance reports. These skills are essential for automating compliance checks and security monitoring.

## Learning Objectives

Upon completion of this lab, you will be able to:

- Write bash scripts for compliance checks
- Automate system configuration verification
- Detect unauthorized user accounts
- Generate automated compliance reports
- Understand scripting best practices for GRC operations

## Required Resources

- Linux system with bash shell
- Text editor (nano, vim, or VS Code)
- Lab templates and sample scripts
- System access for testing scripts
- Lab report template

## Lab Tasks

### Task 1: Bash Scripting Fundamentals (Day 1)

**Objective:** Learn bash scripting basics and create your first compliance script.

**Instructions:**

1. Create a working directory:
   ```bash
   mkdir -p ~/grc-lab-week2/scripts
   cd ~/grc-lab-week2/scripts
   ```

2. Create a simple system information script:
   ```bash
   cat > system_info.sh << 'EOF'
   #!/bin/bash
   
   # System Information Script for Compliance
   # Purpose: Gather basic system information
   # Author: GRC Engineer
   # Date: $(date)
   
   echo "======================================"
   echo "SYSTEM INFORMATION REPORT"
   echo "======================================"
   echo ""
   echo "Hostname: $(hostname)"
   echo "Kernel: $(uname -r)"
   echo "OS: $(cat /etc/os-release | grep PRETTY_NAME)"
   echo "Current Date/Time: $(date)"
   echo ""
   echo "======================================"
   echo "USER ACCOUNTS"
   echo "======================================"
   cat /etc/passwd | cut -d: -f1,3,6 | head -10
   echo ""
   echo "======================================"
   echo "DISK USAGE"
   echo "======================================"
   df -h | head -5
   echo ""
   echo "Report generated: $(date)" > system_info_report.txt
   
   EOF
   
   chmod +x system_info.sh
   ./system_info.sh
   ```

3. Understand script structure:
   - Shebang line (#!/bin/bash)
   - Comments
   - Variable assignment
   - Command execution
   - Output redirection

4. Create a script with user input:
   ```bash
   cat > user_check.sh << 'EOF'
   #!/bin/bash
   
   # User Account Check Script
   echo "Enter username to check: "
   read username
   
   if grep -q "^$username:" /etc/passwd; then
       echo "User $username exists"
       grep "^$username:" /etc/passwd
   else
       echo "User $username does not exist"
   fi
   
   EOF
   
   chmod +x user_check.sh
   ```

**Deliverable:** Two working bash scripts with documentation

### Task 2: Password Policy Compliance Script (Day 2)

**Objective:** Create a script to verify password policy compliance.

**Instructions:**

1. Create a comprehensive password policy checker:
   ```bash
   cat > password_policy_check.sh << 'EOF'
   #!/bin/bash
   
   # Password Policy Compliance Checker
   # Purpose: Verify system password policy settings
   # Date: $(date)
   
   echo "======================================"
   echo "PASSWORD POLICY COMPLIANCE CHECK"
   echo "======================================"
   echo "Report Date: $(date)" > password_policy_report.txt
   echo "" >> password_policy_report.txt
   
   # Check password aging settings
   echo "PASSWORD AGING SETTINGS:" >> password_policy_report.txt
   echo "========================" >> password_policy_report.txt
   
   # Check /etc/login.defs for password settings
   echo "Checking /etc/login.defs..." >> password_policy_report.txt
   grep -E "PASS_MAX_DAYS|PASS_MIN_DAYS|PASS_WARN_AGE" /etc/login.defs >> password_policy_report.txt 2>&1
   echo "" >> password_policy_report.txt
   
   # Check user password settings
   echo "USER PASSWORD SETTINGS:" >> password_policy_report.txt
   echo "======================" >> password_policy_report.txt
   echo "Checking user accounts..." >> password_policy_report.txt
   
   for user in $(cut -f1 -d: /etc/passwd); do
       chage -l $user 2>/dev/null | grep -E "Maximum|Minimum|Warning" >> password_policy_report.txt
   done
   
   # Check for users with no password expiration
   echo "" >> password_policy_report.txt
   echo "USERS WITH NO PASSWORD EXPIRATION:" >> password_policy_report.txt
   echo "==================================" >> password_policy_report.txt
   for user in $(cut -f1 -d: /etc/passwd); do
       max_days=$(chage -l $user 2>/dev/null | grep "Maximum" | awk -F: '{print $2}' | xargs)
       if [ "$max_days" = "never" ] || [ "$max_days" = "-1" ]; then
           echo "WARNING: User $user has no password expiration" >> password_policy_report.txt
       fi
   done
   
   # Check password history
   echo "" >> password_policy_report.txt
   echo "PASSWORD HISTORY SETTINGS:" >> password_policy_report.txt
   echo "==========================" >> password_policy_report.txt
   grep -i "remember" /etc/pam.d/* 2>/dev/null >> password_policy_report.txt || echo "No password history configured" >> password_policy_report.txt
   
   # Summary
   echo "" >> password_policy_report.txt
   echo "COMPLIANCE ASSESSMENT:" >> password_policy_report.txt
   echo "=====================" >> password_policy_report.txt
   echo "Review the above settings against your organization's password policy." >> password_policy_report.txt
   echo "Ensure:" >> password_policy_report.txt
   echo "- Maximum password age is set (typically 90 days)" >> password_policy_report.txt
   echo "- Minimum password age is set (typically 1 day)" >> password_policy_report.txt
   echo "- Password warning age is set (typically 14 days)" >> password_policy_report.txt
   echo "- Password history is enforced (typically 5-24 previous passwords)" >> password_policy_report.txt
   
   # Display report
   cat password_policy_report.txt
   
   EOF
   
   chmod +x password_policy_check.sh
   ./password_policy_check.sh
   ```

2. Test the script and review output

3. Document the script:
   - Purpose and objectives
   - Parameters and options
   - Output format
   - Compliance checks performed

**Deliverable:** Working password policy checker script with output report

### Task 3: Unauthorized User Detection Script (Day 3)

**Objective:** Create a script to identify unauthorized user accounts.

**Instructions:**

1. Create an unauthorized user detection script:
   ```bash
   cat > unauthorized_user_check.sh << 'EOF'
   #!/bin/bash
   
   # Unauthorized User Detection Script
   # Purpose: Identify potentially unauthorized user accounts
   # Date: $(date)
   
   echo "======================================"
   echo "UNAUTHORIZED USER DETECTION REPORT"
   echo "======================================"
   echo "Report Date: $(date)" > unauthorized_users_report.txt
   echo "" >> unauthorized_users_report.txt
   
   # Define authorized system users (customize for your environment)
   AUTHORIZED_USERS="root daemon bin sys sync games man lp mail news uucp proxy www-data backup list irc gnats nobody"
   
   echo "SYSTEM USER ACCOUNTS:" >> unauthorized_users_report.txt
   echo "====================" >> unauthorized_users_report.txt
   
   # Get all users with UID >= 1000 (non-system users)
   echo "Non-system user accounts (UID >= 1000):" >> unauthorized_users_report.txt
   awk -F: '$3 >= 1000 {print $1 " (UID: " $3 ")"}' /etc/passwd >> unauthorized_users_report.txt
   echo "" >> unauthorized_users_report.txt
   
   # Check for users with UID 0 (root privileges)
   echo "ACCOUNTS WITH ROOT PRIVILEGES (UID 0):" >> unauthorized_users_report.txt
   echo "======================================" >> unauthorized_users_report.txt
   awk -F: '$3 == 0 {print $1}' /etc/passwd >> unauthorized_users_report.txt
   echo "" >> unauthorized_users_report.txt
   
   # Check for users with empty passwords
   echo "ACCOUNTS WITH EMPTY PASSWORDS:" >> unauthorized_users_report.txt
   echo "=============================" >> unauthorized_users_report.txt
   awk -F: '($2 == "" || $2 == "!") {print $1}' /etc/shadow 2>/dev/null >> unauthorized_users_report.txt || echo "Cannot read /etc/shadow (requires sudo)" >> unauthorized_users_report.txt
   echo "" >> unauthorized_users_report.txt
   
   # Check for users with no login shell
   echo "ACCOUNTS WITH SYSTEM SHELLS:" >> unauthorized_users_report.txt
   echo "============================" >> unauthorized_users_report.txt
   awk -F: '($7 == "/bin/false" || $7 == "/usr/sbin/nologin" || $7 == "/bin/nologin") {print $1 " (" $7 ")"}' /etc/passwd >> unauthorized_users_report.txt
   echo "" >> unauthorized_users_report.txt
   
   # Check sudo access
   echo "USERS WITH SUDO ACCESS:" >> unauthorized_users_report.txt
   echo "======================" >> unauthorized_users_report.txt
   grep -E "^[^#].*\(ALL\)" /etc/sudoers 2>/dev/null >> unauthorized_users_report.txt || echo "Cannot read /etc/sudoers" >> unauthorized_users_report.txt
   echo "" >> unauthorized_users_report.txt
   
   # Recommendations
   echo "RECOMMENDATIONS:" >> unauthorized_users_report.txt
   echo "================" >> unauthorized_users_report.txt
   echo "1. Review all non-system user accounts (UID >= 1000)" >> unauthorized_users_report.txt
   echo "2. Verify accounts with root privileges" >> unauthorized_users_report.txt
   echo "3. Disable or remove accounts with empty passwords" >> unauthorized_users_report.txt
   echo "4. Review sudo access and limit to necessary users" >> unauthorized_users_report.txt
   echo "5. Document all authorized user accounts" >> unauthorized_users_report.txt
   
   # Display report
   cat unauthorized_users_report.txt
   
   EOF
   
   chmod +x unauthorized_user_check.sh
   ./unauthorized_user_check.sh
   ```

2. Test the script and analyze results

3. Identify potential security issues:
   - Unauthorized user accounts
   - Accounts with excessive privileges
   - Accounts with weak security settings

**Deliverable:** Unauthorized user detection script with analysis report

### Task 4: Compliance Report Generator (Day 4)

**Objective:** Create a comprehensive compliance report generator script.

**Instructions:**

1. Create a master compliance report script:
   ```bash
   cat > compliance_report_generator.sh << 'EOF'
   #!/bin/bash
   
   # Compliance Report Generator
   # Purpose: Generate comprehensive compliance report
   # Date: $(date)
   
   REPORT_FILE="compliance_report_$(date +%Y%m%d_%H%M%S).txt"
   
   echo "======================================"
   echo "SYSTEM COMPLIANCE REPORT"
   echo "======================================"
   echo "Report Generated: $(date)" > $REPORT_FILE
   echo "System: $(hostname)" >> $REPORT_FILE
   echo "Kernel: $(uname -r)" >> $REPORT_FILE
   echo "" >> $REPORT_FILE
   
   # Section 1: System Information
   echo "1. SYSTEM INFORMATION" >> $REPORT_FILE
   echo "=====================" >> $REPORT_FILE
   echo "Hostname: $(hostname)" >> $REPORT_FILE
   echo "OS: $(cat /etc/os-release | grep PRETTY_NAME)" >> $REPORT_FILE
   echo "Kernel: $(uname -r)" >> $REPORT_FILE
   echo "Uptime: $(uptime)" >> $REPORT_FILE
   echo "" >> $REPORT_FILE
   
   # Section 2: User Accounts
   echo "2. USER ACCOUNTS" >> $REPORT_FILE
   echo "================" >> $REPORT_FILE
   echo "Total user accounts: $(wc -l < /etc/passwd)" >> $REPORT_FILE
   echo "Active user accounts:" >> $REPORT_FILE
   awk -F: '($7 != "/bin/false" && $7 != "/usr/sbin/nologin") {print "  - " $1}' /etc/passwd >> $REPORT_FILE
   echo "" >> $REPORT_FILE
   
   # Section 3: File System Permissions
   echo "3. CRITICAL FILE PERMISSIONS" >> $REPORT_FILE
   echo "============================" >> $REPORT_FILE
   echo "/etc/passwd: $(ls -l /etc/passwd | awk '{print $1, $3, $4}')" >> $REPORT_FILE
   echo "/etc/shadow: $(ls -l /etc/shadow | awk '{print $1, $3, $4}')" >> $REPORT_FILE
   echo "/etc/sudoers: $(ls -l /etc/sudoers | awk '{print $1, $3, $4}')" >> $REPORT_FILE
   echo "" >> $REPORT_FILE
   
   # Section 4: Password Policy
   echo "4. PASSWORD POLICY" >> $REPORT_FILE
   echo "==================" >> $REPORT_FILE
   grep -E "PASS_MAX_DAYS|PASS_MIN_DAYS|PASS_WARN_AGE" /etc/login.defs >> $REPORT_FILE
   echo "" >> $REPORT_FILE
   
   # Section 5: Sudo Access
   echo "5. SUDO ACCESS" >> $REPORT_FILE
   echo "==============" >> $REPORT_FILE
   echo "Users with sudo access:" >> $REPORT_FILE
   grep -E "^[^#].*\(ALL\)" /etc/sudoers 2>/dev/null | sed 's/^/  /' >> $REPORT_FILE || echo "  Cannot read /etc/sudoers" >> $REPORT_FILE
   echo "" >> $REPORT_FILE
   
   # Section 6: Compliance Status
   echo "6. COMPLIANCE CHECKLIST" >> $REPORT_FILE
   echo "======================" >> $REPORT_FILE
   echo "[ ] All user accounts documented" >> $REPORT_FILE
   echo "[ ] Password policy enforced" >> $REPORT_FILE
   echo "[ ] File permissions appropriate" >> $REPORT_FILE
   echo "[ ] Sudo access restricted" >> $REPORT_FILE
   echo "[ ] Logs monitored" >> $REPORT_FILE
   echo "" >> $REPORT_FILE
   
   # Section 7: Recommendations
   echo "7. RECOMMENDATIONS" >> $REPORT_FILE
   echo "==================" >> $REPORT_FILE
   echo "1. Review and document all user accounts" >> $REPORT_FILE
   echo "2. Enforce strong password policy" >> $REPORT_FILE
   echo "3. Restrict sudo access to necessary users" >> $REPORT_FILE
   echo "4. Implement centralized logging" >> $REPORT_FILE
   echo "5. Regular security audits" >> $REPORT_FILE
   
   # Display report
   cat $REPORT_FILE
   echo ""
   echo "Report saved to: $REPORT_FILE"
   
   EOF
   
   chmod +x compliance_report_generator.sh
   ./compliance_report_generator.sh
   ```

2. Review the generated report

3. Customize the script for your environment

**Deliverable:** Compliance report generator script with sample output

### Task 5: Lab Report and Documentation (Day 5)

**Objective:** Document all scripts and prepare comprehensive lab report.

**Instructions:**

1. Create a script documentation file:
   ```bash
   cat > SCRIPTS_DOCUMENTATION.txt << 'EOF'
   BASH SCRIPTS FOR COMPLIANCE - DOCUMENTATION
   ============================================
   
   1. system_info.sh
   Purpose: Gather basic system information
   Usage: ./system_info.sh
   Output: Displays system information and creates system_info_report.txt
   Key Features:
   - Hostname and kernel information
   - User account listing
   - Disk usage report
   
   2. user_check.sh
   Purpose: Check if a specific user exists
   Usage: ./user_check.sh
   Input: Username to check
   Output: User exists/not exists with details
   Key Features:
   - Interactive user input
   - Conditional logic (if/else)
   - User account lookup
   
   3. password_policy_check.sh
   Purpose: Verify password policy compliance
   Usage: ./password_policy_check.sh
   Output: password_policy_report.txt
   Key Features:
   - Checks password aging settings
   - Identifies non-compliant accounts
   - Generates compliance recommendations
   
   4. unauthorized_user_check.sh
   Purpose: Detect unauthorized user accounts
   Usage: ./unauthorized_user_check.sh
   Output: unauthorized_users_report.txt
   Key Features:
   - Identifies non-system users
   - Detects root privilege accounts
   - Finds accounts with empty passwords
   - Reviews sudo access
   
   5. compliance_report_generator.sh
   Purpose: Generate comprehensive compliance report
   Usage: ./compliance_report_generator.sh
   Output: compliance_report_[timestamp].txt
   Key Features:
   - Multi-section report format
   - System and user information
   - Compliance checklist
   - Recommendations
   
   BASH SCRIPTING CONCEPTS USED:
   - Variables and variable expansion
   - Command substitution
   - Conditional statements (if/else)
   - Loops (for loops)
   - Text processing (grep, awk, cut)
   - File I/O and redirection
   - Functions and script organization
   
   EOF
   
   cat SCRIPTS_DOCUMENTATION.txt
   ```

2. Create a testing summary:
   ```bash
   cat > TEST_RESULTS.txt << 'EOF'
   SCRIPT TESTING SUMMARY
   ======================
   
   Script: system_info.sh
   Test Date: $(date)
   Status: PASSED
   Notes: Successfully gathered system information
   
   Script: user_check.sh
   Test Date: $(date)
   Status: PASSED
   Notes: Successfully checked user accounts
   
   Script: password_policy_check.sh
   Test Date: $(date)
   Status: PASSED
   Notes: Successfully verified password policy
   
   Script: unauthorized_user_check.sh
   Test Date: $(date)
   Status: PASSED
   Notes: Successfully identified user accounts
   
   Script: compliance_report_generator.sh
   Test Date: $(date)
   Status: PASSED
   Notes: Successfully generated compliance report
   
   EOF
   
   cat TEST_RESULTS.txt
   ```

3. Prepare lab report with:
   - Overview of scripts created
   - Purpose and functionality of each script
   - Code listings and explanations
   - Sample output from each script
   - Compliance findings and recommendations
   - Lessons learned

**Deliverable:** Complete lab report with all scripts and documentation

## Assessment Criteria

Your lab will be assessed on:

| Criterion | Weight | Description |
|-----------|--------|-------------|
| Script Functionality | 25% | Scripts work correctly and produce expected output |
| Code Quality | 20% | Clean, well-commented, professional code |
| Compliance Focus | 25% | Scripts address compliance requirements |
| Documentation | 20% | Clear documentation and usage instructions |
| Report Quality | 10% | Professional presentation and completeness |

## Submission Requirements

1. **Lab Report (PDF or Markdown)**
   - Title and overview
   - Script descriptions and purpose
   - Code listings with explanations
   - Sample output and analysis
   - Compliance findings
   - Recommendations

2. **Supporting Files**
   - All 5 bash scripts (.sh files)
   - Generated reports from script execution
   - Documentation and testing summary
   - Any additional supporting files

3. **File Organization**
   - Folder: `Week_02_GRC101_[YourName]`
   - Scripts in `scripts/` subdirectory
   - Reports in `reports/` subdirectory
   - Documentation in root directory

## Submission Deadline

Friday, 11:59 PM (End of Week 2)

## Resources

- Bash Scripting Guide: https://www.gnu.org/software/bash/manual/
- Linux System Administration: https://linux.die.net/
- Compliance Automation: resources/scripts/

## Common Issues and Troubleshooting

| Issue | Solution |
|-------|----------|
| Permission denied | Use `chmod +x script_name.sh` |
| Command not found | Check script path, use `./script_name.sh` |
| Cannot read /etc/shadow | Use `sudo` for system files |
| Script syntax error | Check for typos, use `bash -x script_name.sh` for debugging |

## Tips for Success

1. Test each script thoroughly before submission
2. Add comments to explain complex sections
3. Handle errors gracefully in scripts
4. Generate sample output for documentation
5. Review compliance implications of findings
6. Present scripts professionally

## Next Steps

Upon completion of this lab:

1. Review instructor feedback
2. Prepare for Week 3: Understanding GRC Frameworks
3. Think about how to integrate these scripts into compliance workflows
4. Begin learning about GRC frameworks and standards

---

**Lab Created:** December 2025  
**Last Updated:** December 2025  
**Version:** 1.0
