# Lab 3: Understanding GRC Frameworks

**Course:** GRC101 - Introduction to GRC & Technical Landscape  
**Week:** 3  
**Duration:** 5 days  
**Level:** Beginner to Intermediate  
**Prerequisites:** Lab 1-2 - Linux and Scripting Fundamentals

## Lab Overview

This lab focuses on understanding and mapping major GRC frameworks including NIST Cybersecurity Framework, ISO 27001, CIS Controls, and PCI DSS. Participants will learn how these frameworks relate to each other and how to map controls across different standards.

## Learning Objectives

Upon completion of this lab, you will be able to:

- Understand the structure and purpose of major GRC frameworks
- Map controls across different frameworks
- Identify control overlaps and gaps
- Create framework alignment documentation
- Apply frameworks to real-world scenarios

## Required Resources

- Framework reference documents (provided in resources/)
- Framework mapping templates
- Sample control matrices
- Text editor or spreadsheet application
- Lab report template

## Lab Tasks

### Task 1: Framework Overview and Structure (Day 1)

**Objective:** Understand the structure and purpose of major GRC frameworks.

**Instructions:**

1. Review framework documentation:
   ```bash
   cd ~/grc-lab-week3
   cat resources/frameworks/NIST_CSF_summary.md
   cat resources/frameworks/ISO27001_controls.md
   cat resources/frameworks/CIS_benchmarks_summary.md
   cat resources/frameworks/PCI_DSS_requirements.md
   ```

2. Create a framework comparison document:
   ```bash
   cat > FRAMEWORK_COMPARISON.txt << 'EOF'
   FRAMEWORK COMPARISON ANALYSIS
   =============================
   
   1. NIST CYBERSECURITY FRAMEWORK (CSF)
   Purpose: Voluntary framework for managing cybersecurity risk
   Scope: All organizations, all sectors
   Structure:
   - 5 Functions: Identify, Protect, Detect, Respond, Recover
   - 22 Categories
   - 98 Subcategories
   Key Strengths:
   - Flexible and scalable
   - Risk-based approach
   - Widely adopted
   
   2. ISO 27001:2022
   Purpose: Information security management system standard
   Scope: Organizations seeking certification
   Structure:
   - 4 Clauses (Context, Leadership, Planning, Support, Operation, Performance)
   - 14 Control Categories
   - 93 Controls
   Key Strengths:
   - Comprehensive
   - Internationally recognized
   - Certification available
   
   3. CIS CRITICAL SECURITY CONTROLS
   Purpose: Prioritized set of actions for cybersecurity
   Scope: All organizations
   Structure:
   - 18 Controls
   - 3 Implementation Groups (IG1, IG2, IG3)
   - Specific, actionable recommendations
   Key Strengths:
   - Practical and actionable
   - Prioritized approach
   - Threat-based
   
   4. PCI DSS (PAYMENT CARD INDUSTRY DATA SECURITY STANDARD)
   Purpose: Protect payment card data
   Scope: Organizations handling payment cards
   Structure:
   - 6 Goals
   - 12 Requirements
   - Specific technical controls
   Key Strengths:
   - Industry-specific
   - Detailed technical requirements
   - Compliance verification
   
   FRAMEWORK RELATIONSHIP:
   - NIST CSF: Overarching framework
   - ISO 27001: Comprehensive ISMS standard
   - CIS Controls: Prioritized, actionable controls
   - PCI DSS: Industry-specific requirements
   
   EOF
   
   cat FRAMEWORK_COMPARISON.txt
   ```

3. Document key framework concepts:
   - Framework purpose and scope
   - Structure and organization
   - Control categories
   - Implementation approach

**Deliverable:** Framework comparison document with analysis

### Task 2: NIST CSF Deep Dive (Day 2)

**Objective:** Understand NIST Cybersecurity Framework in detail.

**Instructions:**

1. Create a NIST CSF mapping document:
   ```bash
   cat > NIST_CSF_MAPPING.txt << 'EOF'
   NIST CYBERSECURITY FRAMEWORK - DETAILED MAPPING
   ================================================
   
   FUNCTION 1: IDENTIFY (ID)
   Purpose: Develop organizational understanding to manage cybersecurity risk
   Categories:
   - ID.AM: Asset Management
   - ID.BE: Business Environment
   - ID.GV: Governance
   - ID.RA: Risk Assessment
   - ID.RM: Risk Management Strategy
   - ID.SC: Supply Chain Risk Management
   
   Sample Controls:
   - Maintain inventory of all assets
   - Define business objectives
   - Establish governance structure
   - Conduct risk assessments
   
   FUNCTION 2: PROTECT (PR)
   Purpose: Implement safeguards to ensure delivery of critical services
   Categories:
   - PR.AC: Access Control
   - PR.AT: Awareness and Training
   - PR.DS: Data Security
   - PR.IP: Information Protection Processes and Procedures
   - PR.MA: Maintenance
   - PR.PT: Protective Technology
   
   Sample Controls:
   - Implement access controls
   - Provide security awareness training
   - Encrypt sensitive data
   - Maintain systems
   
   FUNCTION 3: DETECT (DE)
   Purpose: Implement activities to identify occurrence of cybersecurity events
   Categories:
   - DE.AE: Anomalies and Events
   - DE.CM: Security Continuous Monitoring
   - DE.DP: Detection Processes
   
   Sample Controls:
   - Monitor network traffic
   - Analyze logs
   - Detect anomalies
   
   FUNCTION 4: RESPOND (RS)
   Purpose: Implement activities to address detected cybersecurity events
   Categories:
   - RS.RP: Response Planning
   - RS.CO: Communications
   - RS.AN: Analysis
   - RS.MI: Mitigation
   - RS.IM: Improvements
   
   Sample Controls:
   - Develop incident response plan
   - Establish communication procedures
   - Analyze incidents
   - Contain and mitigate
   
   FUNCTION 5: RECOVER (RC)
   Purpose: Implement activities to restore capabilities after incident
   Categories:
   - RC.RP: Recovery Planning
   - RC.IM: Improvements
   - RC.CO: Communications
   
   Sample Controls:
   - Develop recovery plan
   - Restore systems
   - Communicate recovery status
   
   EOF
   
   cat NIST_CSF_MAPPING.txt
   ```

2. Map organizational controls to NIST CSF:
   - Identify which controls address each function
   - Document control ownership
   - Assess implementation status

3. Create a sample NIST CSF implementation matrix

**Deliverable:** NIST CSF detailed mapping and implementation matrix

### Task 3: ISO 27001 Control Mapping (Day 3)

**Objective:** Map ISO 27001 controls and understand control categories.

**Instructions:**

1. Create an ISO 27001 control mapping document:
   ```bash
   cat > ISO27001_CONTROL_MAPPING.txt << 'EOF'
   ISO 27001:2022 CONTROL MAPPING
   ==============================
   
   CONTROL CATEGORIES:
   
   A.5: Organizational Controls
   - A.5.1: Policies for information security
   - A.5.2: Information security roles and responsibilities
   - A.5.3: Segregation of duties
   - A.5.4: Management responsibilities
   - A.5.5: Contact with authorities
   - A.5.6: Threat intelligence
   - A.5.7: Security in supplier relationships
   - A.5.8: Supplier security assessment
   - A.5.9: Supplier security in agreements
   - A.5.10: Supplier information security performance management
   - A.5.11: Information security change management
   - A.5.12: Monitoring supplier information security
   
   A.6: People Controls
   - A.6.1: Screening
   - A.6.2: Terms and conditions of employment
   - A.6.3: Information security awareness, education and training
   - A.6.4: Disciplinary process
   - A.6.5: Responsibilities after employment termination
   - A.6.6: Confidentiality or non-disclosure agreements
   - A.6.7: Remote working
   - A.6.8: Information security event reporting
   
   A.7: Physical Controls
   - A.7.1: Physical security perimeters
   - A.7.2: Physical entry
   - A.7.3: Securing offices, rooms and facilities
   - A.7.4: Physical security monitoring
   - A.7.5: Protecting against physical and environmental threats
   - A.7.6: Working in secure areas
   - A.7.7: Clear desk and clear screen
   - A.7.8: Equipment siting and protection
   - A.7.9: Security of assets off-premises
   - A.7.10: Storage media
   - A.7.11: Supporting utilities
   - A.7.12: Cabling security
   - A.7.13: Equipment maintenance
   - A.7.14: Secure disposal or re-use of equipment
   
   A.8: Technological Controls
   - A.8.1: User endpoint devices
   - A.8.2: Privileged access rights
   - A.8.3: Information access restriction
   - A.8.4: Access to cryptographic keys
   - A.8.5: Cryptography
   - A.8.6: Developer security
   - A.8.7: Test information
   - A.8.8: Data protection and privacy
   - A.8.9: Information security in development and support processes
   - A.8.10: Information and communication technology supply chain security
   - A.8.11: Information security incident management
   - A.8.12: Business continuity management
   - A.8.13: Telecommunications
   - A.8.14: System monitoring
   - A.8.15: Logging
   - A.8.16: Monitoring activities
   - A.8.17: Clock synchronization
   - A.8.18: Use of privileged utility programs
   - A.8.19: Installation of software on operational systems
   - A.8.20: Networks security
   - A.8.21: Security of network services
   - A.8.22: Segregation of networks
   - A.8.23: Web filtering
   - A.8.24: Use of cryptography
   - A.8.25: Secure development life cycle
   - A.8.26: Application security requirements
   - A.8.27: Secure application development
   - A.8.28: Secure system architecture and engineering principles
   - A.8.29: Security testing in development and acceptance
   - A.8.30: Outsourced development
   - A.8.31: Separation of development, test and production environments
   - A.8.32: Change management
   - A.8.33: Test information and systems
   - A.8.34: Protection of information systems from malware
   - A.8.35: Management of removable media
   - A.8.36: Backup
   - A.8.37: Logging
   - A.8.38: Monitoring, review and change management of information processing facilities
   
   EOF
   
   cat ISO27001_CONTROL_MAPPING.txt
   ```

2. Create a control implementation checklist:
   - Document which controls are implemented
   - Identify gaps
   - Assess control maturity

3. Map ISO 27001 controls to NIST CSF

**Deliverable:** ISO 27001 control mapping and gap analysis

### Task 4: Cross-Framework Mapping (Day 4)

**Objective:** Create a cross-framework control mapping matrix.

**Instructions:**

1. Create a framework mapping template:
   ```bash
   cat > CROSS_FRAMEWORK_MAPPING.txt << 'EOF'
   CROSS-FRAMEWORK CONTROL MAPPING
   ===============================
   
   Example: Access Control
   
   NIST CSF:
   - PR.AC-1: Identities and credentials of authorized users, processes and devices are managed
   - PR.AC-2: Physical access to assets is managed and protected
   - PR.AC-3: Remote access is managed
   - PR.AC-4: Access permissions and authorizations are managed
   - PR.AC-5: Network integrity is protected
   - PR.AC-6: Identities are proofed and bound to credentials
   - PR.AC-7: Users, assets, and data are authenticated
   
   ISO 27001:
   - A.2.1: User registration and de-registration
   - A.2.2: User access provisioning
   - A.2.3: Management of privileged access rights
   - A.2.4: Management of secret authentication information of users
   - A.2.5: Access rights review
   - A.2.6: Removal or adjustment of access rights
   
   CIS Controls:
   - CIS Control 1: Inventory and Control of Enterprise Assets
   - CIS Control 2: Inventory and Control of Software Assets
   - CIS Control 3: Data Protection
   - CIS Control 5: Account Management
   - CIS Control 6: Access Control Management
   
   PCI DSS:
   - Requirement 2: Do not use vendor-supplied defaults
   - Requirement 7: Restrict access to data by business need to know
   - Requirement 8: Identify and authenticate access to system components
   
   MAPPING ANALYSIS:
   - All frameworks address access control
   - NIST CSF is broader and more strategic
   - ISO 27001 is more detailed and prescriptive
   - CIS Controls are more actionable
   - PCI DSS is specific to payment card data
   
   IMPLEMENTATION APPROACH:
   - Use NIST CSF as strategic framework
   - Use ISO 27001 for comprehensive coverage
   - Use CIS Controls for prioritization
   - Use PCI DSS for payment card requirements
   
   EOF
   
   cat CROSS_FRAMEWORK_MAPPING.txt
   ```

2. Create a comprehensive mapping matrix covering:
   - Access Control
   - Data Protection
   - Incident Response
   - Risk Management
   - Compliance Management

3. Identify overlaps and gaps across frameworks

**Deliverable:** Cross-framework mapping matrix and analysis

### Task 5: Lab Report and Documentation (Day 5)

**Objective:** Prepare comprehensive lab report on framework understanding.

**Instructions:**

1. Create a framework selection guide:
   ```bash
   cat > FRAMEWORK_SELECTION_GUIDE.txt << 'EOF'
   FRAMEWORK SELECTION GUIDE
   =========================
   
   CHOOSING THE RIGHT FRAMEWORK:
   
   Use NIST CSF if:
   - You need a flexible, scalable framework
   - You work with US government or critical infrastructure
   - You want a risk-based approach
   - You need to align with multiple standards
   
   Use ISO 27001 if:
   - You need international recognition
   - You want certification
   - You need comprehensive ISMS
   - You work in regulated industries
   
   Use CIS Controls if:
   - You need prioritized, actionable controls
   - You have limited resources
   - You want to focus on high-impact controls
   - You need threat-based approach
   
   Use PCI DSS if:
   - You handle payment card data
   - You need compliance verification
   - You work in payment processing
   - You need specific technical controls
   
   BEST PRACTICE:
   - Use NIST CSF as overarching framework
   - Map to ISO 27001 for comprehensive coverage
   - Implement CIS Controls for prioritization
   - Apply PCI DSS for payment card data
   
   EOF
   
   cat FRAMEWORK_SELECTION_GUIDE.txt
   ```

2. Prepare lab report including:
   - Framework overview and comparison
   - Detailed mapping for each framework
   - Cross-framework mapping matrix
   - Control implementation recommendations
   - Framework selection guidance

3. Create supporting documentation:
   - Framework summary sheets
   - Control mapping templates
   - Implementation checklists

**Deliverable:** Complete lab report with all framework documentation

## Assessment Criteria

Your lab will be assessed on:

| Criterion | Weight | Description |
|-----------|--------|-------------|
| Framework Understanding | 25% | Comprehension of framework structure and purpose |
| Mapping Accuracy | 25% | Correct mapping of controls across frameworks |
| Documentation Quality | 20% | Clear, professional documentation |
| Analysis Depth | 20% | Thorough analysis of overlaps and gaps |
| Report Quality | 10% | Professional presentation and completeness |

## Submission Requirements

1. **Lab Report (PDF or Markdown)**
   - Framework comparison analysis
   - Detailed framework mappings
   - Cross-framework mapping matrix
   - Control implementation recommendations
   - Framework selection guidance

2. **Supporting Files**
   - Framework comparison document
   - NIST CSF mapping
   - ISO 27001 control mapping
   - Cross-framework mapping matrix
   - Framework selection guide

3. **File Organization**
   - Folder: `Week_03_GRC101_[YourName]`
   - All documentation files included
   - Professional naming and formatting

## Submission Deadline

Friday, 11:59 PM (End of Week 3)

## Resources

- NIST Cybersecurity Framework: https://www.nist.gov/cyberframework
- ISO 27001:2022: https://www.iso.org/isoiec-27001-information-security-management.html
- CIS Controls: https://www.cisecurity.org/controls
- PCI DSS: https://www.pcisecuritystandards.org/

## Tips for Success

1. Study each framework thoroughly
2. Create detailed mapping matrices
3. Identify control overlaps
4. Analyze gaps and redundancies
5. Present findings professionally
6. Reference official framework documents

## Next Steps

Upon completion of this lab:

1. Review instructor feedback
2. Prepare for Week 4: Risk & Compliance Basics
3. Begin thinking about how to apply frameworks to risk assessment
4. Review risk assessment methodologies

---

**Lab Created:** December 2025  
**Last Updated:** December 2025  
**Version:** 1.0
