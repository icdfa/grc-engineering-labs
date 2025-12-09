# Lab 4: Risk & Compliance Basics

**Course:** GRC101 - Introduction to GRC & Technical Landscape  
**Week:** 4  
**Duration:** 5 days  
**Level:** Beginner  
**Prerequisites:** Lab 1-3 - GRC Foundations

## Lab Overview

This lab introduces fundamental risk assessment and compliance concepts. Participants will perform a small asset-based risk assessment, calculate risk scores using spreadsheets, and create their first risk register. This foundation is essential for all subsequent risk management work.

## Learning Objectives

Upon completion of this lab, you will be able to:

- Understand risk assessment fundamentals
- Identify and categorize organizational assets
- Calculate risk scores using qualitative and quantitative methods
- Create and maintain a risk register
- Understand compliance implications of risks

## Required Resources

- Risk assessment dataset (datasets/risk_assessment_data.xlsx)
- Risk register template (templates/risk_register_template.xlsx)
- Spreadsheet application (Excel or LibreOffice Calc)
- Sample organizational data
- Lab report template

## Lab Tasks

### Task 1: Risk Assessment Fundamentals (Day 1)

**Objective:** Understand basic risk assessment concepts and terminology.

**Instructions:**

1. Create a risk assessment fundamentals document:
   ```bash
   mkdir -p ~/grc-lab-week4
   cd ~/grc-lab-week4
   
   cat > RISK_ASSESSMENT_FUNDAMENTALS.txt << 'EOF'
   RISK ASSESSMENT FUNDAMENTALS
   ============================
   
   CORE CONCEPTS:
   
   Risk: The potential for loss, damage, or failure resulting from a threat
   exploiting a vulnerability.
   
   Formula: Risk = Threat × Vulnerability × Impact
   
   Asset: Anything of value to the organization (data, systems, people, processes)
   
   Threat: A potential cause of an unwanted incident that may result in harm
   to a system or organization.
   
   Vulnerability: A weakness or gap in security controls that could be exploited
   by a threat.
   
   Impact: The consequence or effect of a risk being realized.
   
   Probability: The likelihood that a threat will exploit a vulnerability.
   
   RISK ASSESSMENT PROCESS:
   
   1. Asset Identification
      - Identify all organizational assets
      - Document asset characteristics
      - Determine asset value
   
   2. Threat Identification
      - Identify potential threats to assets
      - Categorize threats (internal/external, intentional/accidental)
      - Document threat sources
   
   3. Vulnerability Assessment
      - Identify weaknesses in controls
      - Assess control effectiveness
      - Document vulnerability severity
   
   4. Risk Analysis
      - Assess probability of threat occurrence
      - Assess potential impact
      - Calculate risk score
   
   5. Risk Evaluation
      - Compare risks to risk appetite
      - Prioritize risks
      - Determine treatment strategy
   
   6. Risk Treatment
      - Select mitigation strategy (reduce, avoid, accept, transfer)
      - Implement controls
      - Monitor effectiveness
   
   RISK CATEGORIES:
   
   Strategic Risk: Risks related to business strategy and objectives
   Operational Risk: Risks in day-to-day operations
   Technical Risk: Risks related to systems and technology
   Compliance Risk: Risks related to regulatory requirements
   Financial Risk: Risks related to financial impact
   Reputational Risk: Risks related to organizational reputation
   
   RISK SCORING:
   
   Qualitative: High, Medium, Low
   Quantitative: Numerical scores (1-5, 1-10, etc.)
   
   Probability Scale:
   - 1: Very Low (< 10% chance per year)
   - 2: Low (10-25% chance per year)
   - 3: Medium (25-50% chance per year)
   - 4: High (50-75% chance per year)
   - 5: Very High (> 75% chance per year)
   
   Impact Scale:
   - 1: Negligible (< $10K, minimal operational impact)
   - 2: Minor ($10K-$100K, limited operational impact)
   - 3: Moderate ($100K-$1M, significant operational impact)
   - 4: Major ($1M-$10M, major operational impact)
   - 5: Critical (> $10M, critical operational impact)
   
   Risk Score = Probability × Impact
   
   EOF
   
   cat RISK_ASSESSMENT_FUNDAMENTALS.txt
   ```

2. Review the provided risk assessment dataset:
   ```bash
   cp ../../../datasets/risk_assessment_data.xlsx ./
   ```

3. Document key risk assessment terminology and concepts

**Deliverable:** Risk assessment fundamentals document

### Task 2: Asset Identification and Valuation (Day 2)

**Objective:** Identify organizational assets and assess their value.

**Instructions:**

1. Create an asset inventory:
   ```bash
   cat > ASSET_INVENTORY.txt << 'EOF'
   ORGANIZATIONAL ASSET INVENTORY
   ==============================
   
   ASSET CATEGORIES:
   
   1. INFORMATION ASSETS
   - Customer data
   - Financial records
   - Intellectual property
   - Trade secrets
   - Strategic plans
   
   2. SYSTEM ASSETS
   - Servers and infrastructure
   - Network equipment
   - Workstations
   - Mobile devices
   - Cloud systems
   
   3. PHYSICAL ASSETS
   - Buildings and facilities
   - Equipment and hardware
   - Storage media
   - Office equipment
   
   4. PERSONNEL ASSETS
   - Key employees
   - Specialized skills
   - Organizational knowledge
   
   5. BUSINESS PROCESS ASSETS
   - Critical business processes
   - Service delivery processes
   - Support processes
   
   SAMPLE ASSET VALUATION:
   
   Asset: Customer Database
   Type: Information Asset
   Owner: Marketing Department
   Value: $5,000,000 (replacement and recovery cost)
   Criticality: Critical
   Sensitivity: Highly Sensitive (PII)
   
   Asset: Email System
   Type: System Asset
   Owner: IT Department
   Value: $500,000 (system cost + downtime)
   Criticality: Critical
   Sensitivity: Sensitive (business communications)
   
   Asset: Office Building
   Type: Physical Asset
   Owner: Facilities
   Value: $10,000,000 (property value)
   Criticality: High
   Sensitivity: Not applicable
   
   Asset: Finance Team
   Type: Personnel Asset
   Owner: CFO
   Value: $2,000,000 (replacement and training cost)
   Criticality: Critical
   Sensitivity: Not applicable
   
   Asset: Order Processing
   Type: Business Process
   Owner: Operations
   Value: $1,000,000 (revenue impact of downtime)
   Criticality: Critical
   Sensitivity: Not applicable
   
   EOF
   
   cat ASSET_INVENTORY.txt
   ```

2. Create a detailed asset inventory spreadsheet:
   - Asset name and description
   - Asset type and category
   - Asset owner
   - Asset value (financial and operational)
   - Criticality level
   - Sensitivity classification

3. Document asset dependencies:
   - Which assets depend on other assets
   - Critical asset relationships
   - Single points of failure

**Deliverable:** Asset inventory with valuations and dependencies

### Task 3: Threat and Vulnerability Assessment (Day 3)

**Objective:** Identify threats and vulnerabilities affecting organizational assets.

**Instructions:**

1. Create a threat and vulnerability assessment:
   ```bash
   cat > THREAT_VULNERABILITY_ASSESSMENT.txt << 'EOF'
   THREAT AND VULNERABILITY ASSESSMENT
   ====================================
   
   THREAT IDENTIFICATION:
   
   External Threats:
   - Cyber attacks (malware, ransomware, DDoS)
   - Data breaches
   - Phishing and social engineering
   - Nation-state actors
   - Organized cybercrime
   - Competitors
   - Natural disasters
   - Third-party failures
   
   Internal Threats:
   - Insider threats (malicious or negligent)
   - Unauthorized access
   - Data theft
   - System misconfiguration
   - Human error
   - Lack of awareness
   
   VULNERABILITY ASSESSMENT:
   
   Technical Vulnerabilities:
   - Unpatched systems
   - Weak authentication
   - Misconfigured systems
   - Insecure code
   - Lack of encryption
   - Outdated software
   
   Organizational Vulnerabilities:
   - Lack of policies
   - Inadequate training
   - Poor access control
   - Weak governance
   - Inadequate monitoring
   - Lack of incident response
   
   SAMPLE THREAT-VULNERABILITY PAIRS:
   
   Threat: Ransomware Attack
   Vulnerability: Unpatched systems, weak backup strategy
   Asset: Customer Database
   Impact: Data loss, operational disruption
   Probability: Medium
   
   Threat: Insider Threat
   Vulnerability: Excessive access rights, poor monitoring
   Asset: Financial Records
   Impact: Data theft, financial loss
   Probability: Low
   
   Threat: Phishing Attack
   Vulnerability: Lack of user awareness, weak email controls
   Asset: Email System, User Credentials
   Impact: Account compromise, data breach
   Probability: High
   
   Threat: System Failure
   Vulnerability: Single point of failure, inadequate redundancy
   Asset: Email System
   Impact: Service outage, productivity loss
   Probability: Medium
   
   EOF
   
   cat THREAT_VULNERABILITY_ASSESSMENT.txt
   ```

2. Create a threat matrix:
   - List major threats to the organization
   - Identify affected assets
   - Assess threat likelihood
   - Document existing controls

3. Assess vulnerabilities:
   - Identify control gaps
   - Assess control effectiveness
   - Document vulnerability severity

**Deliverable:** Threat and vulnerability assessment document

### Task 4: Risk Scoring and Register Creation (Day 4)

**Objective:** Calculate risk scores and create a risk register.

**Instructions:**

1. Create a risk scoring spreadsheet:
   ```bash
   cat > RISK_SCORING_GUIDE.txt << 'EOF'
   RISK SCORING METHODOLOGY
   ========================
   
   QUALITATIVE RISK SCORING:
   
   Risk Level = Probability × Impact
   
   Probability Scale:
   1 = Very Low
   2 = Low
   3 = Medium
   4 = High
   5 = Very High
   
   Impact Scale:
   1 = Negligible
   2 = Minor
   3 = Moderate
   4 = Major
   5 = Critical
   
   Risk Score Interpretation:
   1-5: Low Risk (Green)
   6-10: Medium Risk (Yellow)
   11-15: High Risk (Orange)
   16-20: Critical Risk (Red)
   
   SAMPLE RISK CALCULATIONS:
   
   Risk 1: Ransomware Attack
   Probability: 3 (Medium - 25-50% chance)
   Impact: 4 (Major - $1M-$10M impact)
   Risk Score: 3 × 4 = 12 (High Risk)
   
   Risk 2: Insider Threat
   Probability: 2 (Low - 10-25% chance)
   Impact: 4 (Major - $1M-$10M impact)
   Risk Score: 2 × 4 = 8 (Medium Risk)
   
   Risk 3: Phishing Attack
   Probability: 4 (High - 50-75% chance)
   Impact: 2 (Minor - $10K-$100K impact)
   Risk Score: 4 × 2 = 8 (Medium Risk)
   
   Risk 4: System Failure
   Probability: 3 (Medium - 25-50% chance)
   Impact: 3 (Moderate - $100K-$1M impact)
   Risk Score: 3 × 3 = 9 (Medium Risk)
   
   Risk 5: Data Breach
   Probability: 2 (Low - 10-25% chance)
   Impact: 5 (Critical - > $10M impact)
   Risk Score: 2 × 5 = 10 (Medium Risk)
   
   QUANTITATIVE RISK SCORING:
   
   Annual Loss Expectancy (ALE) = Single Loss Expectancy (SLE) × Annualized Rate of Occurrence (ARO)
   
   SLE = Asset Value × Exposure Factor
   ARO = Probability of occurrence per year
   
   Example:
   Asset: Customer Database ($5,000,000)
   Exposure Factor: 100% (complete loss if breached)
   SLE = $5,000,000 × 1.0 = $5,000,000
   ARO = 0.2 (20% chance per year)
   ALE = $5,000,000 × 0.2 = $1,000,000 per year
   
   EOF
   
   cat RISK_SCORING_GUIDE.txt
   ```

2. Create a risk register spreadsheet with columns:
   - Risk ID
   - Risk Description
   - Asset Affected
   - Threat
   - Vulnerability
   - Probability
   - Impact
   - Risk Score
   - Current Controls
   - Risk Owner
   - Treatment Strategy
   - Target Risk Level
   - Status

3. Populate the register with sample risks:
   - Ransomware attack
   - Insider threat
   - Phishing attack
   - System failure
   - Data breach
   - Compliance violation
   - Third-party failure
   - Natural disaster

**Deliverable:** Risk register with calculated risk scores

### Task 5: Lab Report and Recommendations (Day 5)

**Objective:** Prepare comprehensive lab report with risk recommendations.

**Instructions:**

1. Create a risk summary report:
   ```bash
   cat > RISK_SUMMARY_REPORT.txt << 'EOF'
   RISK ASSESSMENT SUMMARY REPORT
   ==============================
   
   EXECUTIVE SUMMARY:
   This risk assessment identified 7 major risks to the organization,
   ranging from Low to Critical severity. Key findings and recommendations
   are outlined below.
   
   RISK OVERVIEW:
   
   Critical Risks (16-20): 0
   High Risks (11-15): 2
   Medium Risks (6-10): 3
   Low Risks (1-5): 2
   
   TOP RISKS:
   
   1. Ransomware Attack (Score: 12 - High)
      Impact: Major operational disruption and data loss
      Recommendation: Implement robust backup strategy and disaster recovery
   
   2. Phishing Attack (Score: 8 - Medium)
      Impact: Account compromise and data breach
      Recommendation: Enhance user awareness and email security controls
   
   3. Insider Threat (Score: 8 - Medium)
      Impact: Data theft and financial loss
      Recommendation: Implement access controls and monitoring
   
   4. System Failure (Score: 9 - Medium)
      Impact: Service outage and productivity loss
      Recommendation: Implement redundancy and failover mechanisms
   
   5. Data Breach (Score: 10 - Medium)
      Impact: Regulatory fines and reputational damage
      Recommendation: Implement data protection and incident response
   
   RECOMMENDATIONS:
   
   Immediate Actions (0-30 days):
   - Implement multi-factor authentication
   - Conduct security awareness training
   - Review and update access controls
   
   Short-term Actions (30-90 days):
   - Implement backup and disaster recovery
   - Enhance email security
   - Establish incident response procedures
   
   Long-term Actions (90+ days):
   - Implement SIEM for monitoring
   - Conduct vulnerability assessments
   - Establish risk management program
   
   EOF
   
   cat RISK_SUMMARY_REPORT.txt
   ```

2. Prepare lab report including:
   - Risk assessment fundamentals
   - Asset inventory and valuation
   - Threat and vulnerability assessment
   - Risk register with calculations
   - Risk prioritization
   - Treatment recommendations
   - Implementation roadmap

3. Create supporting documentation:
   - Risk scoring methodology
   - Asset inventory
   - Threat-vulnerability matrix
   - Risk treatment strategies

**Deliverable:** Complete lab report with risk assessment and recommendations

## Assessment Criteria

Your lab will be assessed on:

| Criterion | Weight | Description |
|-----------|--------|-------------|
| Risk Identification | 20% | Completeness and accuracy of risk identification |
| Asset Valuation | 15% | Appropriate asset identification and valuation |
| Risk Scoring | 25% | Correct calculation of risk scores |
| Risk Register | 20% | Quality and completeness of risk register |
| Recommendations | 20% | Quality and feasibility of recommendations |

## Submission Requirements

1. **Lab Report (PDF or Markdown)**
   - Risk assessment overview
   - Asset inventory and valuation
   - Threat and vulnerability assessment
   - Risk register with calculations
   - Risk prioritization and analysis
   - Treatment recommendations

2. **Supporting Files**
   - Risk assessment fundamentals document
   - Asset inventory spreadsheet
   - Threat-vulnerability assessment
   - Risk register (spreadsheet)
   - Risk scoring guide
   - Risk summary report

3. **File Organization**
   - Folder: `Week_04_GRC101_[YourName]`
   - All documentation and spreadsheets included
   - Professional naming and formatting

## Submission Deadline

Friday, 11:59 PM (End of Week 4)

## Resources

- Risk Management Guide: resources/frameworks/
- Risk Assessment Dataset: datasets/risk_assessment_data.xlsx
- Risk Register Template: templates/risk_register_template.xlsx
- NIST Risk Management Framework: https://csrc.nist.gov/projects/risk-management

## Tips for Success

1. Identify comprehensive list of assets
2. Consider diverse threat sources
3. Assess existing controls realistically
4. Use consistent scoring methodology
5. Prioritize risks appropriately
6. Provide actionable recommendations
7. Present findings professionally

## Next Steps

Upon completion of this lab:

1. Review instructor feedback on risk assessment
2. Prepare for Phase I Examination (Week 18)
3. Begin Week 5: Policy Development Lab
4. Start thinking about governance structure

---

**Lab Created:** December 2025  
**Last Updated:** December 2025  
**Version:** 1.0
