# Lab 2: Linux Scripting for Compliance

**Course:** GRC101 - Introduction to GRC & Technical Landscape  
**Week:** 2  
**Duration:** 5 days  
**Level:** Beginner to Intermediate  
**Prerequisites:** Lab 1 - Linux for GRC Operations

## Lab Overview

This lab introduces bash scripting for compliance automation. Participants will write scripts to check system configurations, detect unauthorized users, and generate compliance reports.

## Learning Objectives

Upon completion of this lab, you will be able to:

- Write bash scripts for compliance automation
- Automate system configuration verification
- Detect unauthorized user accounts and privilege escalation
- Generate automated compliance reports
- Implement error handling and logging in scripts

## Required Resources

- Linux system (Ubuntu 20.04 or later recommended)
- Terminal/SSH access
- Text editor (nano, vim, or VS Code)
- Lab report template (provided)
- Excel or LibreOffice Calc for data analysis
- Access to framework documentation (provided in resources/)
- Sample datasets (provided in datasets/)

## Lab Tasks

### Task 1: Bash Scripting Fundamentals (Day 1)

**Objective:** Learn bash scripting basics and create your first compliance automation script

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week2/task1
   cd ~/grc-lab-week2/task1
   ```

2. Review the task requirements and objectives carefully

3. Follow the step-by-step procedures below:

   **Step-by-Step Procedure:**
   
   a. Create a new script file:
   ```bash
   nano task1_script.sh
   ```
   
   b. Add the script header and shebang:
   ```bash
   #!/bin/bash
   # Script: task1_script.sh
   # Purpose: [Describe purpose]
   # Author: [Your name]
   # Date: $(date +%Y-%m-%d)
   ```
   
   c. Implement the required functionality with proper error handling
   
   d. Make the script executable:
   ```bash
   chmod +x task1_script.sh
   ```
   
   e. Test the script:
   ```bash
   ./task1_script.sh
   ```
   
   f. Document the script with comments explaining each section
   
   g. Create a README explaining script usage:
   ```bash
   cat > README.md << 'EOF'
   # Task 1 Script Documentation
   
   ## Purpose
   [Describe what the script does]
   
   ## Usage
   ```
   ./task1_script.sh [options]
   ```
   
   ## Requirements
   - List any prerequisites
   - Required permissions
   - Dependencies
   
   ## Output
   Describe expected output and where files are saved
   EOF
   ```
   

4. Document your findings and create deliverables

5. Review your work for completeness and accuracy

**Deliverable:** Completed task documentation, analysis, and supporting files

### Task 2: User Account Compliance Script (Day 2)

**Objective:** Create a script to detect unauthorized user accounts and verify account compliance

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week2/task2
   cd ~/grc-lab-week2/task2
   ```

2. Review the task requirements and objectives carefully

3. Follow the step-by-step procedures below:

   **Step-by-Step Procedure:**
   
   a. Create a new script file:
   ```bash
   nano task2_script.sh
   ```
   
   b. Add the script header and shebang:
   ```bash
   #!/bin/bash
   # Script: task2_script.sh
   # Purpose: [Describe purpose]
   # Author: [Your name]
   # Date: $(date +%Y-%m-%d)
   ```
   
   c. Implement the required functionality with proper error handling
   
   d. Make the script executable:
   ```bash
   chmod +x task2_script.sh
   ```
   
   e. Test the script:
   ```bash
   ./task2_script.sh
   ```
   
   f. Document the script with comments explaining each section
   
   g. Create a README explaining script usage:
   ```bash
   cat > README.md << 'EOF'
   # Task 2 Script Documentation
   
   ## Purpose
   [Describe what the script does]
   
   ## Usage
   ```
   ./task2_script.sh [options]
   ```
   
   ## Requirements
   - List any prerequisites
   - Required permissions
   - Dependencies
   
   ## Output
   Describe expected output and where files are saved
   EOF
   ```
   

4. Document your findings and create deliverables

5. Review your work for completeness and accuracy

**Deliverable:** Completed task documentation, analysis, and supporting files

### Task 3: System Configuration Compliance (Day 3)

**Objective:** Create scripts to verify system configuration against security baselines

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week2/task3
   cd ~/grc-lab-week2/task3
   ```

2. Review the task requirements and objectives carefully

3. Follow the step-by-step procedures below:

   **Step-by-Step Procedure:**
   
   a. Review framework documentation:
   ```bash
   cat ../../resources/framework_guides/[relevant_framework].md
   ```
   
   b. Create framework mapping document:
   ```bash
   cat > framework_mapping.md << 'EOF'
   # Framework Mapping - Task 3
   
   ## Framework Overview
   [Name and describe the framework]
   
   ## Control Mapping
   
   | Control ID | Control Description | Implementation Status | Evidence | Gap |
   |------------|---------------------|----------------------|----------|-----|
   | [ID]       | [Description]       | [Status]             | [Evidence]| [Gap]|
   
   ## Gap Analysis Summary
   [Summarize identified gaps]
   
   ## Recommendations
   [List recommendations for addressing gaps]
   EOF
   ```
   
   c. Analyze framework requirements:
   - Review each control or requirement
   - Assess current implementation status
   - Identify gaps and deficiencies
   - Document evidence of compliance
   
   d. Perform gap analysis:
   - Compare current state to framework requirements
   - Prioritize gaps by risk and impact
   - Estimate effort to close gaps
   
   e. Develop remediation roadmap:
   - Create timeline for gap closure
   - Assign responsibilities
   - Estimate resources needed
   
   f. Document findings and recommendations
   

4. Document your findings and create deliverables

5. Review your work for completeness and accuracy

**Deliverable:** Completed task documentation, analysis, and supporting files

### Task 4: Automated Compliance Reporting (Day 4)

**Objective:** Create automated compliance reports with proper formatting and documentation

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week2/task4
   cd ~/grc-lab-week2/task4
   ```

2. Review the task requirements and objectives carefully

3. Follow the step-by-step procedures below:

   **Step-by-Step Procedure:**
   
   a. Review framework documentation:
   ```bash
   cat ../../resources/framework_guides/[relevant_framework].md
   ```
   
   b. Create framework mapping document:
   ```bash
   cat > framework_mapping.md << 'EOF'
   # Framework Mapping - Task 4
   
   ## Framework Overview
   [Name and describe the framework]
   
   ## Control Mapping
   
   | Control ID | Control Description | Implementation Status | Evidence | Gap |
   |------------|---------------------|----------------------|----------|-----|
   | [ID]       | [Description]       | [Status]             | [Evidence]| [Gap]|
   
   ## Gap Analysis Summary
   [Summarize identified gaps]
   
   ## Recommendations
   [List recommendations for addressing gaps]
   EOF
   ```
   
   c. Analyze framework requirements:
   - Review each control or requirement
   - Assess current implementation status
   - Identify gaps and deficiencies
   - Document evidence of compliance
   
   d. Perform gap analysis:
   - Compare current state to framework requirements
   - Prioritize gaps by risk and impact
   - Estimate effort to close gaps
   
   e. Develop remediation roadmap:
   - Create timeline for gap closure
   - Assign responsibilities
   - Estimate resources needed
   
   f. Document findings and recommendations
   

4. Document your findings and create deliverables

5. Review your work for completeness and accuracy

**Deliverable:** Completed task documentation, analysis, and supporting files

### Task 5: Script Documentation and Best Practices (Day 5)

**Objective:** Document all scripts and implement best practices for production use

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week2/task5
   cd ~/grc-lab-week2/task5
   ```

2. Review the task requirements and objectives carefully

3. Follow the step-by-step procedures below:

   **Step-by-Step Procedure:**
   
   a. Create a new script file:
   ```bash
   nano task5_script.sh
   ```
   
   b. Add the script header and shebang:
   ```bash
   #!/bin/bash
   # Script: task5_script.sh
   # Purpose: [Describe purpose]
   # Author: [Your name]
   # Date: $(date +%Y-%m-%d)
   ```
   
   c. Implement the required functionality with proper error handling
   
   d. Make the script executable:
   ```bash
   chmod +x task5_script.sh
   ```
   
   e. Test the script:
   ```bash
   ./task5_script.sh
   ```
   
   f. Document the script with comments explaining each section
   
   g. Create a README explaining script usage:
   ```bash
   cat > README.md << 'EOF'
   # Task 5 Script Documentation
   
   ## Purpose
   [Describe what the script does]
   
   ## Usage
   ```
   ./task5_script.sh [options]
   ```
   
   ## Requirements
   - List any prerequisites
   - Required permissions
   - Dependencies
   
   ## Output
   Describe expected output and where files are saved
   EOF
   ```
   

4. Document your findings and create deliverables

5. Review your work for completeness and accuracy

**Deliverable:** Completed task documentation, analysis, and supporting files

## Assessment Criteria

Your lab will be assessed on:

| Criterion | Weight | Description |
|-----------|--------|-------------|
| Technical Accuracy | 25% | Correctness of technical work and analysis |
| Completeness | 20% | All tasks completed with required deliverables |
| Documentation Quality | 20% | Clear, professional documentation and reporting |
| Critical Thinking | 20% | Depth of analysis and insights provided |
| Professional Presentation | 15% | Organization, formatting, and clarity |

## Submission Requirements

1. **Lab Report (PDF or Markdown)**
   - Title page with lab number, date, and name
   - Executive summary
   - Detailed findings for each task
   - Screenshots and evidence
   - Analysis and conclusions
   - Recommendations

2. **Supporting Files**
   - All scripts, documents, and analysis files created
   - Excel/CSV files with data analysis
   - Any configuration files or templates developed
   - Screenshots demonstrating task completion

3. **File Organization**
   - Create submission folder: `Week_{lab['week']:02d}_{lab['course']}_[YourName]`
   - Include all task directories
   - Use professional naming conventions
   - Include README with file descriptions

## Submission Deadline

Friday, 11:59 PM (End of Week {lab['week']})

## Resources

- Course materials and framework documentation in resources/
- Sample datasets in datasets/
- Lab templates in templates/
- Additional reading materials provided in course portal

## Common Issues and Troubleshooting

| Issue | Solution |
|-------|----------|
| Missing files or datasets | Check datasets/ directory, download if necessary |
| Permission issues | Ensure proper file permissions, use sudo if required |
| Software not installed | Install required packages using apt or pip |
| Unclear requirements | Review task objectives, consult documentation |

## Tips for Success

1. Read all task instructions before starting
2. Take detailed notes as you work
3. Document your thought process and decisions
4. Create backups of your work regularly
5. Test your work thoroughly before submission
6. Review assessment criteria before finalizing
7. Proofread all documentation
8. Organize files logically
9. Include all required deliverables
10. Submit before the deadline

## Next Steps

Upon completion of this lab:

1. Review instructor feedback
2. Prepare for Week {lab['week'] + 1} lab
3. Continue building your GRC knowledge
4. Practice skills learned in this lab
5. Connect concepts across different weeks

---

**Lab Created:** December 2025  
**Last Updated:** December 2025  
**Version:** 1.0
