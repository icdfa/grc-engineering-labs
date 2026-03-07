# Lab 2: Developing Security Policies and Procedures

**Course:** GRC102 - Information Security Governance  
**Week:** 2  
**Duration:** 5 Days (Self-Paced)  
**Level:** Intermediate

---

## Scenario: The Policy Overhaul at NexusTech Solutions

Welcome to NexusTech Solutions, a rapidly growing mid-sized software development company specializing in cloud-based enterprise resource planning (ERP) systems. NexusTech has recently experienced significant growth, expanding its workforce from 50 to 250 employees and acquiring several high-profile clients in the financial and healthcare sectors.

As the newly appointed **Information Security Manager**, you have discovered that NexusTech's security documentation is severely lacking. The company currently relies on a single, outdated "IT Rules" document created five years ago. This document mixes high-level goals with specific technical configurations and vague suggestions, leading to confusion, inconsistent security practices, and compliance gaps.

The executive team, led by CEO Marcus Vance, has tasked you with establishing a formal, structured, and comprehensive information security policy framework. Your mission is to build this framework from the ground up, following the Security Policy Development Lifecycle, to ensure NexusTech can meet its new compliance obligations (ISO 27001 and SOC 2) and protect its growing information assets.

### Learning Objectives

By the end of this lab, you will have practical experience in:

- Structuring a Security Policy Hierarchy (Policies, Standards, Guidelines, Procedures).
- Applying the Security Policy Development Lifecycle.
- Writing clear, concise, and enforceable security policies.
- Developing actionable security procedures.
- Designing mechanisms for policy implementation, enforcement, and review.

---

## Task 1: Establishing the Security Policy Hierarchy (Day 1)

**Scenario:** The IT Director, Sarah Jenkins, is confused about the difference between a policy and a procedure. She recently drafted a document titled "Password Policy" that includes step-by-step instructions on how to reset a password in Active Directory. You need to clarify the hierarchy and ensure all future documentation is correctly categorized.

**Your Mission:** Define the Security Policy Hierarchy for NexusTech Solutions and categorize a list of existing draft statements into the correct tiers.

### Activity: Defining and Categorizing

Review the concepts of Policies, Standards, Guidelines, and Procedures from your Week 2 course material.

---

### Documentation Brainstorming List (from various departments)

1.  "All NexusTech employees must use multi-factor authentication (MFA) when accessing the corporate network remotely."
2.  "To configure MFA on your mobile device, download the Authenticator app, scan the QR code provided in the IT portal, and enter the 6-digit verification code."
3.  "It is recommended that developers use parameterized queries to prevent SQL injection vulnerabilities."
4.  "NexusTech is committed to protecting the confidentiality, integrity, and availability of all client data."
5.  "All corporate laptops must have full-disk encryption enabled using BitLocker (Windows) or FileVault (macOS)."
6.  "Employees should avoid connecting to public, unsecured Wi-Fi networks when traveling."
7.  "In the event of a suspected security breach, employees must immediately contact the IT Helpdesk at extension 5555."
8.  "Passwords must be a minimum of 14 characters in length and contain at least one uppercase letter, one lowercase letter, one number, and one special character."

---

### Your Deliverables for Task 1

1.  **Hierarchy Definition Table:** Create a table defining Policies, Standards, Guidelines, and Procedures. For each, include its purpose, characteristics (e.g., mandatory vs. recommended, broad vs. specific), and the typical approval authority.
2.  **Categorization Exercise:** For each of the 8 statements in the "Documentation Brainstorming List," identify its correct classification (Policy, Standard, Guideline, or Procedure) and provide a one-sentence justification based on your definitions.

## Task 2: Writing an Effective Security Policy (Day 2)

**Scenario:** NexusTech currently has no formal rules regarding the use of company-provided devices or acceptable behavior on the corporate network. Several employees have been found downloading unauthorized software and using company laptops for extensive personal use, increasing the risk of malware infections.

**Your Mission:** Draft a comprehensive **Acceptable Use Policy (AUP)** for NexusTech Solutions, following the best practices for policy writing outlined in the Week 2 material.

### Activity: Drafting the Policy

Use the "Acceptable Use Policy Template" below to draft the policy. Ensure you focus on *what* is required, not *how* it is implemented, and use clear, simple language.

---

### Acceptable Use Policy (AUP) Template

```markdown
# NexusTech Solutions Acceptable Use Policy

## 1. Policy Title and Version Control
**Title:** Acceptable Use Policy
**Version:** 1.0
**Date:** [Current Date]

## 2. Purpose
[Write a brief statement explaining why this policy exists (e.g., to protect information assets, ensure appropriate use of resources).]

## 3. Scope
[Define who and what this policy applies to (e.g., all employees, contractors, all NexusTech IT resources).]

## 4. Policy Statements
[Draft 3-5 clear, concise, and enforceable policy statements covering:
- General acceptable use of company devices.
- Prohibited activities (e.g., unauthorized software, illegal content).
- Expectations regarding personal use of company resources.]

## 5. Roles and Responsibilities
[Define who is responsible for adhering to the policy (Users) and who is responsible for enforcing it (IT/Security/HR).]

## 6. Compliance and Enforcement
[State the consequences of non-compliance with this policy.]

## 7. Approval Information
**Approved By:** Marcus Vance, CEO
**Approval Date:** [Current Date]
```

---

### Your Deliverables for Task 2

1.  **Completed Acceptable Use Policy:** A fully drafted AUP document using the provided template, demonstrating the best practices of policy writing (clear language, concise, focus on "what").

## Task 3: Creating Actionable Security Procedures (Day 3)

**Scenario:** The new Acceptable Use Policy states that "All access to NexusTech systems must be formally requested, approved, and provisioned." However, the IT Helpdesk currently provisions accounts based on informal emails or Slack messages, leading to inconsistent access levels and unauthorized access.

**Your Mission:** Develop a detailed, step-by-step **User Access Request Procedure** to operationalize the policy requirement.

### Activity: Procedure Development

Review the characteristics of effective procedures (Action-Oriented, Sequential, Specific). Draft a procedure that a Helpdesk technician can follow consistently.

---

### User Access Request Procedure Template

```markdown
# NexusTech Solutions User Access Request Procedure

## 1. Purpose
[State the purpose of this procedure.]

## 2. Scope
[Define when this procedure is used.]

## 3. Prerequisites
[List any requirements before starting the procedure (e.g., access to the IT ticketing system, Active Directory admin rights).]

## 4. Procedure Steps
[Write detailed, sequential, action-oriented steps for provisioning a new user account. Include:
- Step 1: Receiving the request (How should it be submitted?)
- Step 2: Verifying approval (Who needs to approve it?)
- Step 3: Creating the account (High-level action)
- Step 4: Assigning permissions (Based on role)
- Step 5: Notifying the user/manager
- Step 6: Documenting the action (Closing the ticket)]

## 5. Exceptions
[Briefly describe what to do if a step cannot be completed or if an emergency request is made.]
```

---

### Your Deliverables for Task 3

1.  **Completed User Access Request Procedure:** A fully drafted procedure document using the provided template, demonstrating clear, sequential, and action-oriented instructions.

## Task 4: Policy Implementation and Communication (Day 4)

**Scenario:** You have successfully drafted the new Acceptable Use Policy and the User Access Request Procedure. They have been formally approved by the CEO. Now, you need to ensure the organization actually adopts them. Simply emailing a PDF to the company is not sufficient.

**Your Mission:** Develop a **Communication and Training Plan** for the rollout of the new Acceptable Use Policy.

### Activity: Planning the Rollout

Review the "Policy Implementation and Communication" section of the Week 2 material. Design a plan that ensures awareness and understanding across different employee groups.

---

### Your Deliverables for Task 4

1.  **Communication and Training Plan:** Create a structured plan (can be a table or bulleted list) that includes:
    *   **Target Audiences:** Identify at least two distinct groups (e.g., General Employees, IT Staff, Management).
    *   **Key Messages:** What are the most important takeaways for each group?
    *   **Communication Channels:** How will you deliver the message (e.g., All-hands meeting, email, intranet, mandatory training module)?
    *   **Timeline:** A brief schedule of when these communications will occur (e.g., Week 1: Announcement, Week 2: Training rollout).
    *   **Acknowledgment Mechanism:** How will you track that employees have read and understood the policy?

## Task 5: Policy Review and Maintenance (Day 5)

**Scenario:** Fast forward one year. NexusTech has implemented the new policy framework. However, the company has recently migrated its primary database to a new cloud provider (AWS), and there was a minor security incident where an employee accidentally shared a sensitive document via a personal cloud storage account.

**Your Mission:** Outline the process for reviewing and updating the Acceptable Use Policy based on these new developments.

### Activity: The Review Process

Review the "Policy Review and Maintenance" section of the Week 2 material. Determine how the recent events trigger a review and what that review should entail.

---

### Your Deliverables for Task 5

1.  **Policy Review Memo:** Write a brief memo (2-3 paragraphs) to the Information Security Steering Committee addressing the following:
    *   **Triggers for Review:** Identify the specific events (from the scenario) that necessitate a review of the AUP.
    *   **Review Process:** Outline the steps you will take to review the policy (e.g., gathering stakeholder feedback, risk analysis regarding the new cloud provider and the recent incident).
    *   **Proposed Updates:** Suggest at least one specific area of the AUP that likely needs to be updated or strengthened based on the recent incident.

---

## Submission Requirements

Upon completion of all tasks, please submit a single Markdown file (`Interactive_Lab_GRC102_W2_Submission_[YourName].md`) containing all your deliverables. Ensure your submission is well-organized, clearly labeled, and professionally presented. Your submission should include:

*   Your Hierarchy Definition Table and Categorization Exercise (Task 1)
*   Your completed Acceptable Use Policy (Task 2)
*   Your completed User Access Request Procedure (Task 3)
*   Your Communication and Training Plan (Task 4)
*   Your Policy Review Memo (Task 5)

**Note:** You do not need to create separate files for each deliverable; embed them directly into your single Markdown submission file. Use clear headings and formatting to distinguish between tasks and deliverables.

---

## Assessment Criteria

Your lab will be assessed on:

| Criterion               | Weight | Description                                                              |
|-------------------------|--------|--------------------------------------------------------------------------|
| **Completeness**        | 20%    | All tasks completed with required deliverables.                          |
| **Clarity & Coherence** | 25%    | Clear, logical flow of ideas; easy to understand.                        |
| **Conceptual Accuracy** | 25%    | Accurate application of Week 2 concepts (Hierarchy, Lifecycle, Best Practices). |
| **Practical Application**| 15%    | Deliverables are realistic, actionable, and suitable for the scenario.   |
| **Professionalism**     | 15%    | Organization, formatting, grammar, and overall presentation.             |

---

**Lab Created:** March 2026
**Last Updated:** March 2026
**Author:** Aminu Idris, AMCPN
**Version:** 3.0 (NexusTech Scenario Edition)
