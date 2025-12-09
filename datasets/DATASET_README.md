# GRC Engineering Lab Datasets

This directory contains all datasets required for the GRC Engineering Programme labs. Each dataset is designed to provide realistic data for compliance, risk, and governance exercises.

## Available Datasets

### 1. risk_assessment_data.xlsx

**Purpose:** Sample risk data for risk assessment and management labs  
**Used in Weeks:** 10-14, 44-47  
**Size:** ~50 KB

**Contents:**
- Risk inventory with 20+ sample risks
- Asset inventory with valuations
- Threat catalog
- Vulnerability assessment data
- Risk scoring examples
- Treatment strategies

**Columns:**
- Risk ID
- Risk Description
- Asset Affected
- Threat Category
- Vulnerability
- Probability (1-5 scale)
- Impact (1-5 scale)
- Risk Score
- Financial Impact
- Current Controls
- Treatment Strategy
- Owner
- Status

**Usage Instructions:**
1. Open in Excel or LibreOffice Calc
2. Review sample data structure
3. Customize for your organization
4. Calculate risk scores using provided formulas
5. Create risk register based on template

### 2. compliance_audit_data.xlsx

**Purpose:** Compliance audit checklists and control assessment data  
**Used in Weeks:** 8, 15-18, 32-35  
**Size:** ~75 KB

**Contents:**
- ISO 27001 control checklist (93 controls)
- NIST CSF mapping (98 subcategories)
- CIS Controls assessment (18 controls)
- PCI DSS requirements (12 requirements)
- Control implementation status
- Evidence requirements
- Audit findings

**Sheets:**
- ISO 27001 Controls
- NIST CSF Mapping
- CIS Controls
- PCI DSS Requirements
- Assessment Status
- Findings Log

**Usage Instructions:**
1. Select relevant framework sheet
2. Review control descriptions
3. Assess implementation status
4. Document evidence
5. Record findings and gaps

### 3. system_logs.txt

**Purpose:** Sample system logs for analysis and monitoring labs  
**Used in Weeks:** 1-2, 32-35  
**Size:** ~500 KB

**Contents:**
- System authentication logs
- Security events
- User access logs
- Error messages
- Privilege escalation attempts
- Failed login attempts
- System configuration changes

**Log Types:**
- syslog entries
- auth.log entries
- security events
- access logs

**Usage Instructions:**
1. Copy to lab working directory
2. Use grep to search for specific events
3. Analyze patterns and anomalies
4. Extract security-relevant events
5. Generate compliance reports

### 4. organizational_data.xlsx

**Purpose:** Sample organizational structure and asset inventory  
**Used in Weeks:** 6, 9, 44-47  
**Size:** ~40 KB

**Contents:**
- Organizational structure
- Department information
- Employee roles and responsibilities
- Asset inventory
- System inventory
- Data classifications
- Business processes

**Sheets:**
- Organization Structure
- Departments
- Roles & Responsibilities
- Asset Inventory
- System Inventory
- Data Classification
- Business Processes

**Usage Instructions:**
1. Review organizational structure
2. Identify key roles and responsibilities
3. Map assets to departments
4. Assess data classification
5. Document business processes

### 5. cloud_config_samples/

**Purpose:** Sample cloud configurations for cloud GRC labs  
**Used in Weeks:** 27-31, 36-39  
**Size:** ~200 KB

**Contents:**

#### AWS Samples
- EC2 instance configurations
- S3 bucket policies
- IAM role definitions
- Security group rules
- VPC configurations
- CloudTrail logging setup

#### Azure Samples
- Virtual machine configurations
- Storage account settings
- Network security groups
- Role-based access control
- Azure Policy definitions
- Diagnostic settings

#### Terraform Files
- AWS resource definitions
- Azure resource definitions
- Security policy as code
- Compliance checks

**Usage Instructions:**
1. Review configuration files
2. Identify security misconfigurations
3. Assess compliance gaps
4. Create remediation scripts
5. Implement secure configurations

## Dataset Characteristics

### Data Sensitivity

- **Public:** system_logs.txt, compliance_audit_data.xlsx
- **Internal:** organizational_data.xlsx, cloud_config_samples/
- **Confidential:** risk_assessment_data.xlsx (contains financial data)

### Data Accuracy

All datasets contain realistic but fictional data. No real organizations, individuals, or systems are represented.

### Customization

All datasets are designed to be customized for specific organizational contexts. You may:
- Add or remove rows
- Modify values
- Change column names
- Create additional sheets
- Combine datasets

## Using Datasets in Labs

### General Workflow

1. **Locate Dataset**
   ```bash
   cd datasets/
   ls -la
   ```

2. **Copy to Working Directory**
   ```bash
   cp risk_assessment_data.xlsx ~/my-lab-work/
   ```

3. **Open and Review**
   ```bash
   libreoffice risk_assessment_data.xlsx
   ```

4. **Customize for Lab**
   - Modify data as needed
   - Add your analysis
   - Create required outputs

5. **Document Usage**
   - Record dataset source
   - Document modifications
   - Explain analysis approach

### Best Practices

1. **Preserve Original:** Keep original dataset files unmodified
2. **Version Control:** Track changes to datasets
3. **Documentation:** Document all modifications
4. **Consistency:** Use consistent data formats
5. **Validation:** Verify data accuracy before analysis

## Dataset Maintenance

### Updates

Datasets are updated periodically to reflect:
- New compliance frameworks
- Current threat landscape
- Industry best practices
- Regulatory changes

### Reporting Issues

If you find errors or inconsistencies in datasets:
1. Document the issue
2. Provide specific details
3. Submit through LMS
4. Include lab context

## Data Privacy and Security

### Handling Confidential Data

When working with datasets:
- Treat all data as confidential
- Do not share outside the programme
- Secure files when not in use
- Delete files after lab completion

### Compliance

All datasets comply with:
- GDPR (no real personal data)
- PCI DSS (no real payment card data)
- HIPAA (no real health data)
- Industry standards

## Frequently Asked Questions

**Q: Can I modify the datasets?**
A: Yes, you can customize datasets for your labs. Keep original files as reference.

**Q: Can I use these datasets outside the programme?**
A: Datasets are provided for educational purposes only. Check licence terms.

**Q: Are the datasets realistic?**
A: Yes, datasets are based on real-world scenarios but contain fictional data.

**Q: How often are datasets updated?**
A: Datasets are reviewed quarterly and updated as needed.

**Q: Can I request additional datasets?**
A: Yes, submit requests through the LMS with justification.

## Related Resources

- Risk Assessment Guide: resources/frameworks/
- Compliance Frameworks: resources/frameworks/
- Sample Scripts: resources/scripts/
- Tools Guide: resources/tools_guide.md

## Support

For questions about datasets:
1. Review this documentation
2. Check lab instructions
3. Consult with instructors
4. Use discussion forum

---

**Last Updated:** December 2025  
**Version:** 1.0  
**Status:** Active
