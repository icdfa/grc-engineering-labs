# Lab 1: Linux for GRC Operations

**Course:** GRC101 - Introduction to GRC & Technical Landscape  
**Week:** 1  
**Duration:** 5 days  
**Level:** Beginner  
**Prerequisites:** Basic computer literacy

## Lab Overview

This lab introduces fundamental Linux skills essential for GRC operations, including file system navigation, directory management, and log analysis. Participants will develop practical skills in using Linux command-line tools for compliance and security operations.

## Learning Objectives

Upon completion of this lab, you will be able to:

- Navigate the Linux file system using command-line tools
- Create and manage directories with appropriate security permissions
- Extract and analyze system logs for security events
- Understand file permissions and their security implications
- Document findings in a professional lab report

## Required Resources

- Linux system (Ubuntu 20.04 or later recommended)
- Terminal/SSH access
- Text editor (nano, vim, or similar)
- Lab report template (provided)
- Sample system logs (provided in datasets/)

## Lab Tasks

### Task 1: Linux File System Navigation (Day 1)

**Objective:** Become proficient in navigating the Linux file system and understanding directory structure.

**Instructions:**

1. Open a terminal and execute the following commands:
   ```bash
   pwd                    # Print working directory
   ls -la                 # List files with details
   cd /home               # Change directory
   ls -la                 # List home directory contents
   cd /var/log            # Navigate to logs directory
   pwd                    # Confirm location
   ```

2. Explore key system directories:
   ```bash
   ls -la /etc            # Configuration files
   ls -la /var            # Variable data
   ls -la /home           # User home directories
   ls -la /root           # Root user home
   ls -la /tmp            # Temporary files
   ```

3. Create a working directory for this lab:
   ```bash
   mkdir -p ~/grc-lab-week1
   cd ~/grc-lab-week1
   pwd
   ```

4. Document your findings:
   - List at least 5 important system directories and their purposes
   - Explain the difference between absolute and relative paths
   - Provide examples of each

**Deliverable:** Screenshots of terminal output and documented findings

### Task 2: File Permissions and Security (Day 2)

**Objective:** Understand Linux file permissions and their security implications for GRC operations.

**Instructions:**

1. Create a directory structure for audit evidence:
   ```bash
   cd ~/grc-lab-week1
   mkdir -p audit_evidence/{policies,logs,evidence}
   ls -la audit_evidence/
   ```

2. Examine file permissions:
   ```bash
   ls -la /etc/passwd     # User accounts
   ls -la /etc/shadow     # Password hashes (requires sudo)
   ls -la /etc/sudoers    # Sudo configuration
   ```

3. Create files with different permission levels:
   ```bash
   touch audit_evidence/policies/policy_draft.txt
   chmod 644 audit_evidence/policies/policy_draft.txt
   
   touch audit_evidence/evidence/confidential.txt
   chmod 600 audit_evidence/evidence/confidential.txt
   
   mkdir audit_evidence/logs
   chmod 700 audit_evidence/logs
   
   ls -la audit_evidence/
   ```

4. Understand permission notation:
   - Document what each permission means (r, w, x)
   - Explain octal notation (644, 600, 700)
   - Identify which permissions are appropriate for different file types

5. Check user and group information:
   ```bash
   id                     # Current user information
   groups                 # User's groups
   cat /etc/passwd        # User accounts
   cat /etc/group         # Group information
   ```

**Deliverable:** Screenshots showing file permissions and documented analysis

### Task 3: Log Analysis and Extraction (Day 3)

**Objective:** Extract and analyze system logs for security events relevant to compliance.

**Instructions:**

1. Navigate to system logs:
   ```bash
   cd /var/log
   ls -la
   ```

2. Examine key log files:
   ```bash
   head -20 syslog        # System log (first 20 lines)
   tail -20 syslog        # Last 20 lines
   wc -l syslog           # Count lines
   ```

3. Use grep to search for specific events:
   ```bash
   grep -i "error" syslog | head -10
   grep -i "failed" syslog | head -10
   grep -i "sudo" syslog | head -10
   grep -i "authentication" syslog | head -10
   ```

4. Extract logs to your working directory:
   ```bash
   cd ~/grc-lab-week1
   cp /var/log/syslog audit_evidence/logs/syslog_sample.txt
   cp /var/log/auth.log audit_evidence/logs/auth_sample.txt 2>/dev/null || echo "auth.log not available"
   ```

5. Analyze the extracted logs:
   ```bash
   grep "sudo" audit_evidence/logs/syslog_sample.txt | wc -l
   grep -i "failed" audit_evidence/logs/syslog_sample.txt | head -5
   ```

6. Create a log analysis summary:
   - Count of sudo commands
   - Count of failed authentication attempts
   - Count of system errors
   - Identify any security-relevant events

**Deliverable:** Extracted logs and analysis summary

### Task 4: Compliance Documentation (Day 4)

**Objective:** Document findings related to log management and compliance implications.

**Instructions:**

1. Create a compliance assessment document:
   ```bash
   cat > audit_evidence/LOG_MANAGEMENT_ASSESSMENT.txt << 'EOF'
   LOG MANAGEMENT COMPLIANCE ASSESSMENT
   ====================================
   
   1. Log Location and Accessibility
   - Primary log location: /var/log
   - Current user access: [Document your findings]
   - Permissions issues identified: [List any concerns]
   
   2. Log Retention
   - Current log files present: [List files]
   - Estimated retention period: [Document findings]
   - Compliance gaps: [Identify issues]
   
   3. Log Integrity
   - Log file permissions: [Document]
   - Owner and group: [Document]
   - Potential risks: [Identify]
   
   4. Security Events Logged
   - Authentication attempts: [Count]
   - Privilege escalation: [Count]
   - System errors: [Count]
   - Other security events: [List]
   
   5. Recommendations
   - [Recommendation 1]
   - [Recommendation 2]
   - [Recommendation 3]
   
   EOF
   cat audit_evidence/LOG_MANAGEMENT_ASSESSMENT.txt
   ```

2. Complete the assessment with your findings

3. Identify compliance risks:
   - Are logs adequately protected?
   - Is there sufficient retention?
   - Are security events properly logged?
   - What improvements are needed?

**Deliverable:** Completed compliance assessment document

### Task 5: Lab Report Preparation (Day 5)

**Objective:** Compile findings into a professional lab report.

**Instructions:**

1. Review all completed tasks and collected evidence

2. Organize your evidence:
   ```bash
   ls -la audit_evidence/
   find audit_evidence/ -type f
   ```

3. Prepare your lab report including:
   - Executive summary of findings
   - Detailed task completion with evidence
   - Security observations and risks
   - Compliance implications
   - Recommendations for improvement

4. Create a summary of commands used:
   ```bash
   cat > audit_evidence/COMMANDS_USED.txt << 'EOF'
   LINUX COMMANDS USED IN LAB
   ==========================
   
   File System Navigation:
   - pwd: Print working directory
   - ls: List directory contents
   - cd: Change directory
   
   File Management:
   - mkdir: Create directories
   - touch: Create files
   - cp: Copy files
   - chmod: Change permissions
   
   Log Analysis:
   - head: Display first lines
   - tail: Display last lines
   - grep: Search text
   - wc: Count lines
   
   System Information:
   - id: User information
   - groups: User groups
   - cat: Display file contents
   
   EOF
   cat audit_evidence/COMMANDS_USED.txt
   ```

**Deliverable:** Complete lab report with all evidence

## Assessment Criteria

Your lab will be assessed on:

| Criterion | Weight | Description |
|-----------|--------|-------------|
| File System Navigation | 15% | Ability to navigate and understand Linux directory structure |
| Permissions Understanding | 20% | Correct understanding and application of file permissions |
| Log Analysis | 25% | Ability to extract and analyze security-relevant logs |
| Compliance Assessment | 20% | Quality of compliance findings and risk identification |
| Documentation Quality | 20% | Professional presentation and completeness of lab report |

## Submission Requirements

1. **Lab Report (PDF or Markdown)**
   - Title page with lab number, date, and name
   - Executive summary
   - Detailed findings for each task
   - Screenshots and evidence
   - Analysis and conclusions
   - Recommendations

2. **Supporting Files**
   - Extracted log files
   - Compliance assessment document
   - Commands reference document
   - Any scripts or configuration files created

3. **File Organization**
   - Create a submission folder: `Week_01_GRC101_[YourName]`
   - Include all deliverables
   - Use professional naming conventions

## Submission Deadline

Friday, 11:59 PM (End of Week 1)

## Resources

- Linux File System: https://www.linux.com/training-tutorials/linux-filesystem-explained/
- File Permissions: https://www.linux.com/learn/understanding-linux-file-permissions
- Log Analysis: https://www.linux.com/learn/how-analyze-linux-logs-basic-commands
- Sample logs: datasets/system_logs.txt

## Common Issues and Troubleshooting

| Issue | Solution |
|-------|----------|
| Permission denied | Use `sudo` for system files, check file permissions with `ls -la` |
| Command not found | Ensure correct spelling, check if command is installed |
| Cannot access /var/log | Some logs require sudo access, use `sudo cat` |
| File already exists | Use `mv` to rename, or `rm` to delete first |

## Tips for Success

1. Take screenshots of each task completion
2. Document all commands used
3. Analyze logs for security implications
4. Think about compliance requirements
5. Present findings professionally
6. Review your work before submission

## Next Steps

Upon completion of this lab:

1. Review feedback from instructors
2. Prepare for Week 2: Linux Scripting for Compliance
3. Begin thinking about automation opportunities
4. Review GRC frameworks in preparation for Week 3

---

**Lab Created:** December 2025  
**Last Updated:** December 2025  
**Version:** 1.0
