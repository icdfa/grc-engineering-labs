# Lab 7: Access Control and Identity Management in Action

**Course:** GRC102 - Information Security Governance  
**Week:** 7  
**Duration:** 5 Days (Self-Paced)  
**Level:** Intermediate

---

## Navigating the Identity Crisis at GlobalHealth Connect

Welcome back to GlobalHealth Connect (GHC)! As the **Director of Information Security Governance**, you've successfully laid the groundwork for governance and policy management. This week, your focus shifts to a critical area: **Access Control and Identity Management (IAM)**. GHC's rapid growth and recent acquisitions have unfortunately led to a tangled web of permissions, often referred to as "permission creep." An internal audit recently highlighted several "Ghost Accounts" belonging to former employees and excessive privileges granted to current staff, particularly in our production environments.

This week, you will tackle GHC's "Identity Crisis." You will evaluate different access control models, design role-based access for the development teams, conduct a crucial access rights review, develop a strategy for privileged access management, and streamline the identity lifecycle processes. Your ability to balance stringent security requirements with operational efficiency will be key to your success.

### Your Key Stakeholders (Revisited)

Your decisions in IAM will directly impact every employee and system at GHC, making stakeholder engagement vital.

| Name             | Role | Key Concerns                                       |
|------------------|------|----------------------------------------------------|
| **Sarah Chen**   | CEO  | Operational efficiency, compliance, reputation.    |
| **Marcus Thorne**| CFO  | Risk of fraud, audit findings, cost of compliance. |
| **Elena Rodriguez**| CTO  | Developer productivity, system uptime, "Zero Trust" implementation. |
| **David Miller** | Board| Audit findings, regulatory compliance, risk posture.|

### Learning Objectives

By the end of this lab, you will have tangible experience in:

- Evaluating and recommending appropriate access control models for different business scenarios.
- Designing and implementing Role-Based Access Control (RBAC) structures.
- Conducting effective access rights reviews to identify and remediate excessive privileges and Segregation of Duties (SoD) violations.
- Developing strategies for Privileged Access Management (PAM) to secure critical accounts.
- Streamlining Identity Lifecycle Management (ILM) processes for efficient onboarding, transfers, and offboarding.

---

## Task 1: Access Control Model Design (Day 1)

**Scenario:** GHC is developing a new **Patient Portal** that will allow patients to securely access their health records, schedule appointments, and communicate with their healthcare providers. The Board, particularly David Miller, wants to ensure that the access control model chosen for this critical system is robust, compliant with HIPAA and GDPR, and scalable. He has asked you to evaluate different access control models and recommend the most suitable one for the Patient Portal.

**Your Mission:** Evaluate the three primary access control models—Discretionary Access Control (DAC), Mandatory Access Control (MAC), and Role-Based Access Control (RBAC)—against GHC's requirements for the new Patient Portal. You will then provide a recommendation to the Board.

### Activity: Evaluating Access Control Models

Review the "System Requirement Specification" for the Patient Portal and the definitions of the access control models in Appendix A. Your task is to analyze each model's suitability for the Patient Portal, considering security, compliance, and operational factors.

---

### System Requirement Specification - GHC Patient Portal (Excerpt)

*   **Data Sensitivity:** Handles Protected Health Information (PHI) and Personally Identifiable Information (PII), requiring strict confidentiality and integrity.
*   **User Types:** Patients, Doctors, Nurses, Administrative Staff (each with distinct access needs).
*   **Compliance:** Must comply with HIPAA (US) and GDPR (EU) for data privacy and access.
*   **Scalability:** Expected to support millions of patients and thousands of healthcare providers.
*   **Ease of Use:** Must be intuitive for patients and efficient for healthcare providers.
*   **Least Privilege:** Access should be granted only to the extent necessary to perform a user's job function.
*   **Dynamic Access:** Access needs may change frequently (e.g., a patient's doctor changes, a nurse moves departments).

---

### Access Control Model Evaluation Matrix Template

| Feature/Requirement      | Discretionary Access Control (DAC) | Mandatory Access Control (MAC) | Role-Based Access Control (RBAC) |
|--------------------------|------------------------------------|--------------------------------|----------------------------------|
| **Definition**           | [Brief definition]                 | [Brief definition]             | [Brief definition]               |
| **GHC Suitability (Pros)** | [List advantages for GHC]          | [List advantages for GHC]      | [List advantages for GHC]        |
| **GHC Suitability (Cons)** | [List disadvantages for GHC]       | [List disadvantages for GHC]   | [List disadvantages for GHC]     |
| **HIPAA/GDPR Compliance**| [How well does it support?]        | [How well does it support?]    | [How well does it support?]      |
| **Scalability**          | [How well does it scale?]          | [How well does it scale?]      | [How well does it scale?]        |
| **Ease of Management**   | [How easy is it to manage?]        | [How easy is it to manage?]    | [How easy is it to manage?]      |

---

### Your Deliverables for Task 1

1.  **Completed Access Control Model Evaluation Matrix:** Fill in the matrix above, providing a comprehensive evaluation of DAC, MAC, and RBAC against GHC's Patient Portal requirements.
2.  **Recommendation Report to the Board:** A concise report (1-2 pages) to the GHC Board of Directors recommending the most suitable access control model for the Patient Portal. Your report should:
    *   Clearly state your recommendation.
    *   Justify your choice based on the evaluation matrix, emphasizing security, compliance, and operational benefits.
    *   Briefly explain why the other models are less suitable.
    *   Mention any key considerations or challenges in implementing the recommended model.

**Guidance:**

*   Refer to Appendix A for detailed definitions of each access control model.
*   Focus on how each model addresses the specific requirements of a healthcare patient portal handling sensitive data.

## Task 2: RBAC Implementation (Day 2)

**Scenario:** Following your recommendation, the Board has approved the use of Role-Based Access Control (RBAC) for the new Patient Portal and has asked you to start defining roles for the internal GHC teams that will manage and support it. Elena Rodriguez (CTO) is particularly keen on this, as the current ad-hoc permission granting for her development teams is becoming unmanageable and prone to errors. She wants a clear, structured approach to access.

**Your Mission:** Design a set of roles and their associated permissions for the GHC teams that will interact with the Patient Portal backend and related development environments. This will serve as a blueprint for implementing RBAC.

### Activity: Defining Roles and Permissions

Review the provided "Staff Role Description List" and the "System Permission Matrix" for the GHC Cloud Environment. Your task is to define specific roles (e.g., Junior Dev, Senior Dev, DevOps, QA) and map them to the necessary permissions, adhering to the principle of least privilege.

---

### Staff Role Description List (GHC Development & Operations)

*   **Junior Developer:** Primarily writes and tests code in development environments. Needs read access to production code, but no write access. Limited access to sensitive data.
*   **Senior Developer:** Designs, writes, and reviews code. Needs write access to development and staging environments. May need temporary, elevated access to production for troubleshooting under strict supervision.
*   **DevOps Engineer:** Manages deployment pipelines, infrastructure, and monitoring. Needs extensive access to deployment tools, configuration management, and production environments. Should not have direct access to patient data in production.
*   **Quality Assurance (QA) Engineer:** Tests software functionality and performance. Needs read access to development and staging environments. May need to create test data but should not access real patient data.
*   **Database Administrator (DBA):** Manages all databases, including production. Needs full access to database schemas and data, but only for administrative tasks. Access to PHI should be logged and audited.

---

### System Permission Matrix (GHC Cloud Environment - Simplified)

| Permission Category | Specific Permission         | Description                                          |
|---------------------|-----------------------------|------------------------------------------------------|
| **Code Repository** | `repo:read`                 | Read access to source code                           |
|                     | `repo:write`                | Write access to source code (commit, push)           |
|                     | `repo:admin`                | Manage repository settings, branches                 |
| **Deployment**      | `deploy:dev`                | Deploy to development environment                    |
|                     | `deploy:staging`            | Deploy to staging environment                        |
|                     | `deploy:prod`               | Deploy to production environment                     |
| **Database**        | `db:read_schema`            | Read database schema                                 |
|                     | `db:write_schema`           | Modify database schema                               |
|                     | `db:read_data`              | Read data from database (includes PHI)               |
|                     | `db:write_data`             | Write/modify data in database (includes PHI)         |
| **Infrastructure**  | `infra:monitor`             | View infrastructure metrics, logs                    |
|                     | `infra:manage_vm`           | Start/stop/configure virtual machines                |
|                     | `infra:manage_network`      | Configure network settings, firewalls                |
| **Application**     | `app:config_read`           | Read application configuration                       |
|                     | `app:config_write`          | Modify application configuration                     |
|                     | `app:log_read`              | Read application logs                                |

---

### Your Deliverables for Task 2

1.  **RBAC Role Definition Table:** Create a table defining the roles for GHC Development & Operations teams. For each role, list the specific permissions from the "System Permission Matrix" that should be assigned. Adhere strictly to the principle of least privilege.

    | Role                  | Description                                       | Assigned Permissions (from System Permission Matrix) |
    |-----------------------|---------------------------------------------------|------------------------------------------------------|
    | **Junior Developer**  | [Brief description]                               | [List permissions]                                   |
    | **Senior Developer**  | [Brief description]                               | [List permissions]                                   |
    | **DevOps Engineer**   | [Brief description]                               | [List permissions]                                   |
    | **QA Engineer**       | [Brief description]                               | [List permissions]                                   |
    | **Database Administrator** | [Brief description]                               | [List permissions]                                   |

2.  **Justification for Role Design:** A brief explanation (1-2 paragraphs) of how your RBAC design adheres to the principle of least privilege and addresses Elena Rodriguez's concerns about managing developer access efficiently.

**Guidance:**

*   Think about the minimum access each role needs to perform its duties.
*   Consider the separation of duties where appropriate (e.g., a developer should not typically have direct production deployment and database write access).

## Task 3: Access Rights Review (Day 3)

**Scenario:** Marcus Thorne (CFO) has reminded you that GHC is due for its quarterly access review. He specifically mentioned the internal audit findings from last week, which highlighted "Ghost Accounts" and potential "permission creep." He wants a thorough review of current user permissions to ensure that access aligns with job functions and that no excessive privileges or Segregation of Duties (SoD) violations exist. "We need to clean up this mess before the external auditors arrive," he stressed.

**Your Mission:** Conduct an access rights review based on a provided "User Access Export." Identify any users with excessive privileges, potential SoD violations, or accounts that appear to be inactive or unauthorized. Based on your findings, propose a remediation plan.

### Activity: Auditing User Access

Review the "User Access Export" data. Your task is to analyze each user's access, paying close attention to their assigned roles, permissions, and last login dates. Identify any discrepancies or security risks.

---

### User Access Export (GHC Systems - Excerpt)

| User ID     | Employee Name   | Department        | Assigned Roles                                   | Key Permissions Granted (Beyond Base) | Last Login Date |
|-------------|-----------------|-------------------|--------------------------------------------------|---------------------------------------|-----------------|
| JSMITH      | John Smith      | IT Operations     | IT Manager, System Admin                         | `deploy:prod`, `db:write_data`        | 2026-02-28      |
| JDOE        | Jane Doe        | Development       | Senior Developer                                 | `repo:admin`, `deploy:prod`           | 2026-02-27      |
| MTHORNE     | Marcus Thorne   | Finance           | CFO, Finance Manager                             | `db:read_data` (all), `app:config_write` | 2026-02-29      |
| EWHITE      | Emily White     | Finance           | Data Analyst                                     | `db:read_data` (all)                  | 2026-02-26      |
| RGREEN      | Robert Green    | HR                | HR Manager                                       | `db:read_data` (HR), `app:config_write` | 2026-02-28      |
| GHOSTACC1   | (Unknown)       | (Former Employee) | System Admin                                     | `deploy:prod`, `db:write_data`        | 2025-08-15      |
| GHOSTACC2   | (Unknown)       | (Former Employee) | Development Lead                                 | `repo:write`, `deploy:staging`        | 2025-09-01      |
| BROWNR      | Bob Brown       | Development       | Junior Developer                                 | `deploy:prod`                         | 2026-02-25      |
| LCHEN       | Lisa Chen       | QA                | QA Engineer                                      | `db:write_data`                       | 2026-02-27      |

---

### Your Deliverables for Task 3

1.  **Access Review Findings Report:** A report detailing your findings from the "User Access Export." For each identified issue (e.g., excessive privilege, SoD violation, inactive account), clearly state:
    *   **User ID:**
    *   **Issue Type:** (e.g., Excessive Privilege, SoD Violation, Inactive Account)
    *   **Description of Finding:** (Explain why it's an issue)
    *   **Risk Implication:** (What is the potential impact to GHC?)
2.  **Access Revocation/Modification List:** A clear list of recommended actions to remediate the identified issues. For each action, specify:
    *   **User ID:**
    *   **Action:** (e.g., Revoke `deploy:prod`, Remove `db:write_data`, Disable Account)
    *   **Justification:** (Why is this action necessary?)

**Guidance:**

*   Refer to Appendix B for a simplified Segregation of Duties (SoD) matrix to help identify potential conflicts.
*   Consider the principle of least privilege: users should only have the minimum access required for their job function.
*   Accounts with no recent login activity, especially for former employees, are high-priority for review.

## Task 4: Privileged Access Management (PAM) (Day 4)

**Scenario:** A recent "near-miss" incident involved a shared administrative password for a critical database. While no data was compromised, the lack of accountability and audit trail for privileged access has raised serious concerns with Marcus Thorne (CFO) and David Miller (Board Member). Elena Rodriguez (CTO) is also pushing for a more secure way to manage administrative access, especially for her DevOps team, without hindering their ability to respond to incidents quickly. She suggests exploring "Just-in-Time" access.

**Your Mission:** Design a **Privileged Access Management (PAM) Strategy** for GlobalHealth Connect. This strategy should outline how GHC will secure, monitor, and control access to its most critical systems and data, addressing the concerns about shared accounts and the need for accountability.

### Activity: Developing a PAM Strategy

Review the "Incident Investigation Memo" regarding the shared administrative account. Your task is to outline a comprehensive PAM strategy using the "Privileged Access Management Strategy Template." Consider how to implement principles like Just-in-Time (JIT) access, session recording, and mandatory Multi-Factor Authentication (MFA) for privileged users.

---

### Incident Investigation Memo - Shared Admin Account (Excerpt)

**Incident ID:** IR-2026-03-002
**Date Reported:** March 1, 2026
**Reported By:** IT Operations
**Description:** During routine log review, an anomaly was detected: multiple users logged into the production database server using a single, shared `db_admin` account. Investigation revealed that this account was being used by several IT and DevOps personnel for emergency troubleshooting. There is no individual accountability for actions performed under this shared account, and no clear process for its use.
**Potential Impact:** Unauthorized data modification, data exfiltration, compliance violations, inability to audit actions.
**Recommendation:** Implement a robust Privileged Access Management (PAM) solution to eliminate shared accounts and enforce individual accountability.

---

### Privileged Access Management (PAM) Strategy Template

```markdown
# GlobalHealth Connect Privileged Access Management (PAM) Strategy

## 1. Purpose
[State the purpose of this strategy – to secure, manage, and monitor privileged access to GHC's critical systems and data.]

## 2. Scope
[Define what this strategy applies to (e.g., all privileged accounts, administrators, critical systems, and sensitive data).]

## 3. Key Principles
[Outline the core principles guiding GHC's PAM approach (e.g., Least Privilege, Just-in-Time Access, Session Monitoring, Accountability).]

## 4. PAM Components

### 4.1 Privileged Account Discovery and Management
[Describe how privileged accounts will be identified, onboarded, and managed (e.g., password vaulting, rotation).]

### 4.2 Session Management and Monitoring
[Outline how privileged sessions will be recorded, monitored, and audited to ensure accountability.]

### 4.3 Just-in-Time (JIT) Access
[Explain the process for granting temporary, time-limited privileged access based on specific requests and approvals.]

### 4.4 Multi-Factor Authentication (MFA) for Privileged Access
[Specify mandatory MFA requirements for all privileged access attempts.]

### 4.5 Least Privilege Enforcement
[Describe how the principle of least privilege will be applied to privileged accounts and tasks.]

## 5. Roles and Responsibilities
[Define responsibilities for PAM implementation, operation, and oversight.]

## 6. Compliance and Reporting
[Outline how PAM will support compliance requirements and how privileged access activities will be reported.]

## 7. Review and Updates
[Specify how and when this strategy will be reviewed and updated.]

---

**Effective Date:** [Date]
**Review Date:** [Date]
**Approved By:** [Name/Title]
```

---

### Your Deliverables for Task 4

1.  **Completed GHC Privileged Access Management (PAM) Strategy:** A fully drafted strategy document, using the template provided, tailored to GlobalHealth Connect, and addressing the shared account incident and the need for enhanced privileged access controls.
2.  **Briefing Note to Elena Rodriguez (CTO):** A short briefing note (1-2 paragraphs) explaining how the proposed PAM strategy will enhance security while supporting the DevOps team's need for efficient, on-demand access, specifically highlighting the benefits of Just-in-Time access and session monitoring.
## Task 5: Identity Lifecycle Management (Day 5)

**Scenario:** The HR department has approached you with concerns about the current identity management processes. Robert Green, the HR Manager, states, "Our onboarding process is manual and slow, leading to delays in new hires getting access. And when someone leaves, we often find their accounts are still active weeks later. This is a huge security risk and a compliance nightmare." He wants a streamlined, automated process for managing identities from "hire to retire."

**Your Mission:** Design a formal **Identity Lifecycle Management (ILM) Procedure** for GlobalHealth Connect. This procedure should cover the entire lifecycle of an identity, from provisioning (Joiner) to access changes (Mover) and deprovisioning (Leaver), ensuring efficiency, security, and compliance.

### Activity: Streamlining the Identity Lifecycle

Review the "Current JML Workflow Diagram" which highlights the current manual and error-prone processes. Your task is to design a new, improved ILM procedure using the "Identity Lifecycle Management Procedure Template." Focus on automation, clear responsibilities, and timely access changes.

---

### Current JML Workflow Diagram (Simplified - Showing Gaps)

```mermaid
graph TD
    A[New Hire Notification (HR)] --> B{Manual Account Creation (IT)};
    B --> C{Manual Access Granting (IT/Manager)};
    C --> D[New Employee Starts];

    E[Employee Transfers (HR)] --> F{Manual Access Review (Manager)};
    F --> G{Manual Access Changes (IT)};

    H[Employee Termination (HR)] --> I{Manual Account Disablement (IT)};
    I --> J{Manual Access Revocation (IT)};
    J --> K[Audit Log Review (Security - Infrequent)];

    style B fill:#f9f,stroke:#333,stroke-width:2px
    style C fill:#f9f,stroke:#333,stroke-width:2px
    style F fill:#f9f,stroke:#333,stroke-width:2px
    style G fill:#f9f,stroke:#333,stroke-width:2px
    style I fill:#f9f,stroke:#333,stroke-width:2px
    style J fill:#f9f,stroke:#333,stroke-width:2px
    style K fill:#f9f,stroke:#333,stroke-width:2px

    subgraph Current State (Manual & Error-Prone)
        B -- X Lack of Automation --> C
        F -- X Delays & Inconsistencies --> G
        I -- X Risk of Orphaned Accounts --> J
    end
```

---

### Identity Lifecycle Management Procedure Template

```markdown
# GlobalHealth Connect Identity Lifecycle Management (ILM) Procedure

## 1. Purpose
[State the purpose of this procedure – to define a standardized and efficient process for managing user identities and access throughout their tenure at GHC.]

## 2. Scope
[Define who and what this procedure applies to (e.g., all GHC employees, contractors, and their associated digital identities and access privileges).]

## 3. Identity Lifecycle Stages

### 3.1 Joiner (Onboarding)
[Describe the automated and manual steps for provisioning new user accounts and initial access based on their role. Include HR, IT, and Manager responsibilities.]

### 3.2 Mover (Role Change/Transfer)
[Outline the process for adjusting access privileges when an employee changes roles or departments. Emphasize timely removal of old access and granting of new access.]

### 3.3 Leaver (Offboarding)
[Detail the critical steps for deprovisioning user accounts and revoking all access upon an employee's departure. Include timelines and verification steps.]

## 4. Automation and Integration
[Describe how automation (e.g., HRIS integration, Identity Governance & Administration (IGA) tools) will be leveraged to streamline these processes.]

## 5. Roles and Responsibilities
[Clearly define the roles and responsibilities of HR, IT, Managers, and Security in each stage of the ILM.]

## 6. Audit and Review
[Specify how the ILM process itself will be audited and reviewed for effectiveness and compliance.]

## 7. Review and Updates
[Specify how and when this procedure will be reviewed and updated.]

---

**Effective Date:** [Date]
**Review Date:** [Date]
**Approved By:** [Name/Title]
```

---

### Your Deliverables for Task 5

1.  **Completed GHC Identity Lifecycle Management (ILM) Procedure:** A fully drafted procedure document, using the template provided, that outlines a streamlined and secure ILM process for GHC.
2.  **Briefing Note to Robert Green (HR Manager):** A short briefing note (1-2 paragraphs) explaining how the new ILM procedure will address his concerns about manual processes, delays, and security risks, highlighting the benefits of automation and clear responsibilities.

---

## Submission Requirements

Upon completion of all tasks, please submit a single Markdown file (`Interactive_Lab_GRC102_W7_Submission_[YourName].md`) containing all your deliverables. Ensure your submission is well-organized, clearly labeled, and professionally presented. Your submission should include:

*   Your completed Access Control Model Evaluation Matrix (Task 1)
*   Your Recommendation Report to the Board (Task 1)
*   Your RBAC Role Definition Table (Task 2)
*   Your Justification for Role Design (Task 2)
*   Your Access Review Findings Report (Task 3)
*   Your Access Revocation/Modification List (Task 3)
*   Your completed GHC Privileged Access Management (PAM) Strategy (Task 4)
*   Your Briefing Note to Elena Rodriguez (CTO) (Task 4)
*   Your completed GHC Identity Lifecycle Management (ILM) Procedure (Task 5)
*   Your Briefing Note to Robert Green (HR Manager) (Task 5)

**Note:** You do not need to create separate files for each deliverable; embed them directly into your single Markdown submission file. Use clear headings and formatting to distinguish between tasks and deliverables.

---

## Assessment Criteria

Your lab will be assessed on:

| Criterion               | Weight | Description                                                              |
|-------------------------|--------|--------------------------------------------------------------------------|
| **Completeness**        | 20%    | All tasks completed with required deliverables.                          |
| **Clarity & Coherence** | 25%    | Clear, logical flow of ideas; easy to understand.                        |
| **Strategic Alignment** | 20%    | Deliverables align with GHC's business context and stakeholder concerns. |
| **Critical Thinking**   | 20%    | Depth of analysis, justification of decisions, and practical solutions.  |
| **Professionalism**     | 15%    | Organization, formatting, grammar, and overall presentation.             |

---

## Resources

*   **GHC Company Profile & Context:** (Refer to Lab 5 for background)
*   **Regulatory Context:** (HIPAA, GDPR - general knowledge required; specific details embedded in scenario)
*   **Glossary of Governance Terms:** (Students encouraged to research as needed)

---

**Lab Created:** March 2026
**Last Updated:** March 2026
**Author:** Aminu Idris, AMCPN
**Version:** 2.0 (Interactive Scenario Edition)

---

## Appendix A: GHC Access Control Definitions

To ensure a common understanding of access control at GlobalHealth Connect, we define the following models:

*   **Discretionary Access Control (DAC):** The owner of a resource (e.g., a file or folder) can grant or revoke access to other users at their discretion. This model offers high flexibility but can lead to inconsistent security and difficulty in managing access at scale.
*   **Mandatory Access Control (MAC):** Access decisions are made based on security labels assigned to subjects (users) and objects (resources). A central authority defines and enforces these labels, ensuring a high level of security and consistency, often used in highly sensitive environments (e.g., military, government).
*   **Role-Based Access Control (RBAC):** Access is granted based on a user's assigned role within the organization. Roles are defined by job function, and permissions are assigned to roles, not directly to users. Users inherit permissions from their roles. This model offers a good balance of security, manageability, and scalability for most enterprises.

## Appendix B: Segregation of Duties (SoD) Matrix (Simplified)

Segregation of Duties (SoD) is a key internal control that prevents a single individual from having too much control over a process, thereby reducing the risk of fraud or error. A simplified SoD matrix for GHC might look like this:

| Activity 1 \ Activity 2 | Create User Account | Approve Access Request | Perform System Backup | Deploy to Production | Process Financial Transaction |
|-------------------------|---------------------|------------------------|-----------------------|----------------------|-------------------------------|
| **Create User Account**   |                     | Conflict               |                       |                      |                               |
| **Approve Access Request**| Conflict            |                        |                       |                      |                               |
| **Perform System Backup** |                     |                        |                       | Conflict             |                               |
| **Deploy to Production**  |                     |                        | Conflict              |                      |                               |
| **Process Financial Transaction** |                     |                        |                       |                      | Conflict                      |

*   **Conflict:** Indicates a potential SoD violation if a single user can perform both activities.

## Appendix C: Identity Lifecycle Checklist (Key Stages)

This checklist provides a high-level overview of key activities within each stage of the Identity Lifecycle:

### Joiner (Onboarding)
*   HR initiates new hire request.
*   Manager defines required role(s) and initial access.
*   Automated account creation in core systems (e.g., Active Directory, HRIS).
*   Initial access provisioning based on role.
*   Security awareness training assigned.

### Mover (Role Change/Transfer)
*   HR/Manager initiates role change request.
*   Review of existing access for old role.
*   Automated deprovisioning of old role access.
*   Automated provisioning of new role access.
*   Manager review and approval of new access.

### Leaver (Offboarding)
*   HR initiates termination request with effective date.
*   Immediate disablement of all accounts on effective date.
*   Revocation of all access privileges.
*   Data preservation/transfer as per policy.
*   Final audit log review.
