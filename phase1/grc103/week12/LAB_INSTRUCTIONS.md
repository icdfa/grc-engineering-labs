# Lab 12: Risk Treatment and Monitoring

**Course:** GRC103 - Risk Assessment & Management  
**Week:** 12  
**Duration:** 5 days  
**Level:** Intermediate  
**Prerequisites:** Week 11 - Business Impact Analysis

## Lab Overview

This lab covers risk treatment strategies, control selection, and ongoing risk monitoring. Participants will develop risk treatment plans and implement risk monitoring dashboards.

## Learning Objectives

Upon completion of this lab, you will be able to:

- Develop risk treatment strategies (avoid, mitigate, transfer, accept)
- Select and implement appropriate controls
- Create risk treatment plans
- Implement risk monitoring and reporting
- Track risk metrics and KRIs

## Required Resources

- Linux system (Ubuntu 20.04 or later recommended)
- Terminal/SSH access
- Text editor (nano, vim, or VS Code)
- Lab report template (provided)
- Excel or LibreOffice Calc for data analysis
- Access to framework documentation (provided in resources/)
- Sample datasets (provided in datasets/)

## Lab Tasks

### Task 1: Risk Treatment Strategy Development (Day 1)

**Objective:** Develop appropriate risk treatment strategies for identified risks

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week12/task1
   cd ~/grc-lab-week12/task1
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

### Task 2: Control Selection and Mapping (Day 2)

**Objective:** Select and map controls to address identified risks

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week12/task2
   cd ~/grc-lab-week12/task2
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
   # Task 2 - Control Selection and Mapping
   
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

### Task 3: Risk Treatment Plan Creation (Day 3)

**Objective:** Create detailed risk treatment implementation plans

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week12/task3
   cd ~/grc-lab-week12/task3
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
   # Risk Register - Task 3
   
   | Risk ID | Risk Description | Likelihood | Impact | Score | Priority | Owner |
   |---------|------------------|------------|--------|-------|----------|-------|
   | R001    | [Description]    | [1-5]      | [1-5]  | [Score]| [Level] | [Name]|
   
   EOF
   ```
   
   f. Analyze and document findings in your lab report
   

4. Document your findings and create deliverables

5. Review your work for completeness and accuracy

**Deliverable:** Completed task documentation, analysis, and supporting files

### Task 4: Risk Monitoring Dashboard (Day 4)

**Objective:** Design and implement risk monitoring dashboard with KRIs

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week12/task4
   cd ~/grc-lab-week12/task4
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

### Task 5: Risk Reporting and Communication (Day 5)

**Objective:** Develop risk reporting processes and communication plans

**Instructions:**

1. Create a working directory for this task:
   ```bash
   mkdir -p ~/grc-lab-week12/task5
   cd ~/grc-lab-week12/task5
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
   # Risk Register - Task 5
   
   | Risk ID | Risk Description | Likelihood | Impact | Score | Priority | Owner |
   |---------|------------------|------------|--------|-------|----------|-------|
   | R001    | [Description]    | [1-5]      | [1-5]  | [Score]| [Level] | [Name]|
   
   EOF
   ```
   
   f. Analyze and document findings in your lab report
   

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
