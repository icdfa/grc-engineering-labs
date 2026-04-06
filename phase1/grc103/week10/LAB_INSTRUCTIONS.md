# Lab 1: Risk Assessment Methodologies - Technical Scanning to GRC Analysis

**Course:** GRC103 - Risk Assessment & Management  
**Week:** 1  
**Duration:** 3-5 Hours  
**Level:** Intermediate  
**Prerequisites:** GRC102 completion or equivalent knowledge of networking and security fundamentals.

---

## Lab Overview

This lab bridges the gap between technical vulnerability scanning and Governance, Risk, and Compliance (GRC) analysis. You will use industry-standard tools like Nmap, Nikto, and Nuclei to identify vulnerabilities on a target system (Metasploitable) and then translate those technical findings into a professional risk assessment and executive summary.

## Learning Objectives

Upon completion of this lab, you will be able to:

-   **Execute Technical Scans:** Use Nmap, Nikto, and Nuclei to discover services and vulnerabilities.
-   **Analyze Technical Output:** Interpret scan results to identify specific service versions and security weaknesses.
-   **Conduct Risk Triage:** Map technical vulnerabilities to risk levels (Low, Medium, High) and business impact.
-   **Align with Frameworks:** Connect findings to industry standards like CIS Controls, NIST CSF, and PCI DSS.
-   **Draft Executive Reports:** Communicate technical risks to management using non-technical, business-focused language.
-   **Quantify Risk:** Perform quantitative risk analysis (SLE, ALE) to assess financial impact.
-   **Develop Risk Treatment Plans:** Formulate strategies to Mitigate, Transfer, Accept, or Avoid identified risks.
-   **Map Controls:** Align technical vulnerabilities with relevant security controls (e.g., NIST 800-53).
-   **Integrate BIA:** Understand and articulate the business impact of technical failures.

## Required Resources

-   **Linux System:** Ubuntu 20.04 or later (Kali Linux recommended for pre-installed tools).
-   **Target System:** Metasploitable 2 (Virtual Machine or accessible IP).
-   **Tools:** Nmap, Nikto, Nuclei, `xsltproc`.
-   **Documentation:** Access to CIS Controls and NIST CSF documentation.

---

## Lab Tasks

### Phase 1: Information Gathering & Service Discovery

**Objective:** Identify open ports and services on the target system to determine the attack surface.

**Instructions:**

1.  **Create a working directory:**
    ```bash
    mkdir -p ~/grc-lab-week1/task1
    cd ~/grc-lab-week1/task1
    ```

2.  **Perform an initial Nmap scan:**
    Run a comprehensive scan to identify services, versions, and default scripts.
    ```bash
    nmap -sV -sC -oA initial_scan <TARGET_IP>
    ```
    *This generates three files: `initial_scan.nmap`, `initial_scan.gnmap`, and `initial_scan.xml`.*

3.  **Generate an HTML report:**
    Use `xsltproc` to convert the XML output into a readable HTML format for reporting.
    ```bash
    xsltproc -o initial_scan_report.html /usr/share/nmap/nmap.xsl initial_scan.xml
    ```

**GRC Reflection Question:**
> Why is knowing which ports are open (e.g., 21/FTP, 23/Telnet) a compliance issue? (Hint: Think about unnecessary services, attack surface reduction, and compliance with **CIS Control 9** and **NIST CSF PR.IP-1**).

---

### Phase 2: Vulnerability Identification

**Objective:** Use automated tools to identify specific vulnerabilities and misconfigurations.

**Step 1: Analyzing Nmap Output**
Review `initial_scan.nmap` and the HTML report. Identify:
-   Service versions (e.g., `vsftpd 2.3.4`).
-   Interesting script outputs (e.g., SSH host keys, HTTP headers).
-   *Note every service and its version for further analysis.*

**Step 2: Web Application Assessment**
Scan the web server for common vulnerabilities using Nikto.
```bash
nikto -h http://<TARGET_IP> -o nikto_scan.txt
```
*Action:* Open `http://<TARGET_IP>` in a browser and explore any applications (e.g., PHP, TWiki). Manually inspect for obvious issues like default pages or verbose errors.

**GRC Context:** Web applications are high-risk vectors. This aligns with **OWASP Top 10** and **PCI DSS Requirement 6**.

**Step 3: Focused Vulnerability Scanning**
Use Nuclei to scan for known vulnerabilities based on identified services.
```bash
# For web applications
nuclei -u http://<TARGET_IP> -o nuclei_web_scan.txt

# For all services
nuclei -target <TARGET_IP> -o nuclei_full_scan.txt
```
*Review:* Nuclei output often includes CVE references and severity scores—crucial evidence for risk assessment.

---

### Phase 3: Analysis and Reporting (The Core GRC Task)

**Objective:** Translate technical findings into a business-focused risk assessment.

**Step 1: Triage and Risk Assessment Table**
Create a table summarizing your key findings. Use the following criteria for Inherent Risk:
-   **High (H):** Easy to exploit, leads to full system compromise.
-   **Medium (M):** Requires some skill, leads to data leakage.
-   **Low (L):** Information disclosure, low impact.

| Finding | Affected Service | CVE/Reference | Inherent Risk (L/M/H) | Compliance Violation | Business Impact |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Weak Default Credentials | SSH, FTP | N/A | H | CIS 5.2, NIST CSF PR.AC-1 | Unauthorized access, data theft |
| vsFTPd 2.3.4 Backdoor | FTP | CVE-2011-2523 | H | CIS 7.1 (Patch Mgmt) | Full system compromise |
| Unencrypted Telnet Service | Telnet | N/A | H | NIST CSF PR.DS-2 | Credential sniffing, espionage |
| *[Add more findings]* | ... | ... | ... | ... | ... |

**Step 2: Drafting the Executive Summary**
Write a concise summary for management using non-technical language focused on risk and action.

**Template:**
> **To:** IT Management  
> **From:** GRC Audit Team  
> **Date:** [Date]  
> **Subject:** High-Risk Findings on Development Server 'metasploitable'
>
> **1. Executive Summary:**  
> A vulnerability assessment of the internal server revealed multiple critical security vulnerabilities that pose an immediate and high risk to the organization's information assets. The system is non-compliant with several key organizational policies based on the CIS Controls.
>
> **2. Key Findings & Risks:**  
> - **Critical Risk - Remote System Compromise:** The FTP service contains a known backdoor (CVE-2011-2523) allowing attackers to gain full control without authentication. This violates our patch management policy (CIS Control 7.1).
> - **High Risk - Data Interception:** Services (Telnet, FTP) transmit credentials in plaintext, violating data protection standards (NIST CSF PR.DS-2) and risking credential theft.
> - **High Risk - Weak Authentication:** Default and weak passwords are in use, increasing the risk of unauthorized access (CIS 5.2).
>
> **3. Recommended Actions:**  
> 1. **Immediate Isolation:** Remove the server from the network until remediated.  
> 2. **Remediate:** Apply security patches, especially for vsFTPd.  
> 3. **Harden:** Disable unnecessary services (Telnet, Rlogin); enforce strong passwords.  
> 4. **Process Review:** Reinforce procedures for deploying systems according to security baselines.

---

## Assessment Criteria

| Criterion | Weight | Description |
| :--- | :--- | :--- |
| **Technical Accuracy** | 25% | Correctness of scan execution and technical analysis. |
| **Completeness** | 20% | All tasks completed with required deliverables. |
| **Documentation Quality** | 20% | Clear, professional documentation and reporting. |
| **Critical Thinking** | 20% | Depth of analysis and alignment with GRC frameworks. |
| **Professional Presentation** | 15% | Organization, formatting, and clarity of the executive summary. |

## Deliverables

Submit the following:
1.  **Nmap output files** (`initial_scan.nmap`, `initial_scan.xml`).
2.  **Screenshot of the Nmap HTML report** (`initial_scan_report.html`).
3.  **Nikto and Nuclei scan outputs**.
4.  **Completed Risk Assessment Table**.
5.  **Executive Summary**.
6.  **Quantitative Risk Analysis Table** (SLE, ALE).
7.  **Risk Treatment Strategy Table**.
8.  **NIST 800-53 Control Mapping Table**.
9.  **Business Impact Analysis (BIA) Table**.

---

**Lab Conclusion:**
You have successfully progressed from technical scanning to risk analysis—a critical competency for GRC professionals. Remember, the value lies not in running tools but in interpreting results to drive business-focused risk decisions.

**Lab Created:** December 2025  
**Version:** 1.0

---

### Phase 4: Advanced GRC Analysis - Quantitative Risk & Treatment

**Objective:** Quantify the financial impact of identified risks and propose strategic risk treatment plans.

**Step 1: Quantitative Risk Calculation (SLE & ALE)**
For the top 3-5 critical risks identified in Phase 3, perform a quantitative analysis to determine their financial impact.

**Instructions:**
1.  **Identify Asset Value (AV):** Assign a realistic monetary value to the affected asset for each critical risk (e.g., data breach cost, system downtime cost).
2.  **Estimate Exposure Factor (EF):** Determine the percentage of asset value lost if a specific threat materializes (e.g., 0.5 for 50% loss).
3.  **Calculate Single Loss Expectancy (SLE):**
    `SLE = Asset Value (AV) × Exposure Factor (EF)`
4.  **Estimate Annualized Rate of Occurrence (ARO):** Determine how many times a specific threat is expected to occur in a year (e.g., 0.5 for once every two years, 2 for twice a year).
5.  **Calculate Annualized Loss Expectancy (ALE):**
    `ALE = Single Loss Expectancy (SLE) × Annualized Rate of Occurrence (ARO)`

**Action:** Create a table to document your calculations for each of the top critical risks. Include AV, EF, SLE, ARO, and ALE.

| Risk ID | Asset Name | Threat Description | AV | EF | SLE | ARO | ALE |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| R1 | Customer Database | SQL Injection Attack | $5,000,000 | 0.4 | $2,000,000 | 0.5 | $1,000,000 |
| ... | ... | ... | ... | ... | ... | ... | ... | ... |

**Step 2: Risk Treatment Strategy**
For each of the top critical risks, propose a risk treatment strategy (Mitigate, Transfer, Accept, or Avoid) and justify your choice.

**Instructions:**
1.  **Mitigate:** Implement controls to reduce the likelihood or impact of the risk.
2.  **Transfer:** Shift the risk to a third party (e.g., insurance).
3.  **Accept:** Acknowledge the risk and its potential impact, and take no action.
4.  **Avoid:** Eliminate the risk by discontinuing the activity that causes it.

**Action:** Extend your risk assessment table to include a 'Proposed Treatment' column and a brief 'Justification'.

| Risk ID | ... | ALE | Proposed Treatment | Justification |
| :--- | :--- | :--- | :--- | :--- |
| R1 | ... | $1,000,000 | Mitigate | Implement WAF, input validation, and regular security audits to reduce likelihood and impact. |
| ... | ... | ... | ... | ... |

**Step 3: Control Mapping (NIST 800-53)**
For each risk you chose to **Mitigate**, identify at least two relevant security controls from the NIST SP 800-53 catalog that would help address the vulnerability.

**Action:** Create a new table mapping mitigated risks to specific NIST 800-53 controls.

| Risk ID | Threat Description | Proposed Control | NIST 800-53 Control ID | Control Description |
| :--- | :--- | :--- | :--- | :--- |
| R1 | SQL Injection Attack | Web Application Firewall (WAF) | AC-4, SC-7 | Information Flow Enforcement, Boundary Protection |
| R1 | SQL Injection Attack | Input Validation | SI-10 | Information Input Validation |
| ... | ... | ... | ... | ... |

---

### Phase 5: Business Impact Analysis (BIA) Integration & Final Reporting

**Objective:** Understand the broader business impact of technical failures and refine executive communication.

**Step 1: Business Impact Analysis (BIA) Integration**
For your top 3-5 critical risks, consider how their materialization would impact key business processes of Go-Green (e.g., order processing, customer support, financial transactions).

**Instructions:**
1.  **Identify Affected Business Processes:** List the primary business functions that would be disrupted.
2.  **Estimate Recovery Time Objective (RTO):** The maximum tolerable downtime for a business function.
3.  **Estimate Recovery Point Objective (RPO):** The maximum tolerable data loss for a business function.
4.  **Assess Financial and Non-Financial Impact:** Consider revenue loss, regulatory fines, reputational damage, customer churn.

**Action:** Create a table summarizing the BIA for each critical risk.

| Risk ID | Threat Description | Affected Business Process | RTO | RPO | Financial Impact (Estimated) | Non-Financial Impact |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| R1 | SQL Injection Attack | Customer Order Processing | 24 hours | 4 hours | $1,000,000/day | Loss of customer trust, regulatory fines |
| ... | ... | ... | ... | ... | ... | ... |

**Step 2: Refined Executive Summary**
Update your Executive Summary from Phase 3, Step 2 to incorporate the quantitative financial impacts (ALE) and the proposed risk treatment strategies. Emphasize the Return on Security Investment (ROSI) if applicable.

**Action:** Rewrite the Executive Summary, ensuring it is concise, business-focused, and clearly articulates the financial implications of risks and the value of proposed controls.
