# Getting Started with GRC Engineering Labs

## Prerequisites

Before starting the programme, ensure you have:

- A computer with Linux/Unix or Windows with WSL2
- Git installed and configured
- Text editor or IDE (VS Code, Sublime Text, etc.)
- Microsoft Excel or LibreOffice Calc
- Python 3.8+ (for scripting labs)
- Basic understanding of networking and security concepts

## Initial Setup

### Step 1: Clone the Repository

```bash
git clone <repository-url>
cd grc-engineering-labs
```

### Step 2: Explore the Structure

```bash
# View all phases
ls -la phase1/ phase2/ phase3/

# View Phase 1 modules
ls -la phase1/

# View a specific week
ls -la phase1/grc101/week1/
```

### Step 3: Review the Schedule

```bash
cat SCHEDULE.md
```

This shows the complete 52-week timeline with milestones and deadlines.

## Working with Labs

### Basic Lab Workflow

1. **Navigate to the lab directory:**
   ```bash
   cd phase1/grc101/week1
   ```

2. **Read the lab instructions:**
   ```bash
   cat LAB_INSTRUCTIONS.md
   ```

3. **Review available datasets:**
   ```bash
   cat DATASET_README.md
   ```

4. **Copy templates to your working directory:**
   ```bash
   cp -r templates/* ~/my-lab-work/
   ```

5. **Complete the lab tasks**

6. **Prepare your submission:**
   - Lab report (PDF or Markdown)
   - Completed worksheets
   - Supporting files and evidence
   - Screenshots and outputs

### Lab Directory Contents

Each lab week contains:

```
weekX/
├── LAB_INSTRUCTIONS.md      # Detailed objectives and tasks
├── DATASET_README.md        # Dataset documentation
├── templates/               # Lab-specific templates
│   ├── worksheet.xlsx
│   ├── report_template.md
│   └── checklist.xlsx
├── scripts/                 # Sample code and scripts
│   ├── sample_script.sh
│   └── sample_script.py
├── resources/               # Additional materials
│   ├── reference_guide.md
│   └── framework_summary.md
└── solutions/               # Reference solutions (instructor only)
    ├── sample_solution.md
    └── completed_worksheet.xlsx
```

## Working with Datasets

### Accessing Datasets

All shared datasets are located in the `datasets/` directory:

```bash
cd datasets
ls -la
```

### Available Datasets

1. **risk_assessment_data.xlsx**
   - Sample organizational risks
   - Financial impact data
   - Probability and impact ratings
   - Used in Weeks 10-14

2. **compliance_audit_data.xlsx**
   - Pre-populated audit checklists
   - Control mappings
   - Compliance status
   - Used in Weeks 8, 15-18

3. **system_logs.txt**
   - Real-world log samples
   - Security events
   - Access logs
   - Used in Weeks 1-2, 32-35

4. **organizational_data.xlsx**
   - Sample company structure
   - Departments and roles
   - Asset inventory
   - Used in Weeks 6, 9

5. **cloud_config_samples/**
   - AWS configuration examples
   - Azure configuration examples
   - Terraform files
   - Used in Weeks 27-31, 36-39

### Copying Datasets for Lab Work

```bash
# Copy specific dataset
cp datasets/risk_assessment_data.xlsx ~/my-lab-work/

# Copy all datasets
cp -r datasets/* ~/my-lab-work/
```

## Working with Templates

### Available Templates

Located in the `templates/` directory:

1. **risk_register_template.xlsx**
   - Risk identification
   - Assessment and scoring
   - Treatment planning
   - Monitoring

2. **policy_template.docx**
   - Policy structure
   - Control mappings
   - Approval workflow
   - Version history

3. **audit_checklist_template.xlsx**
   - Control questions
   - Evidence requirements
   - Scoring rubric
   - Finding documentation

4. **incident_response_template.md**
   - IR plan structure
   - Roles and responsibilities
   - Playbooks
   - Communication templates

5. **raci_matrix_template.xlsx**
   - Role definitions
   - Responsibility mapping
   - Approval workflows

6. **dfd_template.md**
   - Data flow diagram format
   - Process definitions
   - Data store descriptions

### Using Templates

```bash
# Copy template to your work directory
cp templates/risk_register_template.xlsx ~/my-lab-work/my_risk_register.xlsx

# Open and customize
libreoffice ~/my-lab-work/my_risk_register.xlsx
```

## Using Scripts and Code

### Available Scripts

Located in `resources/scripts/`:

1. **linux_compliance_check.sh**
   - System configuration checks
   - Permission verification
   - User account audit

2. **password_policy_checker.sh**
   - Password policy validation
   - Account lockout checks
   - Expiration verification

3. **compliance_report_generator.py**
   - Automated report generation
   - Data aggregation
   - Formatting and export

4. **risk_calculator.py**
   - Risk scoring calculations
   - ALE, SLE, ARO computation
   - Heatmap generation

### Running Scripts

```bash
# Make script executable
chmod +x resources/scripts/linux_compliance_check.sh

# Run script
./resources/scripts/linux_compliance_check.sh

# Run Python script
python3 resources/scripts/risk_calculator.py
```

## Phase-by-Phase Guidance

### Phase 1: Compliance & Governance Foundations (Weeks 1-18)

**Focus:** Foundational knowledge and documentation

- Start with Linux basics (Weeks 1-2)
- Learn GRC frameworks (Weeks 3-4)
- Develop policies and governance structures (Weeks 5-9)
- Master risk assessment methodologies (Weeks 10-14)
- Understand compliance frameworks (Weeks 15-18)

**Key Deliverables:**
- Compliance automation scripts
- Policy documents
- Risk registers
- Audit checklists

### Phase 2: Advanced GRC & Technical Integration (Weeks 19-35)

**Focus:** Technical skills and operational integration

- Incident response and business continuity (Weeks 19-23)
- Security awareness programs (Weeks 24-26)
- Cloud GRC and automation (Weeks 27-31)
- Security operations integration (Weeks 32-35)

**Key Deliverables:**
- IR and BCP plans
- Awareness program designs
- Cloud security assessments
- Vulnerability reports

### Phase 3: GRC Implementation & Automation (Weeks 36-47)

**Focus:** Implementation and capstone project

- DevSecOps and Infrastructure as Code (Weeks 36-39)
- GRC platform engineering (Weeks 40-43)
- Capstone project development (Weeks 44-47)

**Key Deliverables:**
- CI/CD pipeline configurations
- GRC dashboards
- Capstone project and presentation

## Submission Guidelines

### Lab Report Format

Each lab report should include:

1. **Title Page**
   - Lab number and title
   - Your name and date
   - Course and institution

2. **Executive Summary**
   - Brief overview of lab objectives
   - Key findings and conclusions

3. **Objectives**
   - List of lab objectives
   - How each was addressed

4. **Methodology**
   - Approach taken
   - Tools and techniques used
   - Frameworks applied

5. **Tasks and Results**
   - Each task completed
   - Evidence (screenshots, outputs, code)
   - Analysis and interpretation

6. **Findings and Analysis**
   - Key discoveries
   - Compliance gaps identified
   - Risk implications

7. **Recommendations**
   - Suggested improvements
   - Implementation steps
   - Timeline and resources

8. **Conclusion**
   - Summary of learning
   - Application to real-world scenarios

9. **Appendices**
   - Supporting documents
   - Code listings
   - Detailed data tables

### File Naming Convention

```
Week_[NUMBER]_[COURSE_CODE]_[YOUR_NAME]_[DATE].pdf
Example: Week_01_GRC101_JohnDoe_2025-01-15.pdf
```

### Submission Checklist

- [ ] Lab report (PDF or Markdown)
- [ ] Completed worksheets
- [ ] Scripts and code files
- [ ] Screenshots and evidence
- [ ] Supporting documentation
- [ ] Proper file naming
- [ ] Professional formatting
- [ ] Spell-checked and reviewed

## Troubleshooting

### Common Issues

**Issue: Cannot find dataset files**
- Solution: Ensure you are in the correct directory
  ```bash
  pwd  # Check current directory
  ls datasets/  # List datasets
  ```

**Issue: Script permission denied**
- Solution: Make script executable
  ```bash
  chmod +x script_name.sh
  ```

**Issue: Excel file won't open**
- Solution: Use LibreOffice Calc or Excel
  ```bash
  libreoffice template_name.xlsx
  ```

**Issue: Python script errors**
- Solution: Check Python version and dependencies
  ```bash
  python3 --version
  pip3 install -r requirements.txt  # If applicable
  ```

## Resources

- **NIST Framework:** resources/frameworks/NIST_CSF_summary.md
- **ISO 27001:** resources/frameworks/ISO27001_controls.md
- **CIS Benchmarks:** resources/frameworks/CIS_benchmarks_summary.md
- **PCI DSS:** resources/frameworks/PCI_DSS_requirements.md
- **Tools Guide:** resources/tools_guide.md

## Tips for Success

1. **Start Early:** Begin each lab at the beginning of the week
2. **Read Carefully:** Thoroughly review lab instructions before starting
3. **Use Templates:** Leverage provided templates to save time
4. **Document Everything:** Keep detailed notes and evidence
5. **Test Your Work:** Verify scripts and configurations before submission
6. **Seek Help:** Use discussion forums and office hours
7. **Review Feedback:** Apply feedback from previous labs to future work
8. **Stay Organized:** Maintain clear folder structure for all work
9. **Professional Quality:** Ensure all submissions are professionally formatted
10. **Continuous Learning:** Review reference materials and industry updates

## Next Steps

1. Review the full schedule: `cat SCHEDULE.md`
2. Navigate to Week 1: `cd phase1/grc101/week1`
3. Read lab instructions: `cat LAB_INSTRUCTIONS.md`
4. Begin your first lab

Good luck with the GRC Engineering Programme!

---

**Last Updated:** December 2025  
**Version:** 1.0
