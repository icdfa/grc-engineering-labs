# Lab 9: Vendor Risk Management

**Course:** GRC102 - Information Security Governance  
**Week:** 9  
**Duration:** 5 days  
**Level:** Intermediate  
**Prerequisites:** Week 8 - Security Awareness Program Development

## Lab Overview

This lab introduces third-party risk management and vendor security assessments. Participants will conduct vendor risk assessments, review contracts, and manage vendor compliance.

## Learning Objectives

Upon completion of this lab, you will be able to:

- Understand third-party risk management principles
- Conduct vendor security assessments
- Review and negotiate security contract terms
- Implement vendor risk monitoring
- Manage vendor compliance and audits

## Required Resources

- Linux system (Ubuntu 20.04 or later recommended)
- Terminal/SSH access
- Text editor (nano, vim, or VS Code)
- Lab report template (provided)
- Excel or LibreOffice Calc for data analysis
- Access to framework documentation (provided in resources/)
- Sample datasets (provided in datasets/)

## Lab Tasks

### Task 1: Vendor Risk Assessment (Day 1)

**Objective:** Conduct comprehensive vendor security risk assessments

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week9/task1
   cd ~/grc-lab-week9/task1
   ```

2. Review the task requirements and objectives carefully

3. Follow the step-by-step procedures below:

   **Step-by-Step Procedure:**
   
   a. Open the risk assessment template:
   ```bash
   cp ../../datasets/risk_assessment_data.xlsx ./risk_analysis.xlsx
   # Or use LibreOffice: libreoffice --calc risk_analysis.xlsx
   ```
   
   b. Identify and document risks:
   - Review organizational scenarios
   - Identify potential threats and vulnerabilities
   - Document risk descriptions
   
   c. Assess risk likelihood and impact:
   - Use provided likelihood scale (1-5)
   - Use provided impact scale (1-5)
   - Calculate risk scores (Likelihood × Impact)
   
   d. Prioritize risks:
   - Rank risks by score
   - Categorize as Critical, High, Medium, Low
   - Document prioritization rationale
   
   e. Create risk register:
   ```bash
   cat > risk_register.md << 'EOF'
   # Risk Register - Task 1
   
   | Risk ID | Risk Description | Likelihood | Impact | Score | Priority | Owner |
   |---------|------------------|------------|--------|-------|----------|-------|
   | R001    | [Description]    | [1-5]      | [1-5]  | [Score]| [Level] | [Name]|
   
   EOF
   ```
   
   f. Analyze and document findings in your lab report
   

4. Document your findings and create deliverables

5. Review your work for completeness and accuracy

**Deliverable:** Completed task documentation, analysis, and supporting files

### Task 2: Security Questionnaire Development (Day 2)

**Objective:** Create vendor security assessment questionnaires

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week9/task2
   cd ~/grc-lab-week9/task2
   ```

2. Review the task requirements and objectives carefully

3. Follow the step-by-step procedures below:

   **Step-by-Step Procedure:**
   
   a. Review task requirements and objectives carefully
   
   b. Gather necessary resources and materials:
   ```bash
   # List available resources
   ls ../../resources/
   ls ../../datasets/
   ls ../../templates/
   ```
   
   c. Create working documents:
   ```bash
   cat > task2_work.md << 'EOF'
   # Task 2 - Security Questionnaire Development
   
   ## Objective
   [Restate the objective]
   
   ## Approach
   [Describe your approach]
   
   ## Work Performed
   [Document your work step-by-step]
   
   ## Findings
   [Document what you discovered]
   
   ## Conclusions
   [State your conclusions]
   
   ## Recommendations
   [Provide recommendations]
   EOF
   ```
   
   d. Complete the required work systematically:
   - Follow best practices
   - Document your process
   - Validate your work
   - Seek clarification if needed
   
   e. Review and verify your work:
   - Check against requirements
   - Ensure completeness
   - Verify accuracy
   - Proofread documentation
   
   f. Prepare final deliverables:
   - Organize all files
   - Create summary documentation
   - Include all required elements
   

4. Document your findings and create deliverables

5. Review your work for completeness and accuracy

**Deliverable:** Completed task documentation, analysis, and supporting files

### Task 3: Contract Security Review (Day 3)

**Objective:** Review and assess security terms in vendor contracts

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week9/task3
   cd ~/grc-lab-week9/task3
   ```

2. Review the task requirements and objectives carefully

3. Follow the step-by-step procedures below:

   **Step-by-Step Procedure:**
   
   a. Review task requirements and objectives carefully
   
   b. Gather necessary resources and materials:
   ```bash
   # List available resources
   ls ../../resources/
   ls ../../datasets/
   ls ../../templates/
   ```
   
   c. Create working documents:
   ```bash
   cat > task3_work.md << 'EOF'
   # Task 3 - Contract Security Review
   
   ## Objective
   [Restate the objective]
   
   ## Approach
   [Describe your approach]
   
   ## Work Performed
   [Document your work step-by-step]
   
   ## Findings
   [Document what you discovered]
   
   ## Conclusions
   [State your conclusions]
   
   ## Recommendations
   [Provide recommendations]
   EOF
   ```
   
   d. Complete the required work systematically:
   - Follow best practices
   - Document your process
   - Validate your work
   - Seek clarification if needed
   
   e. Review and verify your work:
   - Check against requirements
   - Ensure completeness
   - Verify accuracy
   - Proofread documentation
   
   f. Prepare final deliverables:
   - Organize all files
   - Create summary documentation
   - Include all required elements
   

4. Document your findings and create deliverables

5. Review your work for completeness and accuracy

**Deliverable:** Completed task documentation, analysis, and supporting files

### Task 4: Vendor Risk Monitoring (Day 4)

**Objective:** Implement ongoing vendor risk monitoring processes

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week9/task4
   cd ~/grc-lab-week9/task4
   ```

2. Review the task requirements and objectives carefully

3. Follow the step-by-step procedures below:

   **Step-by-Step Procedure:**
   
   a. Open the risk assessment template:
   ```bash
   cp ../../datasets/risk_assessment_data.xlsx ./risk_analysis.xlsx
   # Or use LibreOffice: libreoffice --calc risk_analysis.xlsx
   ```
   
   b. Identify and document risks:
   - Review organizational scenarios
   - Identify potential threats and vulnerabilities
   - Document risk descriptions
   
   c. Assess risk likelihood and impact:
   - Use provided likelihood scale (1-5)
   - Use provided impact scale (1-5)
   - Calculate risk scores (Likelihood × Impact)
   
   d. Prioritize risks:
   - Rank risks by score
   - Categorize as Critical, High, Medium, Low
   - Document prioritization rationale
   
   e. Create risk register:
   ```bash
   cat > risk_register.md << 'EOF'
   # Risk Register - Task 4
   
   | Risk ID | Risk Description | Likelihood | Impact | Score | Priority | Owner |
   |---------|------------------|------------|--------|-------|----------|-------|
   | R001    | [Description]    | [1-5]      | [1-5]  | [Score]| [Level] | [Name]|
   
   EOF
   ```
   
   f. Analyze and document findings in your lab report
   

4. Document your findings and create deliverables

5. Review your work for completeness and accuracy

**Deliverable:** Completed task documentation, analysis, and supporting files

### Task 5: Vendor Incident Management (Day 5)

**Objective:** Develop vendor security incident response procedures

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week9/task5
   cd ~/grc-lab-week9/task5
   ```

2. Review the task requirements and objectives carefully

3. Follow the step-by-step procedures below:

   **Step-by-Step Procedure:**
   
   a. Review task requirements and objectives carefully
   
   b. Gather necessary resources and materials:
   ```bash
   # List available resources
   ls ../../resources/
   ls ../../datasets/
   ls ../../templates/
   ```
   
   c. Create working documents:
   ```bash
   cat > task5_work.md << 'EOF'
   # Task 5 - Vendor Incident Management
   
   ## Objective
   [Restate the objective]
   
   ## Approach
   [Describe your approach]
   
   ## Work Performed
   [Document your work step-by-step]
   
   ## Findings
   [Document what you discovered]
   
   ## Conclusions
   [State your conclusions]
   
   ## Recommendations
   [Provide recommendations]
   EOF
   ```
   
   d. Complete the required work systematically:
   - Follow best practices
   - Document your process
   - Validate your work
   - Seek clarification if needed
   
   e. Review and verify your work:
   - Check against requirements
   - Ensure completeness
   - Verify accuracy
   - Proofread documentation
   
   f. Prepare final deliverables:
   - Organize all files
   - Create summary documentation
   - Include all required elements
   

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
