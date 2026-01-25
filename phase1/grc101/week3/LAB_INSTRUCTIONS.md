# Lab 3: Risk Assessment and Compliance Fundamentals

**Course:** GRC101 - Introduction to GRC & Technical Landscape  
**Week:** 3  
**Duration:** 5 Days (Approx. 8-10 hours total)  
**Level:** Beginner to Intermediate  
**Prerequisites:** Basic proficiency with Microsoft Office Suite (Word and Excel).

## 1. Lab Overview

This laboratory exercise is designed to provide trainees with practical experience in the fundamental principles of **Information Security Risk Management**. Using a provided dataset, participants will execute a structured risk assessment process, including qualitative and quantitative analysis, risk prioritization, and the formulation of treatment strategies. The entire exercise will be conducted using standard business productivity tools (Microsoft Excel and Word), simulating a common corporate environment.

## 2. Learning Objectives

Upon successful completion of this lab, the trainee will be able to:

*   **Define** core risk management terminology, including Threat, Vulnerability, Impact, and Likelihood.
*   **Perform** a qualitative risk assessment by calculating and interpreting risk scores using a standard risk matrix.
*   **Conduct** a basic quantitative risk assessment by calculating the Annualized Loss Expectancy (ALE).
*   **Prioritize** organizational risks based on calculated scores and business impact.
*   **Formulate** and justify appropriate risk treatment strategies (Reduce, Transfer, Accept, Avoid).
*   **Document** all findings in a professional Risk Register (Excel) and a formal Lab Report (Word).

## 3. Required Resources

*   Windows Operating System
*   Microsoft Word (or equivalent word processor)
*   Microsoft Excel (or equivalent spreadsheet software)
*   The provided Risk Dataset (Section 4).

## 4. Risk Dataset

The following data represents a snapshot of an organization's current risk landscape. This data must be copied into your Excel Risk Register for analysis.

| Risk ID | Risk Description | Asset Affected | Threat Category | Vulnerability | Probability (1-5) | Impact (1-5) | Risk Score | Financial Impact (SLE) | Current Controls | Treatment Strategy | Owner | Status |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| R001 | Ransomware Attack | Customer Database | Cyber Attack | Unpatched Systems | 3 | 4 | 12 | $5,000,000 | Backup, Antivirus | Reduce | IT Manager | Active |
| R002 | Insider Threat | Financial Records | Internal | Excessive Access | 2 | 4 | 8 | $2,000,000 | Access Controls | Reduce | Security Manager | Active |
| R003 | Phishing Attack | User Credentials | Social Engineering | User Awareness | 4 | 2 | 8 | $500,000 | Email Filter | Reduce | Security Manager | Active |
| R004 | System Failure | Email System | Technical | Single Point of Failure | 3 | 3 | 9 | $1,000,000 | Redundancy | Reduce | IT Manager | Active |
| R005 | Data Breach | Customer Data | Cyber Attack | Weak Encryption | 2 | 5 | 10 | $10,000,000 | Encryption | Reduce | CISO | Active |
| R006 | Compliance Violation | All Systems | Regulatory | Lack of Controls | 2 | 3 | 6 | $500,000 | Policies | Reduce | Compliance Officer | Active |
| R007 | Third-party Failure | Cloud Services | Vendor | Vendor Risk | 2 | 3 | 6 | $1,000,000 | SLA, Contracts | Transfer | Procurement | Active |

---

## 5. Standard Risk Matrix Reference

The following matrix defines the qualitative prioritization scale used in this lab.

| Score Range | Priority Level | Required Action |
| :---: | :---: | :---: |
| **12 - 25** | **Critical** | Immediate action required; executive-level visibility. |
| **8 - 11** | **High** | Action required within 30-90 days; senior management review. |
| **4 - 7** | **Medium** | Action required within 90-180 days; operational management review. |
| **1 - 3** | **Low** | Monitor and review periodically; no immediate action required. |

---

## 6. Lab Tasks (Step-by-Step Procedure)

### Task 0: Environment Setup and Documentation

1.  **Create Project Folder:** On your desktop, create a new folder named `GRC_Lab_Week3_[YourName]`.
2.  **Initialize Risk Register (Excel):**
    *   Open **Microsoft Excel** and create a new blank workbook.
    *   Copy the entire Risk Dataset (Section 4) and paste it into the first sheet, starting at cell A1.
    *   Save the file as `Risk_Register_Analysis.xlsx` inside your project folder.
3.  **Initialize Lab Report (Word):**
    *   Open **Microsoft Word** and create a new document.
    *   Include a professional title page with the Lab Name, Course, Date, and your Name.
    *   Save the file as `Lab_Report_Week3.docx` inside your project folder.

### Task 1: Qualitative Risk Assessment and Prioritization

**Objective:** Verify the initial risk scores and apply the standard risk matrix to assign a formal Priority Level.

1.  **Verify Risk Score Calculation:**
    *   In your `Risk_Register_Analysis.xlsx`, ensure the **Risk Score** column is calculated using the formula: **Risk Score = Probability (Likelihood) × Impact**.
    *   In the first data row (e.g., cell H2), enter the formula to multiply the corresponding cells (e.g., `=F2*G2`). Apply this formula to all rows.
2.  **Assign Priority Level:**
    *   Add a new column next to **Risk Score** titled **Priority Level**.
    *   Using the **Standard Risk Matrix Reference** (Section 5), manually or using an Excel `IF` function, assign the appropriate Priority Level (Critical, High, Medium, Low) to each risk based on its calculated Risk Score.
3.  **Document Findings (Word):**
    *   In your `Lab_Report_Week3.docx`, create a section titled **Task 1: Qualitative Risk Assessment**.
    *   **Analysis:** Discuss the relationship between Likelihood, Impact, and the resulting Risk Score.
    *   **Prioritization:** Identify the **top three Critical/High risks** and justify their prioritization based on the matrix and the nature of the risk (e.g., high financial impact, regulatory exposure).
    *   **Evidence:** Insert a clear **screenshot** of your Excel sheet showing the Risk ID, Probability, Impact, Risk Score, and the newly assigned Priority Level columns.

### Task 2: Quantitative Risk Assessment (ALE)

**Objective:** Calculate the Annualized Loss Expectancy (ALE) to quantify the financial exposure of each risk.

1.  **Define and Add ARO:**
    *   **Annual Rate of Occurrence (ARO)** is the estimated frequency of a risk event occurring per year.
    *   Insert a new column in your Excel sheet titled **ARO**.
    *   Enter the following assumed ARO values for each risk:
        *   R001: 0.2 (Once every 5 years)
        *   R002: 0.5 (Once every 2 years)
        *   R003: 1.0 (Once per year)
        *   R004: 0.25 (Once every 4 years)
        *   R005: 0.1 (Once every 10 years)
        *   R006: 0.5 (Once every 2 years)
        *   R007: 0.2 (Once every 5 years)
2.  **Calculate ALE:**
    *   **Single Loss Expectancy (SLE)** is the financial impact of a single risk event, which is provided in the **Financial Impact** column.
    *   **Annualized Loss Expectancy (ALE)** is the expected monetary loss for an asset due to a risk over a one-year period.
    *   Add a new column titled **ALE**.
    *   Calculate ALE using the formula: **ALE = SLE × ARO**.
    *   In the first data row, enter the formula to multiply the corresponding **Financial Impact (SLE)** and **ARO** cells. Apply this formula to all rows.
3.  **Document Findings (Word):**
    *   In your `Lab_Report_Week3.docx`, create a section titled **Task 2: Quantitative Risk Assessment (ALE)**.
    *   **Definitions:** Provide a formal definition for SLE, ARO, and ALE.
    *   **Analysis:** Identify the risk with the **highest ALE**. Explain what this value means to the organization in terms of financial planning and budget allocation for security controls.
    *   **Evidence:** Insert a clear **screenshot** of your Excel sheet showing the Risk ID, Financial Impact (SLE), ARO, and the calculated ALE columns.

### Task 3: Risk Treatment Strategy Analysis

**Objective:** Analyze the effectiveness of current controls and evaluate the appropriateness of the proposed treatment strategies.

1.  **Analyze Treatment Rationale:**
    *   Review the four main risk treatment options: **Reduce** (mitigate), **Transfer** (share/insure), **Accept** (tolerate), and **Avoid** (eliminate).
    *   Add a new column in your Excel sheet titled **Treatment Rationale**.
    *   For each risk, write a brief rationale (1-2 sentences) in this new column, justifying whether the proposed **Treatment Strategy** is appropriate given the **Current Controls** and the risk's **Priority Level**.
        *   *Example Rationale for R001 (Reduce):* "The strategy is appropriate as Backup and Antivirus are direct mitigating controls that reduce the likelihood and impact of a ransomware event."
        *   *Example Rationale for R007 (Transfer):* "The strategy is appropriate as SLAs and contracts legally transfer some of the financial and operational risk to the third-party vendor."
2.  **Propose Alternative Strategy:**
    *   Identify **one risk** where you believe the current **Treatment Strategy** is **insufficient** or **incorrect** based on your analysis.
    *   Add a final column titled **Proposed Alternative Strategy**.
    *   For the identified risk, propose a different treatment strategy (e.g., change from Reduce to Accept, or vice-versa) and briefly justify your choice.
3.  **Document Findings (Word):**
    *   In your `Lab_Report_Week3.docx`, create a section titled **Task 3: Risk Treatment Strategy Analysis**.
    *   **Evaluation:** Discuss the relationship between **Current Controls** and the **Treatment Strategy**.
    *   **Recommendation:** Detail your proposed alternative strategy from step 2, providing a clear justification for why your alternative is superior to the current plan.
    *   **Evidence:** Insert a clear **screenshot** of your Excel sheet showing the Risk ID, Current Controls, Treatment Strategy, Treatment Rationale, and Proposed Alternative Strategy columns.

---

## 7. Assessment Criteria

Your submission will be assessed based on the following criteria:

| Criterion | Weight | Description |
| :---: | :---: | :---: |
| **Technical Accuracy** | 30% | Correct calculation of Risk Scores and ALE; accurate application of the Risk Matrix. |
| **Analysis and Justification** | 35% | Depth of analysis in the Word report, clarity of rationale for treatment strategies, and justification for the proposed alternative. |
| **Documentation Quality** | 25% | Professional formatting of the Word report, clear and correctly labeled screenshots, and logical organization of the Excel Risk Register. |
| **Completeness** | 10% | All tasks and required deliverables are present and complete. |

## 8. Submission Requirements

1.  **Lab Report (`Lab_Report_Week3.docx`):** The final professional Word document containing the title page, all three task sections, and all required analysis and screenshots.
2.  **Risk Register (`Risk_Register_Analysis.xlsx`):** The completed Excel file with all new columns (Priority Level, ARO, ALE, Treatment Rationale, Proposed Alternative Strategy).
3.  **File Organization:** Both files must be saved within the single project folder: `GRC_Lab_Week3_[YourName]`.
4.  **Final Submission:** Compress the entire project folder into a single ZIP file for submission.

**End of Lab Instructions**
