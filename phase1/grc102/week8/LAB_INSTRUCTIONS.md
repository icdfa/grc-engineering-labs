# ICDFA GRC102: Information Security Governance
## Week 5 Linux Lab Assignment: Simulating and Analyzing Security Governance Scenarios

### Overview

This lab provides hands-on experience in simulating, analyzing, and addressing security governance scenarios in a Linux environment. You will set up a simulated environment to recreate conditions from real-world security governance case studies, implement governance controls, and develop monitoring and reporting mechanisms.

### Learning Objectives

By completing this lab, you will be able to:
- Simulate security governance scenarios in a controlled Linux environment
- Analyze security logs and events to identify governance failures
- Implement security governance controls based on case study lessons
- Develop security metrics and reporting mechanisms
- Create a security governance dashboard for executive reporting
- Apply lessons from case studies to practical security governance implementation

### Lab Environment

- Ubuntu Linux 20.04 LTS server
- SSH access to the lab environment
- Root or sudo access for configuration
- Required packages: Docker, Python3, rsyslog, auditd, fail2ban, nginx, MySQL

### Instructions

This lab consists of four parts. Complete all parts and document your work according to the submission guidelines.

### Part 1: Setting Up a Simulated Environment (30 points)

In this part, you will set up a simulated environment that recreates conditions similar to those in the Equifax data breach case study, where a known vulnerability in Apache Struts went unpatched.

**Tasks:**

1. Create a Docker-based environment with multiple containers:
   ```bash
   # Create a directory for the lab
   mkdir -p ~/security_governance_lab
   cd ~/security_governance_lab
   
   # Create a Docker network for the lab
   docker network create secgov_network
   
   # Create a docker-compose.yml file
   cat > docker-compose.yml << 'EOF'
   version: '3'
   
   services:
     web:
       image: vulhub/struts2:s2-045
       container_name: web_server
       ports:
         - "8080:8080"
       networks:
         - secgov_network
     
     database:
       image: mysql:5.7
       container_name: database_server
       environment:
         MYSQL_ROOT_PASSWORD: password
         MYSQL_DATABASE: customer_data
         MYSQL_USER: app_user
         MYSQL_PASSWORD: app_password
       volumes:
         - ./database_init:/docker-entrypoint-initdb.d
       networks:
         - secgov_network
     
     monitoring:
       image: ubuntu:20.04
       container_name: monitoring_server
       volumes:
         - ./monitoring:/monitoring
       command: tail -f /dev/null
       networks:
         - secgov_network
   
   networks:
     secgov_network:
       external: true
   EOF
   
   # Create database initialization script
   mkdir -p database_init
   cat > database_init/init.sql << 'EOF'
   USE customer_data;
   
   CREATE TABLE customers (
     id INT AUTO_INCREMENT PRIMARY KEY,
     first_name VARCHAR(50),
     last_name VARCHAR(50),
     ssn VARCHAR(11),
     dob DATE,
     address VARCHAR(100),
     city VARCHAR(50),
     state VARCHAR(2),
     zip VARCHAR(10),
     email VARCHAR(100),
     phone VARCHAR(15),
     credit_card VARCHAR(16)
   );
   
   INSERT INTO customers (first_name, last_name, ssn, dob, address, city, state, zip, email, phone, credit_card)
   VALUES
     ('John', 'Doe', '123-45-6789', '1980-01-15', '123 Main St', 'Anytown', 'CA', '12345', 'john.doe@example.com', '555-123-4567', '4111111111111111'),
     ('Jane', 'Smith', '987-65-4321', '1985-05-20', '456 Oak Ave', 'Somewhere', 'NY', '67890', 'jane.smith@example.com', '555-987-6543', '5555555555554444'),
     ('Bob', 'Johnson', '456-78-9012', '1975-11-30', '789 Pine Rd', 'Nowhere', 'TX', '54321', 'bob.johnson@example.com', '555-456-7890', '3782822463100005');
   EOF
   
   # Create monitoring directory
   mkdir -p monitoring
   
   # Start the containers
   docker-compose up -d
   ```

2. Set up a vulnerability scanning system:
   ```bash
   # Create a vulnerability scanning script
   cat > vulnerability_scanner.py << 'EOF'
   #!/usr/bin/env python3
   
   import os
   import sys
   import json
   import datetime
   import subprocess
   import requests
   
   def check_struts_vulnerability():
       """Check for the Apache Struts vulnerability (S2-045)"""
       target_url = "http://web_server:8080"
       
       try:
           # Try to detect the vulnerability without exploiting it
           headers = {
               "Content-Type": "%{#context['com.opensymphony.xwork2.dispatcher.HttpServletResponse'].addHeader('X-Vulnerable','true')}.multipart/form-data"
           }
           
           response = requests.get(target_url, headers=headers, timeout=5)
           
           if 'X-Vulnerable' in response.headers:
               return {
                   "vulnerable": True,
                   "vulnerability": "Apache Struts2 S2-045 (CVE-2017-5638)",
                   "severity": "Critical",
                   "description": "Remote Code Execution vulnerability in Apache Struts2",
                   "remediation": "Update to Struts 2.3.32 or Struts 2.5.10.1",
                   "reference": "https://nvd.nist.gov/vuln/detail/CVE-2017-5638"
               }
           else:
               return {
                   "vulnerable": False,
                   "vulnerability": "Apache Struts2 S2-045 (CVE-2017-5638)",
                   "severity": "N/A",
                   "description": "System not vulnerable to S2-045",
                   "remediation": "N/A",
                   "reference": "https://nvd.nist.gov/vuln/detail/CVE-2017-5638"
               }
       except Exception as e:
           return {
               "error": str(e),
               "vulnerability": "Apache Struts2 S2-045 (CVE-2017-5638)",
               "severity": "Unknown",
               "description": "Error checking vulnerability",
               "remediation": "Manually verify the system",
               "reference": "https://nvd.nist.gov/vuln/detail/CVE-2017-5638"
           }
   
   def check_mysql_vulnerability():
       """Check for MySQL vulnerabilities"""
       try:
           # Try to connect to MySQL with default credentials
           result = subprocess.run(
               ["docker", "exec", "database_server", "mysql", "-uroot", "-ppassword", "-e", "SELECT VERSION()"],
               capture_output=True,
               text=True
           )
           
           if result.returncode == 0:
               mysql_version = result.stdout.strip().split("\n")[-1]
               
               return {
                   "vulnerable": True,
                   "vulnerability": "MySQL using default credentials",
                   "severity": "High",
                   "description": f"MySQL {mysql_version} accessible with default credentials",
                   "remediation": "Change default credentials and restrict access",
                   "reference": "https://dev.mysql.com/doc/refman/5.7/en/security.html"
               }
           else:
               return {
                   "vulnerable": False,
                   "vulnerability": "MySQL using default credentials",
                   "severity": "N/A",
                   "description": "MySQL not accessible with default credentials",
                   "remediation": "N/A",
                   "reference": "https://dev.mysql.com/doc/refman/5.7/en/security.html"
               }
       except Exception as e:
           return {
               "error": str(e),
               "vulnerability": "MySQL using default credentials",
               "severity": "Unknown",
               "description": "Error checking vulnerability",
               "remediation": "Manually verify the system",
               "reference": "https://dev.mysql.com/doc/refman/5.7/en/security.html"
           }
   
   def check_network_segmentation():
       """Check for network segmentation issues"""
       try:
           # Check if web server can access database directly
           result = subprocess.run(
               ["docker", "exec", "web_server", "wget", "-q", "-O", "-", "http://database_server:3306"],
               capture_output=True,
               text=True
           )
           
           if "DOCTYPE HTML" not in result.stderr:
               return {
                   "vulnerable": True,
                   "vulnerability": "Insufficient network segmentation",
                   "severity": "Medium",
                   "description": "Web server can directly access database server",
                   "remediation": "Implement network segmentation and access controls",
                   "reference": "https://www.cisecurity.org/controls/implement-network-segmentation"
               }
           else:
               return {
                   "vulnerable": False,
                   "vulnerability": "Insufficient network segmentation",
                   "severity": "N/A",
                   "description": "Proper network segmentation in place",
                   "remediation": "N/A",
                   "reference": "https://www.cisecurity.org/controls/implement-network-segmentation"
               }
       except Exception as e:
           return {
               "error": str(e),
               "vulnerability": "Insufficient network segmentation",
               "severity": "Unknown",
               "description": "Error checking vulnerability",
               "remediation": "Manually verify the system",
               "reference": "https://www.cisecurity.org/controls/implement-network-segmentation"
           }
   
   def generate_report(results):
       """Generate a vulnerability report"""
       report = {
           "scan_date": datetime.datetime.now().isoformat(),
           "vulnerabilities": results,
           "summary": {
               "total": len(results),
               "critical": sum(1 for r in results if r.get("severity") == "Critical"),
               "high": sum(1 for r in results if r.get("severity") == "High"),
               "medium": sum(1 for r in results if r.get("severity") == "Medium"),
               "low": sum(1 for r in results if r.get("severity") == "Low"),
               "unknown": sum(1 for r in results if r.get("severity") == "Unknown")
           }
       }
       
       return report
   
   def main():
       # Run vulnerability checks
       results = []
       results.append(check_struts_vulnerability())
       results.append(check_mysql_vulnerability())
       results.append(check_network_segmentation())
       
       # Generate report
       report = generate_report(results)
       
       # Save report to file
       report_file = f"vulnerability_report_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
       with open(report_file, "w") as f:
           json.dump(report, f, indent=2)
       
       # Print summary
       print(f"Vulnerability scan completed. Report saved to {report_file}")
       print(f"Summary: {report['summary']['total']} vulnerabilities found")
       print(f"  Critical: {report['summary']['critical']}")
       print(f"  High: {report['summary']['high']}")
       print(f"  Medium: {report['summary']['medium']}")
       print(f"  Low: {report['summary']['low']}")
       print(f"  Unknown: {report['summary']['unknown']}")
   
   if __name__ == "__main__":
       main()
   EOF
   
   chmod +x vulnerability_scanner.py
   ```

3. Set up a patch management system:
   ```bash
   # Create a patch management script
   cat > patch_management.py << 'EOF'
   #!/usr/bin/env python3
   
   import os
   import sys
   import json
   import datetime
   import subprocess
   import argparse
   
   def get_available_patches():
       """Get a list of available patches"""
       patches = [
           {
               "id": "PATCH-001",
               "name": "Apache Struts2 S2-045 Patch",
               "description": "Fixes CVE-2017-5638 in Apache Struts2",
               "severity": "Critical",
               "affected_system": "web_server",
               "status": "Available"
           },
           {
               "id": "PATCH-002",
               "name": "MySQL Security Configuration",
               "description": "Secures MySQL with proper authentication and access controls",
               "severity": "High",
               "affected_system": "database_server",
               "status": "Available"
           },
           {
               "id": "PATCH-003",
               "name": "Network Segmentation Rules",
               "description": "Implements proper network segmentation between servers",
               "severity": "Medium",
               "affected_system": "all",
               "status": "Available"
           }
       ]
       
       return patches
   
   def apply_patch(patch_id):
       """Apply a specific patch"""
       patches = get_available_patches()
       patch = next((p for p in patches if p["id"] == patch_id), None)
       
       if not patch:
           print(f"Error: Patch {patch_id} not found")
           return False
       
       print(f"Applying patch: {patch['name']} ({patch['id']})")
       print(f"Description: {patch['description']}")
       print(f"Affected system: {patch['affected_system']}")
       
       # Simulate patch application
       if patch_id == "PATCH-001":
           # Simulate patching Struts vulnerability
           print("Simulating Struts patch application...")
           # In a real environment, this would update the vulnerable component
           with open("patch_status.json", "w") as f:
               json.dump({"struts_patched": True}, f)
           print("Struts patch applied successfully")
           return True
       
       elif patch_id == "PATCH-002":
           # Simulate securing MySQL
           print("Simulating MySQL security configuration...")
           # In a real environment, this would update MySQL configuration
           with open("patch_status.json", "w") as f:
               json.dump({"mysql_secured": True}, f)
           print("MySQL security configuration applied successfully")
           return True
       
       elif patch_id == "PATCH-003":
           # Simulate network segmentation
           print("Simulating network segmentation implementation...")
           # In a real environment, this would update network rules
           with open("patch_status.json", "w") as f:
               json.dump({"network_segmented": True}, f)
           print("Network segmentation rules applied successfully")
           return True
       
       else:
           print(f"Error: Unknown patch ID {patch_id}")
           return False
   
   def list_patches():
       """List all available patches"""
       patches = get_available_patches()
       
       print("Available patches:")
       print("-----------------")
       for patch in patches:
           print(f"ID: {patch['id']}")
           print(f"Name: {patch['name']}")
           print(f"Description: {patch['description']}")
           print(f"Severity: {patch['severity']}")
           print(f"Affected System: {patch['affected_system']}")
           print(f"Status: {patch['status']}")
           print()
   
   def main():
       parser = argparse.ArgumentParser(description="Patch Management System")
       parser.add_argument("--list", action="store_true", help="List available patches")
       parser.add_argument("--apply", metavar="PATCH_ID", help="Apply a specific patch")
       
       args = parser.parse_args()
       
       if args.list:
           list_patches()
       elif args.apply:
           apply_patch(args.apply)
       else:
           parser.print_help()
   
   if __name__ == "__main__":
       main()
   EOF
   
   chmod +x patch_management.py
   ```

4. Set up a security governance tracking system:
   ```bash
   # Create a security governance tracking script
   cat > governance_tracker.py << 'EOF'
   #!/usr/bin/env python3
   
   import os
   import sys
   import json
   import datetime
   import argparse
   
   class GovernanceTracker:
       def __init__(self, data_file="governance_data.json"):
           self.data_file = data_file
           self.load_data()
       
       def load_data(self):
           """Load governance data from file"""
           if os.path.exists(self.data_file):
               with open(self.data_file, "r") as f:
                   self.data = json.load(f)
           else:
               # Initialize with default data
               self.data = {
                   "policies": [],
                   "controls": [],
                   "risks": [],
                   "incidents": [],
                   "metrics": [],
                   "audits": []
               }
       
       def save_data(self):
           """Save governance data to file"""
           with open(self.data_file, "w") as f:
               json.dump(self.data, f, indent=2)
       
       def add_policy(self, name, description, owner, approval_date, review_date):
           """Add a security policy"""
           policy = {
               "id": f"POL-{len(self.data['policies']) + 1:03d}",
               "name": name,
               "description": description,
               "owner": owner,
               "approval_date": approval_date,
               "review_date": review_date,
               "status": "Active"
           }
           
           self.data["policies"].append(policy)
           self.save_data()
           return policy["id"]
       
       def add_control(self, name, description, policy_id, owner, implementation_date):
           """Add a security control"""
           control = {
               "id": f"CTL-{len(self.data['controls']) + 1:03d}",
               "name": name,
               "description": description,
               "policy_id": policy_id,
               "owner": owner,
               "implementation_date": implementation_date,
               "status": "Implemented"
           }
           
           self.data["controls"].append(control)
           self.save_data()
           return control["id"]
       
       def add_risk(self, name, description, likelihood, impact, owner, mitigation_plan):
           """Add a security risk"""
           risk_level = self.calculate_risk_level(likelihood, impact)
           
           risk = {
               "id": f"RISK-{len(self.data['risks']) + 1:03d}",
               "name": name,
               "description": description,
               "likelihood": likelihood,
               "impact": impact,
               "risk_level": risk_level,
               "owner": owner,
               "mitigation_plan": mitigation_plan,
               "status": "Open"
           }
           
           self.data["risks"].append(risk)
           self.save_data()
           return risk["id"]
       
       def add_incident(self, name, description, date, severity, affected_systems, root_cause, resolution):
           """Add a security incident"""
           incident = {
               "id": f"INC-{len(self.data['incidents']) + 1:03d}",
               "name": name,
               "description": description,
               "date": date,
               "severity": severity,
               "affected_systems": affected_systems,
               "root_cause": root_cause,
               "resolution": resolution,
               "status": "Closed"
           }
           
           self.data["incidents"].append(incident)
           self.save_data()
           return incident["id"]
       
       def add_metric(self, name, description, target, actual, period, trend):
           """Add a security metric"""
           metric = {
               "id": f"MET-{len(self.data['metrics']) + 1:03d}",
               "name": name,
               "description": description,
               "target": target,
               "actual": actual,
               "period": period,
               "trend": trend,
               "status": "Active"
           }
           
           self.data["metrics"].append(metric)
           self.save_data()
           return metric["id"]
       
       def add_audit(self, name, description, date, auditor, findings, recommendations):
           """Add a security audit"""
           audit = {
               "id": f"AUD-{len(self.data['audits']) + 1:03d}",
               "name": name,
               "description": description,
               "date": date,
               "auditor": auditor,
               "findings": findings,
               "recommendations": recommendations,
               "status": "Completed"
           }
           
           self.data["audits"].append(audit)
           self.save_data()
           return audit["id"]
       
       def calculate_risk_level(self, likelihood, impact):
           """Calculate risk level based on likelihood and impact"""
           risk_matrix = {
               "High": {"High": "Critical", "Medium": "High", "Low": "Medium"},
               "Medium": {"High": "High", "Medium": "Medium", "Low": "Low"},
               "Low": {"High": "Medium", "Medium": "Low", "Low": "Very Low"}
           }
           
           return risk_matrix.get(likelihood, {}).get(impact, "Unknown")
       
       def list_policies(self):
           """List all policies"""
           return self.data["policies"]
       
       def list_controls(self):
           """List all controls"""
           return self.data["controls"]
       
       def list_risks(self):
           """List all risks"""
           return self.data["risks"]
       
       def list_incidents(self):
           """List all incidents"""
           return self.data["incidents"]
       
       def list_metrics(self):
           """List all metrics"""
           return self.data["metrics"]
       
       def list_audits(self):
           """List all audits"""
           return self.data["audits"]
       
       def generate_dashboard(self):
           """Generate a security governance dashboard"""
           dashboard = {
               "generated_date": datetime.datetime.now().isoformat(),
               "summary": {
                   "policies": len(self.data["policies"]),
                   "controls": len(self.data["controls"]),
                   "risks": len(self.data["risks"]),
                   "incidents": len(self.data["incidents"]),
                   "metrics": len(self.data["metrics"]),
                   "audits": len(self.data["audits"])
               },
               "risk_summary": {
                   "critical": sum(1 for r in self.data["risks"] if r["risk_level"] == "Critical"),
                   "high": sum(1 for r in self.data["risks"] if r["risk_level"] == "High"),
                   "medium": sum(1 for r in self.data["risks"] if r["risk_level"] == "Medium"),
                   "low": sum(1 for r in self.data["risks"] if r["risk_level"] == "Low"),
                   "very_low": sum(1 for r in self.data["risks"] if r["risk_level"] == "Very Low")
               },
               "incident_summary": {
                   "critical": sum(1 for i in self.data["incidents"] if i["severity"] == "Critical"),
                   "high": sum(1 for i in self.data["incidents"] if i["severity"] == "High"),
                   "medium": sum(1 for i in self.data["incidents"] if i["severity"] == "Medium"),
                   "low": sum(1 for i in self.data["incidents"] if i["severity"] == "Low")
               },
               "metrics_summary": [
                   {
                       "name": m["name"],
                       "target": m["target"],
                       "actual": m["actual"],
                       "status": "Green" if m["actual"] >= m["target"] else "Red"
                   }
                   for m in self.data["metrics"]
               ]
           }
           
           return dashboard
   
   def main():
       parser = argparse.ArgumentParser(description="Security Governance Tracker")
       parser.add_argument("--add-policy", action="store_true", help="Add a security policy")
       parser.add_argument("--add-control", action="store_true", help="Add a security control")
       parser.add_argument("--add-risk", action="store_true", help="Add a security risk")
       parser.add_argument("--add-incident", action="store_true", help="Add a security incident")
       parser.add_argument("--add-metric", action="store_true", help="Add a security metric")
       parser.add_argument("--add-audit", action="store_true", help="Add a security audit")
       parser.add_argument("--list-policies", action="store_true", help="List all policies")
       parser.add_argument("--list-controls", action="store_true", help="List all controls")
       parser.add_argument("--list-risks", action="store_true", help="List all risks")
       parser.add_argument("--list-incidents", action="store_true", help="List all incidents")
       parser.add_argument("--list-metrics", action="store_true", help="List all metrics")
       parser.add_argument("--list-audits", action="store_true", help="List all audits")
       parser.add_argument("--dashboard", action="store_true", help="Generate a security governance dashboard")
       
       args = parser.parse_args()
       
       tracker = GovernanceTracker()
       
       if args.add_policy:
           name = input("Policy Name: ")
           description = input("Description: ")
           owner = input("Owner: ")
           approval_date = input("Approval Date (YYYY-MM-DD): ")
           review_date = input("Review Date (YYYY-MM-DD): ")
           
           policy_id = tracker.add_policy(name, description, owner, approval_date, review_date)
           print(f"Policy added with ID: {policy_id}")
       
       elif args.add_control:
           name = input("Control Name: ")
           description = input("Description: ")
           policy_id = input("Policy ID: ")
           owner = input("Owner: ")
           implementation_date = input("Implementation Date (YYYY-MM-DD): ")
           
           control_id = tracker.add_control(name, description, policy_id, owner, implementation_date)
           print(f"Control added with ID: {control_id}")
       
       elif args.add_risk:
           name = input("Risk Name: ")
           description = input("Description: ")
           likelihood = input("Likelihood (High/Medium/Low): ")
           impact = input("Impact (High/Medium/Low): ")
           owner = input("Owner: ")
           mitigation_plan = input("Mitigation Plan: ")
           
           risk_id = tracker.add_risk(name, description, likelihood, impact, owner, mitigation_plan)
           print(f"Risk added with ID: {risk_id}")
       
       elif args.add_incident:
           name = input("Incident Name: ")
           description = input("Description: ")
           date = input("Date (YYYY-MM-DD): ")
           severity = input("Severity (Critical/High/Medium/Low): ")
           affected_systems = input("Affected Systems: ")
           root_cause = input("Root Cause: ")
           resolution = input("Resolution: ")
           
           incident_id = tracker.add_incident(name, description, date, severity, affected_systems, root_cause, resolution)
           print(f"Incident added with ID: {incident_id}")
       
       elif args.add_metric:
           name = input("Metric Name: ")
           description = input("Description: ")
           target = float(input("Target Value: "))
           actual = float(input("Actual Value: "))
           period = input("Period (e.g., 'May 2023'): ")
           trend = input("Trend (Improving/Stable/Declining): ")
           
           metric_id = tracker.add_metric(name, description, target, actual, period, trend)
           print(f"Metric added with ID: {metric_id}")
       
       elif args.add_audit:
           name = input("Audit Name: ")
           description = input("Description: ")
           date = input("Date (YYYY-MM-DD): ")
           auditor = input("Auditor: ")
           findings = input("Findings: ")
           recommendations = input("Recommendations: ")
           
           audit_id = tracker.add_audit(name, description, date, auditor, findings, recommendations)
           print(f"Audit added with ID: {audit_id}")
       
       elif args.list_policies:
           policies = tracker.list_policies()
           print(json.dumps(policies, indent=2))
       
       elif args.list_controls:
           controls = tracker.list_controls()
           print(json.dumps(controls, indent=2))
       
       elif args.list_risks:
           risks = tracker.list_risks()
           print(json.dumps(risks, indent=2))
       
       elif args.list_incidents:
           incidents = tracker.list_incidents()
           print(json.dumps(incidents, indent=2))
       
       elif args.list_metrics:
           metrics = tracker.list_metrics()
           print(json.dumps(metrics, indent=2))
       
       elif args.list_audits:
           audits = tracker.list_audits()
           print(json.dumps(audits, indent=2))
       
       elif args.dashboard:
           dashboard = tracker.generate_dashboard()
           print(json.dumps(dashboard, indent=2))
       
       else:
           parser.print_help()
   
   if __name__ == "__main__":
       main()
   EOF
   
   chmod +x governance_tracker.py
   ```

5. Initialize the governance tracker with sample data:
   ```bash
   # Create a script to initialize the governance tracker with sample data
   cat > initialize_governance.py << 'EOF'
   #!/usr/bin/env python3
   
   import os
   import sys
   import json
   import datetime
   from governance_tracker import GovernanceTracker
   
   def initialize_governance_data():
       """Initialize the governance tracker with sample data"""
       tracker = GovernanceTracker()
       
       # Add policies
       patch_policy_id = tracker.add_policy(
           "Patch Management Policy",
           "Policy governing the timely application of security patches",
           "CISO",
           "2023-01-15",
           "2024-01-15"
       )
       
       vuln_policy_id = tracker.add_policy(
           "Vulnerability Management Policy",
           "Policy governing the identification and remediation of security vulnerabilities",
           "Security Director",
           "2023-02-10",
           "2024-02-10"
       )
       
       incident_policy_id = tracker.add_policy(
           "Incident Response Policy",
           "Policy governing the response to security incidents",
           "CISO",
           "2023-03-05",
           "2024-03-05"
       )
       
       # Add controls
       tracker.add_control(
           "Patch Management Process",
           "Process for identifying, testing, and applying security patches",
           patch_policy_id,
           "IT Manager",
           "2023-01-20"
       )
       
       tracker.add_control(
           "Vulnerability Scanning",
           "Regular scanning for security vulnerabilities",
           vuln_policy_id,
           "Security Engineer",
           "2023-02-15"
       )
       
       tracker.add_control(
           "Incident Response Team",
           "Team responsible for responding to security incidents",
           incident_policy_id,
           "Security Director",
           "2023-03-10"
       )
       
       # Add risks
       tracker.add_risk(
           "Unpatched Vulnerabilities",
           "Risk of exploitation due to unpatched vulnerabilities",
           "High",
           "High",
           "Security Engineer",
           "Implement automated patch management system"
       )
       
       tracker.add_risk(
           "Insufficient Network Segmentation",
           "Risk of lateral movement due to insufficient network segmentation",
           "Medium",
           "High",
           "Network Engineer",
           "Implement network segmentation according to least privilege principle"
       )
       
       tracker.add_risk(
           "Weak Authentication",
           "Risk of unauthorized access due to weak authentication",
           "Medium",
           "Medium",
           "Identity Manager",
           "Implement multi-factor authentication"
       )
       
       # Add incidents
       tracker.add_incident(
           "Web Server Compromise",
           "Compromise of web server due to unpatched Struts vulnerability",
           "2023-04-15",
           "High",
           "Web Server",
           "Unpatched Struts vulnerability (CVE-2017-5638)",
           "Patched vulnerability and restored from backup"
       )
       
       # Add metrics
       tracker.add_metric(
           "Patch Compliance",
           "Percentage of systems with all critical patches applied",
           95.0,
           85.0,
           "May 2023",
           "Improving"
       )
       
       tracker.add_metric(
           "Vulnerability Remediation Time",
           "Average time to remediate critical vulnerabilities (days)",
           7.0,
           12.0,
           "May 2023",
           "Declining"
       )
       
       tracker.add_metric(
           "Security Incidents",
           "Number of security incidents in the period",
           0.0,
           1.0,
           "May 2023",
           "Stable"
       )
       
       # Add audits
       tracker.add_audit(
           "Annual Security Audit",
           "Comprehensive audit of security controls",
           "2023-05-01",
           "External Auditor",
           "Several findings related to patch management and network segmentation",
           "Improve patch management process and implement network segmentation"
       )
       
       print("Governance tracker initialized with sample data")
   
   if __name__ == "__main__":
       initialize_governance_data()
   EOF
   
   chmod +x initialize_governance.py
   
   # Run the initialization script
   ./initialize_governance.py
   ```

6. Run the vulnerability scanner to identify issues:
   ```bash
   # Run the vulnerability scanner
   ./vulnerability_scanner.py
   ```

**Deliverables:**
- Screenshots showing the Docker environment setup
- The vulnerability scan report
- The governance tracker dashboard
- A brief explanation (1-2 paragraphs) of how this simulated environment reflects the conditions that led to the Equifax breach

### Part 2: Analyzing Security Governance Failures (25 points)

In this part, you will analyze the simulated environment to identify security governance failures similar to those in the Equifax case study.

**Tasks:**

1. Create a script to simulate an attack on the vulnerable system:
   ```bash
   # Create an attack simulation script
   cat > simulate_attack.py << 'EOF'
   #!/usr/bin/env python3
   
   import os
   import sys
   import json
   import datetime
   import requests
   import subprocess
   import time
   
   def simulate_struts_attack():
       """Simulate an attack on the vulnerable Struts application"""
       target_url = "http://web_server:8080"
       
       print("Simulating attack on vulnerable Struts application...")
       
       # Check if the system is vulnerable
       headers = {
           "Content-Type": "%{#context['com.opensymphony.xwork2.dispatcher.HttpServletResponse'].addHeader('X-Vulnerable','true')}.multipart/form-data"
       }
       
       try:
           response = requests.get(target_url, headers=headers, timeout=5)
           
           if 'X-Vulnerable' in response.headers:
               print("System is vulnerable to Struts S2-045 (CVE-2017-5638)")
               
               # Simulate data exfiltration
               print("Simulating data exfiltration...")
               
               # In a real attack, this would execute commands on the server
               # Here we're just simulating the attack
               
               # Simulate accessing the database
               print("Simulating access to database...")
               time.sleep(2)
               
               # Simulate exfiltrating customer data
               print("Simulating exfiltration of customer data...")
               time.sleep(2)
               
               # Log the attack
               attack_log = {
                   "timestamp": datetime.datetime.now().isoformat(),
                   "attack_type": "Struts S2-045 Exploitation",
                   "target": "web_server",
                   "success": True,
                   "data_accessed": "customer_data database",
                   "records_affected": 3
               }
               
               with open("attack_log.json", "w") as f:
                   json.dump(attack_log, f, indent=2)
               
               print("Attack simulation completed. Log saved to attack_log.json")
               return True
           else:
               print("System is not vulnerable to Struts S2-045 (CVE-2017-5638)")
               return False
       
       except Exception as e:
           print(f"Error simulating attack: {e}")
           return False
   
   def main():
       simulate_struts_attack()
   
   if __name__ == "__main__":
       main()
   EOF
   
   chmod +x simulate_attack.py
   ```

2. Create a script to analyze security logs and identify governance failures:
   ```bash
   # Create a log analysis script
   cat > analyze_governance_failures.py << 'EOF'
   #!/usr/bin/env python3
   
   import os
   import sys
   import json
   import datetime
   
   def load_vulnerability_report():
       """Load the latest vulnerability report"""
       report_files = [f for f in os.listdir(".") if f.startswith("vulnerability_report_") and f.endswith(".json")]
       
       if not report_files:
           print("No vulnerability reports found")
           return None
       
       latest_report = max(report_files)
       
       with open(latest_report, "r") as f:
           return json.load(f)
   
   def load_attack_log():
       """Load the attack log"""
       if not os.path.exists("attack_log.json"):
           print("No attack log found")
           return None
       
       with open("attack_log.json", "r") as f:
           return json.load(f)
   
   def load_governance_data():
       """Load governance data"""
       if not os.path.exists("governance_data.json"):
           print("No governance data found")
           return None
       
       with open("governance_data.json", "r") as f:
           return json.load(f)
   
   def load_patch_status():
       """Load patch status"""
       if not os.path.exists("patch_status.json"):
           return {"struts_patched": False, "mysql_secured": False, "network_segmented": False}
       
       with open("patch_status.json", "r") as f:
           return json.load(f)
   
   def analyze_governance_failures():
       """Analyze security governance failures"""
       vulnerability_report = load_vulnerability_report()
       attack_log = load_attack_log()
       governance_data = load_governance_data()
       patch_status = load_patch_status()
       
       failures = []
       
       # Check for patch management failures
       if vulnerability_report:
           for vuln in vulnerability_report["vulnerabilities"]:
               if vuln.get("vulnerable", False) and vuln.get("severity") in ["Critical", "High"]:
                   failures.append({
                       "category": "Patch Management",
                       "description": f"Unpatched {vuln['vulnerability']} with {vuln['severity']} severity",
                       "impact": "System vulnerable to exploitation",
                       "recommendation": vuln["remediation"]
                   })
       
       # Check for attack success
       if attack_log and attack_log.get("success", False):
           failures.append({
               "category": "Incident Detection",
               "description": f"Successful {attack_log['attack_type']} attack not detected",
               "impact": f"Unauthorized access to {attack_log['data_accessed']}",
               "recommendation": "Implement real-time security monitoring and alerting"
           })
       
       # Check for governance process failures
       if governance_data:
           # Check patch policy implementation
           patch_policies = [p for p in governance_data["policies"] if "patch" in p["name"].lower()]
           if patch_policies and not patch_status.get("struts_patched", False):
               failures.append({
                   "category": "Policy Implementation",
                   "description": "Patch Management Policy not effectively implemented",
                   "impact": "Critical vulnerabilities remain unpatched despite policy",
                   "recommendation": "Improve patch management process and oversight"
               })
           
           # Check vulnerability management
           vuln_policies = [p for p in governance_data["policies"] if "vulnerabilit" in p["name"].lower()]
           if vuln_policies and vulnerability_report and vulnerability_report["summary"]["critical"] > 0:
               failures.append({
                   "category": "Vulnerability Management",
                   "description": "Vulnerability Management Policy not effectively implemented",
                   "impact": "Critical vulnerabilities not remediated in a timely manner",
                   "recommendation": "Improve vulnerability management process and oversight"
               })
           
           # Check metrics effectiveness
           metrics = governance_data.get("metrics", [])
           patch_metrics = [m for m in metrics if "patch" in m["name"].lower()]
           if patch_metrics and not patch_status.get("struts_patched", False):
               failures.append({
                   "category": "Metrics and Measurement",
                   "description": "Security metrics not driving effective remediation",
                   "impact": "Metrics not leading to security improvements",
                   "recommendation": "Implement actionable metrics with clear ownership and accountability"
               })
       
       # Check for network segmentation failures
       if not patch_status.get("network_segmented", False):
           failures.append({
               "category": "Security Architecture",
               "description": "Insufficient network segmentation",
               "impact": "Potential for lateral movement and expanded compromise",
               "recommendation": "Implement network segmentation according to least privilege principle"
           })
       
       # Check for authentication failures
       if not patch_status.get("mysql_secured", False):
           failures.append({
               "category": "Authentication and Access Control",
               "description": "Weak database authentication",
               "impact": "Potential for unauthorized database access",
               "recommendation": "Implement strong authentication and access controls for databases"
           })
       
       return failures
   
   def generate_report(failures):
       """Generate a governance failure analysis report"""
       report = {
           "timestamp": datetime.datetime.now().isoformat(),
           "failures": failures,
           "summary": {
               "total_failures": len(failures),
               "categories": {}
           }
       }
       
       # Count failures by category
       for failure in failures:
           category = failure["category"]
           if category in report["summary"]["categories"]:
               report["summary"]["categories"][category] += 1
           else:
               report["summary"]["categories"][category] = 1
       
       return report
   
   def main():
       failures = analyze_governance_failures()
       report = generate_report(failures)
       
       report_file = f"governance_failure_report_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
       with open(report_file, "w") as f:
           json.dump(report, f, indent=2)
       
       print(f"Governance failure analysis completed. Report saved to {report_file}")
       print(f"Summary: {report['summary']['total_failures']} governance failures identified")
       
       for category, count in report["summary"]["categories"].items():
           print(f"  {category}: {count}")
   
   if __name__ == "__main__":
       main()
   EOF
   
   chmod +x analyze_governance_failures.py
   ```

3. Run the attack simulation:
   ```bash
   # Run the attack simulation
   ./simulate_attack.py
   ```

4. Analyze the governance failures:
   ```bash
   # Run the governance failure analysis
   ./analyze_governance_failures.py
   ```

5. Create a report comparing the simulated environment to the Equifax case study:
   ```bash
   # Create a comparison report
   cat > equifax_comparison.md << 'EOF'
   # Comparison of Simulated Environment to Equifax Data Breach
   
   ## Overview
   
   This report compares the security governance failures identified in our simulated environment to those that contributed to the Equifax data breach in 2017.
   
   ## Key Governance Failures in Equifax Breach
   
   1. **Patch Management Failure**: Equifax failed to patch a known vulnerability in Apache Struts (CVE-2017-5638) for several months after the patch was released.
   
   2. **Security Monitoring Failure**: The breach remained undetected for 76 days, indicating inadequate security monitoring capabilities.
   
   3. **Network Segmentation Failure**: Attackers were able to move laterally within Equifax's network, indicating insufficient network segmentation.
   
   4. **Leadership and Accountability Failure**: There was unclear accountability for security responsibilities and insufficient board oversight.
   
   5. **Policy Implementation Failure**: Security policies were not effectively implemented or enforced.
   
   ## Comparison with Simulated Environment
   
   | Governance Failure | Equifax | Simulated Environment | Similarity |
   |-------------------|---------|------------------------|------------|
   | Patch Management | Failed to patch Apache Struts vulnerability for months | Unpatched Apache Struts vulnerability in web server | High |
   | Security Monitoring | Failed to detect breach for 76 days | No real-time monitoring to detect attack | High |
   | Network Segmentation | Insufficient segmentation allowed lateral movement | Web server can directly access database | High |
   | Authentication | Weak credentials and access controls | Default credentials on database | Medium |
   | Policy Implementation | Policies not effectively implemented | Patch and vulnerability management policies exist but not enforced | High |
   | Metrics and Measurement | Ineffective security metrics | Metrics not driving security improvements | Medium |
   
   ## Lessons Learned
   
   1. **Effective Patch Management is Critical**: Both Equifax and our simulation demonstrate that failing to patch known vulnerabilities can lead to compromise.
   
   2. **Security Monitoring Must Be Effective**: Without effective security monitoring, attacks can go undetected for extended periods.
   
   3. **Network Segmentation Limits Damage**: Proper network segmentation can contain breaches and limit lateral movement.
   
   4. **Policies Require Implementation**: Having security policies is not sufficient; they must be effectively implemented and enforced.
   
   5. **Metrics Must Drive Action**: Security metrics should lead to concrete actions and improvements.
   
   ## Conclusion
   
   The simulated environment successfully recreates many of the security governance failures that contributed to the Equifax data breach. By analyzing these failures, we can better understand the importance of effective security governance and develop strategies to prevent similar incidents in the future.
   EOF
   ```

**Deliverables:**
- The attack simulation log
- The governance failure analysis report
- The comparison report between the simulated environment and the Equifax case study
- A brief explanation (1-2 paragraphs) of the key governance lessons learned from this analysis

### Part 3: Implementing Security Governance Controls (25 points)

In this part, you will implement security governance controls to address the identified failures.

**Tasks:**

1. Create a script to implement security governance controls:
   ```bash
   # Create a governance control implementation script
   cat > implement_governance_controls.py << 'EOF'
   #!/usr/bin/env python3
   
   import os
   import sys
   import json
   import datetime
   import subprocess
   import argparse
   from governance_tracker import GovernanceTracker
   
   def implement_patch_management():
       """Implement improved patch management controls"""
       print("Implementing patch management controls...")
       
       # Apply the Struts patch
       subprocess.run(["./patch_management.py", "--apply", "PATCH-001"], check=True)
       
       # Update governance tracker
       tracker = GovernanceTracker()
       
       # Add improved patch management control
       control_id = tracker.add_control(
           "Automated Patch Management",
           "Automated system for identifying, testing, and applying security patches",
           "POL-001",  # Assuming this is the patch policy ID
           "Security Engineer",
           datetime.datetime.now().strftime("%Y-%m-%d")
       )
       
       # Add patch compliance metric
       metric_id = tracker.add_metric(
           "Critical Patch Compliance",
           "Percentage of systems with critical patches applied within 7 days",
           100.0,
           100.0,  # Now at 100% after applying the patch
           datetime.datetime.now().strftime("%B %Y"),
           "Improved"
       )
       
       print(f"Patch management controls implemented. Control ID: {control_id}, Metric ID: {metric_id}")
       return True
   
   def implement_network_segmentation():
       """Implement network segmentation controls"""
       print("Implementing network segmentation controls...")
       
       # Apply the network segmentation patch
       subprocess.run(["./patch_management.py", "--apply", "PATCH-003"], check=True)
       
       # Update governance tracker
       tracker = GovernanceTracker()
       
       # Add network segmentation control
       control_id = tracker.add_control(
           "Network Segmentation",
           "Implementation of network segmentation according to least privilege principle",
           "POL-001",  # Assuming this is a relevant policy ID
           "Network Engineer",
           datetime.datetime.now().strftime("%Y-%m-%d")
       )
       
       print(f"Network segmentation controls implemented. Control ID: {control_id}")
       return True
   
   def implement_database_security():
       """Implement database security controls"""
       print("Implementing database security controls...")
       
       # Apply the MySQL security patch
       subprocess.run(["./patch_management.py", "--apply", "PATCH-002"], check=True)
       
       # Update governance tracker
       tracker = GovernanceTracker()
       
       # Add database security control
       control_id = tracker.add_control(
           "Database Security",
           "Implementation of strong authentication and access controls for databases",
           "POL-001",  # Assuming this is a relevant policy ID
           "Database Administrator",
           datetime.datetime.now().strftime("%Y-%m-%d")
       )
       
       print(f"Database security controls implemented. Control ID: {control_id}")
       return True
   
   def implement_security_monitoring():
       """Implement security monitoring controls"""
       print("Implementing security monitoring controls...")
       
       # Create a monitoring script
       monitoring_script = """#!/bin/bash
   
   # Security Monitoring Script
   
   # Monitor for suspicious HTTP requests
   grep -i "Content-Type.*multipart/form-data" /var/log/nginx/access.log > /tmp/suspicious_requests.log
   
   # Monitor for database access
   mysql -u root -ppassword -e "SHOW PROCESSLIST" > /tmp/database_access.log
   
   # Check for file changes
   find /var/www -type f -mtime -1 > /tmp/recent_file_changes.log
   
   # Send alerts for suspicious activity
   if [ -s /tmp/suspicious_requests.log ]; then
       echo "ALERT: Suspicious HTTP requests detected" >> /tmp/security_alerts.log
   fi
   
   if grep -q "customer_data" /tmp/database_access.log; then
       echo "ALERT: Access to customer_data database detected" >> /tmp/security_alerts.log
   fi
   
   if [ -s /tmp/recent_file_changes.log ]; then
       echo "ALERT: Recent file changes detected" >> /tmp/security_alerts.log
   fi
   """
       
       with open("monitoring/security_monitor.sh", "w") as f:
           f.write(monitoring_script)
       
       # Make the script executable
       os.chmod("monitoring/security_monitor.sh", 0o755)
       
       # Create a cron job to run the script
       cron_job = "*/5 * * * * /monitoring/security_monitor.sh\n"
       
       with open("monitoring/security_cron", "w") as f:
           f.write(cron_job)
       
       # Update governance tracker
       tracker = GovernanceTracker()
       
       # Add security monitoring control
       control_id = tracker.add_control(
           "Real-time Security Monitoring",
           "Implementation of real-time security monitoring and alerting",
           "POL-001",  # Assuming this is a relevant policy ID
           "Security Engineer",
           datetime.datetime.now().strftime("%Y-%m-%d")
       )
       
       # Add security monitoring metric
       metric_id = tracker.add_metric(
           "Security Monitoring Coverage",
           "Percentage of critical systems covered by security monitoring",
           100.0,
           100.0,  # Now at 100% after implementing monitoring
           datetime.datetime.now().strftime("%B %Y"),
           "Improved"
       )
       
       print(f"Security monitoring controls implemented. Control ID: {control_id}, Metric ID: {metric_id}")
       return True
   
   def implement_governance_oversight():
       """Implement governance oversight controls"""
       print("Implementing governance oversight controls...")
       
       # Create a governance oversight document
       oversight_doc = """# Security Governance Oversight
   
   ## Executive Responsibilities
   
   - CEO: Ultimate responsibility for security governance
   - CISO: Day-to-day responsibility for security program
   - CIO: Responsibility for IT infrastructure security
   - CFO: Responsibility for security budget
   
   ## Board Oversight
   
   - Quarterly security briefings to the board
   - Annual security program review by the board
   - Security committee of the board established
   
   ## Reporting Structure
   
   - CISO reports to CEO with dotted line to CIO
   - Security team reports to CISO
   - Clear escalation paths for security issues
   
   ## Accountability
   
   - Performance metrics tied to security responsibilities
   - Regular security performance reviews
   - Consequences for security failures
   """
       
       with open("governance_oversight.md", "w") as f:
           f.write(oversight_doc)
       
       # Update governance tracker
       tracker = GovernanceTracker()
       
       # Add governance oversight policy
       policy_id = tracker.add_policy(
           "Security Governance Oversight",
           "Policy defining security governance roles, responsibilities, and oversight",
           "CEO",
           datetime.datetime.now().strftime("%Y-%m-%d"),
           (datetime.datetime.now() + datetime.timedelta(days=365)).strftime("%Y-%m-%d")
       )
       
       # Add governance oversight control
       control_id = tracker.add_control(
           "Executive Security Oversight",
           "Implementation of executive and board oversight of security program",
           policy_id,
           "CEO",
           datetime.datetime.now().strftime("%Y-%m-%d")
       )
       
       print(f"Governance oversight controls implemented. Policy ID: {policy_id}, Control ID: {control_id}")
       return True
   
   def verify_controls():
       """Verify that controls have been implemented"""
       print("Verifying security controls...")
       
       # Check patch status
       if os.path.exists("patch_status.json"):
           with open("patch_status.json", "r") as f:
               patch_status = json.load(f)
           
           struts_patched = patch_status.get("struts_patched", False)
           mysql_secured = patch_status.get("mysql_secured", False)
           network_segmented = patch_status.get("network_segmented", False)
           
           print(f"Struts patched: {struts_patched}")
           print(f"MySQL secured: {mysql_secured}")
           print(f"Network segmented: {network_segmented}")
       else:
           print("Patch status not available")
       
       # Check monitoring setup
       if os.path.exists("monitoring/security_monitor.sh"):
           print("Security monitoring script implemented")
       else:
           print("Security monitoring script not implemented")
       
       # Check governance oversight
       if os.path.exists("governance_oversight.md"):
           print("Governance oversight document implemented")
       else:
           print("Governance oversight document not implemented")
       
       # Check governance tracker
       tracker = GovernanceTracker()
       policies = tracker.list_policies()
       controls = tracker.list_controls()
       metrics = tracker.list_metrics()
       
       print(f"Policies: {len(policies)}")
       print(f"Controls: {len(controls)}")
       print(f"Metrics: {len(metrics)}")
       
       # Run vulnerability scan to verify fixes
       subprocess.run(["./vulnerability_scanner.py"], check=True)
       
       return True
   
   def main():
       parser = argparse.ArgumentParser(description="Implement Security Governance Controls")
       parser.add_argument("--all", action="store_true", help="Implement all controls")
       parser.add_argument("--patch", action="store_true", help="Implement patch management controls")
       parser.add_argument("--network", action="store_true", help="Implement network segmentation controls")
       parser.add_argument("--database", action="store_true", help="Implement database security controls")
       parser.add_argument("--monitoring", action="store_true", help="Implement security monitoring controls")
       parser.add_argument("--oversight", action="store_true", help="Implement governance oversight controls")
       parser.add_argument("--verify", action="store_true", help="Verify implemented controls")
       
       args = parser.parse_args()
       
       if args.all or args.patch:
           implement_patch_management()
       
       if args.all or args.network:
           implement_network_segmentation()
       
       if args.all or args.database:
           implement_database_security()
       
       if args.all or args.monitoring:
           implement_security_monitoring()
       
       if args.all or args.oversight:
           implement_governance_oversight()
       
       if args.all or args.verify:
           verify_controls()
   
   if __name__ == "__main__":
       main()
   EOF
   
   chmod +x implement_governance_controls.py
   ```

2. Implement the security governance controls:
   ```bash
   # Implement all security governance controls
   ./implement_governance_controls.py --all
   ```

3. Create a report documenting the implemented controls:
   ```bash
   # Create a control implementation report
   cat > governance_controls_report.md << 'EOF'
   # Security Governance Controls Implementation Report
   
   ## Overview
   
   This report documents the security governance controls implemented to address the failures identified in the simulated environment.
   
   ## Implemented Controls
   
   ### Patch Management Controls
   
   1. **Automated Patch Management**
      - Implemented automated system for identifying, testing, and applying security patches
      - Applied critical patch for Apache Struts vulnerability
      - Established clear ownership and accountability for patch management
   
   2. **Patch Compliance Metrics**
      - Implemented metrics to track patch compliance
      - Set target of 100% compliance for critical patches within 7 days
      - Established regular reporting of patch compliance metrics
   
   ### Network Segmentation Controls
   
   1. **Network Segmentation Implementation**
      - Implemented network segmentation according to least privilege principle
      - Restricted direct access between web server and database server
      - Established network access control lists
   
   ### Database Security Controls
   
   1. **Database Authentication and Access Controls**
      - Implemented strong authentication for database access
      - Removed default credentials
      - Restricted database access to authorized users and applications
   
   ### Security Monitoring Controls
   
   1. **Real-time Security Monitoring**
      - Implemented real-time monitoring for suspicious activities
      - Established automated alerting for security events
      - Created regular security monitoring reports
   
   2. **Security Monitoring Metrics**
      - Implemented metrics to track security monitoring coverage
      - Set target of 100% coverage for critical systems
      - Established regular reporting of security monitoring metrics
   
   ### Governance Oversight Controls
   
   1. **Security Governance Oversight Policy**
      - Established clear roles and responsibilities for security governance
      - Defined executive and board oversight responsibilities
      - Established reporting structure and escalation paths
   
   2. **Executive Security Oversight**
      - Implemented executive and board oversight of security program
      - Established regular security briefings to executives and the board
      - Created accountability mechanisms for security responsibilities
   
   ## Verification Results
   
   The implemented controls have been verified through:
   
   1. **Vulnerability Scanning**
      - Confirmed that critical vulnerabilities have been remediated
      - Verified that security patches have been applied
   
   2. **Control Testing**
      - Tested network segmentation to confirm effectiveness
      - Verified database security controls
      - Confirmed operation of security monitoring
   
   3. **Governance Review**
      - Reviewed governance structure and oversight mechanisms
      - Confirmed implementation of policies and controls
      - Verified metrics and reporting mechanisms
   
   ## Conclusion
   
   The implemented security governance controls address the failures identified in the simulated environment. These controls establish a comprehensive security governance framework that includes:
   
   - Clear roles and responsibilities
   - Effective security processes
   - Appropriate technical controls
   - Meaningful metrics and measurements
   - Executive and board oversight
   
   By implementing these controls, the organization has significantly improved its security posture and reduced the risk of a security breach similar to the Equifax incident.
   EOF
   ```

4. Verify the effectiveness of the implemented controls:
   ```bash
   # Verify the implemented controls
   ./implement_governance_controls.py --verify
   
   # Try to run the attack simulation again to verify it fails
   ./simulate_attack.py
   ```

**Deliverables:**
- The governance control implementation script
- The governance controls report
- Screenshots showing the verification of implemented controls
- A brief explanation (1-2 paragraphs) of how the implemented controls address the governance failures identified in the Equifax case study

### Part 4: Developing Security Governance Metrics and Reporting (20 points)

In this part, you will develop security governance metrics and reporting mechanisms to support ongoing governance oversight.

**Tasks:**

1. Create a script to generate security governance metrics:
   ```bash
   # Create a security governance metrics script
   cat > governance_metrics.py << 'EOF'
   #!/usr/bin/env python3
   
   import os
   import sys
   import json
   import datetime
   import random
   import matplotlib.pyplot as plt
   from governance_tracker import GovernanceTracker
   
   def generate_historical_data():
       """Generate historical data for metrics"""
       # Generate 6 months of historical data
       months = []
       current_month = datetime.datetime.now()
       
       for i in range(6):
           month = current_month - datetime.timedelta(days=30 * i)
           months.insert(0, month.strftime("%b %Y"))
       
       # Generate patch compliance data
       patch_compliance = [random.uniform(70, 85) for _ in range(5)]
       patch_compliance.append(100.0)  # Current month after fixes
       
       # Generate vulnerability remediation data
       vuln_remediation = [random.uniform(10, 15) for _ in range(5)]
       vuln_remediation.append(1.0)  # Current month after fixes
       
       # Generate security incident data
       security_incidents = [random.randint(1, 3) for _ in range(5)]
       security_incidents.append(0)  # Current month after fixes
       
       # Generate security monitoring coverage data
       monitoring_coverage = [random.uniform(60, 80) for _ in range(5)]
       monitoring_coverage.append(100.0)  # Current month after fixes
       
       # Generate policy compliance data
       policy_compliance = [random.uniform(75, 90) for _ in range(5)]
       policy_compliance.append(100.0)  # Current month after fixes
       
       return {
           "months": months,
           "patch_compliance": patch_compliance,
           "vuln_remediation": vuln_remediation,
           "security_incidents": security_incidents,
           "monitoring_coverage": monitoring_coverage,
           "policy_compliance": policy_compliance
       }
   
   def generate_metrics_visualizations(data):
       """Generate visualizations for security governance metrics"""
       months = data["months"]
       
       # Create directory for visualizations
       os.makedirs("metrics_visualizations", exist_ok=True)
       
       # Generate patch compliance chart
       plt.figure(figsize=(10, 6))
       plt.plot(months, data["patch_compliance"], marker='o', linestyle='-', color='#3498db')
       plt.axhline(y=95, color='#2ecc71', linestyle='--', label='Target')
       plt.title('Patch Compliance Trend')
       plt.xlabel('Month')
       plt.ylabel('Compliance (%)')
       plt.ylim(0, 105)
       plt.grid(True, linestyle='--', alpha=0.7)
       plt.legend()
       plt.tight_layout()
       plt.savefig("metrics_visualizations/patch_compliance.png")
       
       # Generate vulnerability remediation chart
       plt.figure(figsize=(10, 6))
       plt.plot(months, data["vuln_remediation"], marker='o', linestyle='-', color='#e74c3c')
       plt.axhline(y=7, color='#2ecc71', linestyle='--', label='Target')
       plt.title('Vulnerability Remediation Time Trend')
       plt.xlabel('Month')
       plt.ylabel('Days to Remediate')
       plt.ylim(0, 20)
       plt.grid(True, linestyle='--', alpha=0.7)
       plt.legend()
       plt.tight_layout()
       plt.savefig("metrics_visualizations/vuln_remediation.png")
       
       # Generate security incidents chart
       plt.figure(figsize=(10, 6))
       plt.bar(months, data["security_incidents"], color='#9b59b6')
       plt.axhline(y=0, color='#2ecc71', linestyle='--', label='Target')
       plt.title('Security Incidents Trend')
       plt.xlabel('Month')
       plt.ylabel('Number of Incidents')
       plt.ylim(0, 5)
       plt.grid(True, linestyle='--', alpha=0.7)
       plt.legend()
       plt.tight_layout()
       plt.savefig("metrics_visualizations/security_incidents.png")
       
       # Generate monitoring coverage chart
       plt.figure(figsize=(10, 6))
       plt.plot(months, data["monitoring_coverage"], marker='o', linestyle='-', color='#f39c12')
       plt.axhline(y=95, color='#2ecc71', linestyle='--', label='Target')
       plt.title('Security Monitoring Coverage Trend')
       plt.xlabel('Month')
       plt.ylabel('Coverage (%)')
       plt.ylim(0, 105)
       plt.grid(True, linestyle='--', alpha=0.7)
       plt.legend()
       plt.tight_layout()
       plt.savefig("metrics_visualizations/monitoring_coverage.png")
       
       # Generate policy compliance chart
       plt.figure(figsize=(10, 6))
       plt.plot(months, data["policy_compliance"], marker='o', linestyle='-', color='#16a085')
       plt.axhline(y=95, color='#2ecc71', linestyle='--', label='Target')
       plt.title('Policy Compliance Trend')
       plt.xlabel('Month')
       plt.ylabel('Compliance (%)')
       plt.ylim(0, 105)
       plt.grid(True, linestyle='--', alpha=0.7)
       plt.legend()
       plt.tight_layout()
       plt.savefig("metrics_visualizations/policy_compliance.png")
       
       return [
           "metrics_visualizations/patch_compliance.png",
           "metrics_visualizations/vuln_remediation.png",
           "metrics_visualizations/security_incidents.png",
           "metrics_visualizations/monitoring_coverage.png",
           "metrics_visualizations/policy_compliance.png"
       ]
   
   def generate_executive_dashboard(data, visualization_files):
       """Generate an executive dashboard for security governance"""
       dashboard_html = f"""<!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>Security Governance Executive Dashboard</title>
       <style>
           body {{
               font-family: Arial, sans-serif;
               margin: 0;
               padding: 20px;
               background-color: #f5f5f5;
           }}
           .dashboard {{
               max-width: 1200px;
               margin: 0 auto;
           }}
           .header {{
               background-color: #2c3e50;
               color: white;
               padding: 20px;
               border-radius: 5px 5px 0 0;
           }}
           .content {{
               display: flex;
               flex-wrap: wrap;
               gap: 20px;
               padding: 20px;
               background-color: white;
               border-radius: 0 0 5px 5px;
           }}
           .card {{
               background-color: white;
               border-radius: 5px;
               box-shadow: 0 2px 5px rgba(0,0,0,0.1);
               padding: 20px;
               flex: 1 1 300px;
           }}
           .card h2 {{
               margin-top: 0;
               color: #2c3e50;
               border-bottom: 1px solid #eee;
               padding-bottom: 10px;
           }}
           .metric {{
               display: flex;
               justify-content: space-between;
               margin-bottom: 10px;
           }}
           .metric-label {{
               font-weight: bold;
           }}
           .metric-value {{
               font-weight: bold;
           }}
           .good {{
               color: #2ecc71;
           }}
           .warning {{
               color: #f39c12;
           }}
           .critical {{
               color: #e74c3c;
           }}
           .chart {{
               margin-top: 20px;
               text-align: center;
           }}
           .chart img {{
               max-width: 100%;
               height: auto;
               border: 1px solid #eee;
               border-radius: 5px;
           }}
           .footer {{
               text-align: center;
               margin-top: 20px;
               color: #777;
           }}
       </style>
   </head>
   <body>
       <div class="dashboard">
           <div class="header">
               <h1>Security Governance Executive Dashboard</h1>
               <p>Generated on: {datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")}</p>
           </div>
           <div class="content">
               <div class="card">
                   <h2>Security Posture Summary</h2>
                   <div class="metric">
                       <span class="metric-label">Overall Security Posture:</span>
                       <span class="metric-value good">Good</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">Patch Compliance:</span>
                       <span class="metric-value good">{data["patch_compliance"][-1]:.1f}%</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">Vulnerability Remediation Time:</span>
                       <span class="metric-value good">{data["vuln_remediation"][-1]:.1f} days</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">Security Incidents (Current Month):</span>
                       <span class="metric-value good">{data["security_incidents"][-1]}</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">Security Monitoring Coverage:</span>
                       <span class="metric-value good">{data["monitoring_coverage"][-1]:.1f}%</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">Policy Compliance:</span>
                       <span class="metric-value good">{data["policy_compliance"][-1]:.1f}%</span>
                   </div>
               </div>
               
               <div class="card">
                   <h2>Risk Summary</h2>
                   <div class="metric">
                       <span class="metric-label">Critical Risks:</span>
                       <span class="metric-value good">0</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">High Risks:</span>
                       <span class="metric-value good">0</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">Medium Risks:</span>
                       <span class="metric-value warning">2</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">Low Risks:</span>
                       <span class="metric-value good">3</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">Risk Acceptance Rate:</span>
                       <span class="metric-value good">0%</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">Average Risk Remediation Time:</span>
                       <span class="metric-value good">5.2 days</span>
                   </div>
               </div>
               
               <div class="card">
                   <h2>Compliance Summary</h2>
                   <div class="metric">
                       <span class="metric-label">Policy Compliance:</span>
                       <span class="metric-value good">{data["policy_compliance"][-1]:.1f}%</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">Control Effectiveness:</span>
                       <span class="metric-value good">95%</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">Audit Findings (Open):</span>
                       <span class="metric-value good">0</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">Regulatory Compliance:</span>
                       <span class="metric-value good">100%</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">Security Training Completion:</span>
                       <span class="metric-value good">98%</span>
                   </div>
                   <div class="metric">
                       <span class="metric-label">Third-Party Risk Assessment:</span>
                       <span class="metric-value good">100%</span>
                   </div>
               </div>
           </div>
           
           <div class="content">
               <div class="card">
                   <h2>Patch Compliance Trend</h2>
                   <div class="chart">
                       <img src="{visualization_files[0]}" alt="Patch Compliance Trend">
                   </div>
               </div>
               
               <div class="card">
                   <h2>Vulnerability Remediation Time Trend</h2>
                   <div class="chart">
                       <img src="{visualization_files[1]}" alt="Vulnerability Remediation Time Trend">
                   </div>
               </div>
           </div>
           
           <div class="content">
               <div class="card">
                   <h2>Security Incidents Trend</h2>
                   <div class="chart">
                       <img src="{visualization_files[2]}" alt="Security Incidents Trend">
                   </div>
               </div>
               
               <div class="card">
                   <h2>Security Monitoring Coverage Trend</h2>
                   <div class="chart">
                       <img src="{visualization_files[3]}" alt="Security Monitoring Coverage Trend">
                   </div>
               </div>
           </div>
           
           <div class="content">
               <div class="card">
                   <h2>Policy Compliance Trend</h2>
                   <div class="chart">
                       <img src="{visualization_files[4]}" alt="Policy Compliance Trend">
                   </div>
               </div>
               
               <div class="card">
                   <h2>Key Recommendations</h2>
                   <ol>
                       <li>Maintain current patch management process to ensure continued compliance</li>
                       <li>Continue monitoring for new vulnerabilities and address them promptly</li>
                       <li>Conduct regular security awareness training for all employees</li>
                       <li>Perform quarterly security assessments to identify new risks</li>
                       <li>Update security policies and procedures annually</li>
                   </ol>
               </div>
           </div>
           
           <div class="footer">
               <p>ICDFA GRC102 - Security Governance Dashboard</p>
           </div>
       </div>
   </body>
   </html>
   """
       
       with open("executive_dashboard.html", "w") as f:
           f.write(dashboard_html)
       
       return "executive_dashboard.html"
   
   def generate_board_report(data, visualization_files):
       """Generate a board-level security governance report"""
       report_md = f"""# Security Governance Board Report
   
   **Date: {datetime.datetime.now().strftime("%Y-%m-%d")}**
   
   ## Executive Summary
   
   This report provides an overview of the organization's security governance posture. The security program has shown significant improvement over the past month, with all key metrics now meeting or exceeding targets.
   
   ## Key Metrics
   
   | Metric | Current | Target | Status |
   |--------|---------|--------|--------|
   | Patch Compliance | {data["patch_compliance"][-1]:.1f}% | 95% | ✅ |
   | Vulnerability Remediation Time | {data["vuln_remediation"][-1]:.1f} days | 7 days | ✅ |
   | Security Incidents | {data["security_incidents"][-1]} | 0 | ✅ |
   | Security Monitoring Coverage | {data["monitoring_coverage"][-1]:.1f}% | 95% | ✅ |
   | Policy Compliance | {data["policy_compliance"][-1]:.1f}% | 95% | ✅ |
   
   ## Risk Summary
   
   The organization's risk posture has improved significantly. There are currently:
   
   - 0 Critical Risks
   - 0 High Risks
   - 2 Medium Risks
   - 3 Low Risks
   
   All identified risks have mitigation plans in place, with no risks accepted above the board-approved threshold.
   
   ## Security Incidents
   
   There were no security incidents in the current reporting period. This represents a significant improvement from previous months and demonstrates the effectiveness of the implemented security controls.
   
   ## Compliance Status
   
   The organization is fully compliant with all applicable regulations and internal policies. Recent improvements in security governance have addressed previous compliance gaps.
   
   ## Security Program Improvements
   
   The following security program improvements have been implemented:
   
   1. **Enhanced Patch Management**: Automated patch management system implemented, with clear roles and responsibilities.
   
   2. **Improved Network Segmentation**: Network segmentation implemented according to least privilege principle.
   
   3. **Strengthened Database Security**: Strong authentication and access controls implemented for databases.
   
   4. **Enhanced Security Monitoring**: Real-time security monitoring and alerting implemented for all critical systems.
   
   5. **Improved Governance Oversight**: Clear security governance structure established with executive and board oversight.
   
   ## Recommendations
   
   1. Continue the current security governance program with regular reviews and updates.
   
   2. Conduct an independent security assessment in the next quarter to validate the effectiveness of implemented controls.
   
   3. Enhance the security awareness program to further strengthen the security culture.
   
   4. Develop a comprehensive third-party risk management program.
   
   5. Implement a security metrics program to track and report on security performance over time.
   
   ## Conclusion
   
   The organization's security governance posture has improved significantly. All key metrics now meet or exceed targets, and there are no critical or high risks. The implemented security controls have proven effective in preventing security incidents.
   
   The security program is now well-positioned to address future security challenges and support the organization's business objectives.
   """
       
       with open("board_report.md", "w") as f:
           f.write(report_md)
       
       return "board_report.md"
   
   def main():
       # Generate historical data
       data = generate_historical_data()
       
       # Generate visualizations
       visualization_files = generate_metrics_visualizations(data)
       
       # Generate executive dashboard
       dashboard_file = generate_executive_dashboard(data, visualization_files)
       
       # Generate board report
       board_report_file = generate_board_report(data, visualization_files)
       
       print(f"Security governance metrics and reporting generated:")
       print(f"- Executive Dashboard: {dashboard_file}")
       print(f"- Board Report: {board_report_file}")
       print(f"- Visualizations: {', '.join(visualization_files)}")
   
   if __name__ == "__main__":
       main()
   EOF
   
   chmod +x governance_metrics.py
   ```

2. Generate security governance metrics and reports:
   ```bash
   # Generate security governance metrics and reports
   ./governance_metrics.py
   ```

3. Create a document explaining the security governance metrics framework:
   ```bash
   # Create a metrics framework document
   cat > governance_metrics_framework.md << 'EOF'
   # Security Governance Metrics Framework
   
   ## Overview
   
   This document outlines the security governance metrics framework implemented to support ongoing governance oversight. The framework provides a structured approach to measuring, monitoring, and reporting on the effectiveness of security governance.
   
   ## Metrics Categories
   
   The framework includes metrics in the following categories:
   
   ### 1. Implementation Metrics
   
   Implementation metrics measure the extent to which security controls are implemented.
   
   - **Patch Compliance**: Percentage of systems with all critical patches applied within the required timeframe.
   - **Security Monitoring Coverage**: Percentage of critical systems covered by security monitoring.
   - **Policy Compliance**: Percentage of policies that are fully implemented and enforced.
   
   ### 2. Effectiveness Metrics
   
   Effectiveness metrics measure how well security controls are performing.
   
   - **Vulnerability Remediation Time**: Average time to remediate critical vulnerabilities.
   - **Security Incidents**: Number of security incidents in the reporting period.
   - **Control Effectiveness**: Percentage of controls that are operating effectively.
   
   ### 3. Efficiency Metrics
   
   Efficiency metrics measure the resources required to implement and maintain security controls.
   
   - **Security Cost per Employee**: Security program cost divided by the number of employees.
   - **Security Staff Ratio**: Number of security staff as a percentage of total IT staff.
   - **Automation Level**: Percentage of security processes that are automated.
   
   ### 4. Impact Metrics
   
   Impact metrics measure the business impact of security events and the security program.
   
   - **Security Incident Cost**: Total cost of security incidents in the reporting period.
   - **Business Disruption**: Hours of business disruption due to security incidents.
   - **Customer Impact**: Number of customers affected by security incidents.
   
   ## Metrics Definition
   
   Each metric in the framework is defined with the following attributes:
   
   - **Name**: Clear, descriptive name for the metric.
   - **Description**: Detailed description of what the metric measures.
   - **Formula**: How the metric is calculated.
   - **Target**: The desired value or range for the metric.
   - **Data Source**: Where the data for the metric comes from.
   - **Frequency**: How often the metric is measured and reported.
   - **Owner**: Who is responsible for the metric.
   - **Audience**: Who receives reports on the metric.
   
   ## Reporting Framework
   
   The metrics are reported through the following mechanisms:
   
   ### 1. Executive Dashboard
   
   The executive dashboard provides a high-level view of security governance for senior executives. It includes:
   
   - Security posture summary
   - Key metrics with status indicators
   - Trend visualizations
   - Risk summary
   - Compliance summary
   - Key recommendations
   
   ### 2. Board Report
   
   The board report provides a comprehensive overview of security governance for the board of directors. It includes:
   
   - Executive summary
   - Key metrics with status
   - Risk summary
   - Security incidents
   - Compliance status
   - Security program improvements
   - Recommendations
   - Conclusion
   
   ### 3. Operational Reports
   
   Operational reports provide detailed information for security and IT teams. They include:
   
   - Detailed metrics
   - Specific findings
   - Action items
   - Technical details
   
   ## Metrics Lifecycle
   
   The metrics framework follows a lifecycle approach:
   
   1. **Define**: Establish metrics based on security objectives and requirements.
   2. **Collect**: Gather data from relevant sources.
   3. **Analyze**: Process and analyze the data to calculate metrics.
   4. **Report**: Present the metrics to appropriate stakeholders.
   5. **Act**: Take action based on the metrics to improve security governance.
   6. **Review**: Regularly review and update the metrics framework.
   
   ## Continuous Improvement
   
   The metrics framework is subject to continuous improvement:
   
   - Regular review of metrics to ensure relevance and effectiveness
   - Addition of new metrics as needed
   - Retirement of metrics that are no longer valuable
   - Adjustment of targets based on changing risk landscape and business requirements
   
   ## Conclusion
   
   This security governance metrics framework provides a comprehensive approach to measuring, monitoring, and reporting on security governance. By implementing this framework, the organization can ensure effective oversight of the security program and drive continuous improvement in security governance.
   EOF
   ```

4. Create a security governance dashboard user guide:
   ```bash
   # Create a dashboard user guide
   cat > dashboard_user_guide.md << 'EOF'
   # Security Governance Dashboard User Guide
   
   ## Overview
   
   This user guide provides instructions for using the Security Governance Dashboard. The dashboard is designed to provide executives and board members with a clear view of the organization's security governance posture.
   
   ## Accessing the Dashboard
   
   The Security Governance Dashboard is available as an HTML file that can be opened in any web browser. To access the dashboard:
   
   1. Open the `executive_dashboard.html` file in a web browser.
   2. The dashboard will load automatically and display the current security governance metrics.
   
   ## Dashboard Sections
   
   The dashboard is organized into the following sections:
   
   ### 1. Security Posture Summary
   
   This section provides a high-level summary of the organization's security posture, including:
   
   - Overall security posture rating
   - Key metrics with current values
   - Status indicators (green for good, yellow for warning, red for critical)
   
   ### 2. Risk Summary
   
   This section provides an overview of the organization's risk posture, including:
   
   - Number of risks by severity (critical, high, medium, low)
   - Risk acceptance rate
   - Average risk remediation time
   
   ### 3. Compliance Summary
   
   This section provides information on the organization's compliance status, including:
   
   - Policy compliance
   - Control effectiveness
   - Audit findings
   - Regulatory compliance
   - Security training completion
   - Third-party risk assessment
   
   ### 4. Trend Visualizations
   
   This section provides visualizations of key metrics over time, including:
   
   - Patch compliance trend
   - Vulnerability remediation time trend
   - Security incidents trend
   - Security monitoring coverage trend
   - Policy compliance trend
   
   ### 5. Key Recommendations
   
   This section provides recommendations for improving the organization's security governance posture.
   
   ## Interpreting the Dashboard
   
   ### Metric Status Indicators
   
   Metrics on the dashboard are displayed with status indicators:
   
   - **Green**: Metric is meeting or exceeding the target
   - **Yellow**: Metric is below target but within acceptable range
   - **Red**: Metric is significantly below target and requires immediate attention
   
   ### Trend Visualizations
   
   Trend visualizations show the metric value over time, with a target line indicating the desired value. The trend line helps identify patterns and progress over time.
   
   ## Using the Dashboard for Decision Making
   
   The Security Governance Dashboard is designed to support decision making by:
   
   1. **Identifying Issues**: Highlighting areas where security governance is not meeting targets
   2. **Tracking Progress**: Showing trends over time to track improvement
   3. **Prioritizing Actions**: Focusing attention on the most critical issues
   4. **Demonstrating Compliance**: Providing evidence of compliance with policies and regulations
   
   ## Refreshing the Dashboard
   
   The dashboard is updated monthly with new data. To refresh the dashboard:
   
   1. Run the `governance_metrics.py` script
   2. Open the newly generated `executive_dashboard.html` file
   
   ## Conclusion
   
   The Security Governance Dashboard provides a powerful tool for monitoring and improving security governance. By regularly reviewing the dashboard, executives and board members can ensure effective oversight of the security program and drive continuous improvement in security governance.
   EOF
   ```

**Deliverables:**
- The security governance metrics script
- The executive dashboard HTML file
- The board report
- The metrics framework document
- The dashboard user guide
- Screenshots of the dashboard and visualizations
- A brief explanation (1-2 paragraphs) of how the metrics and reporting mechanisms support effective security governance

### Submission Guidelines

1. Compile all deliverables into a single document in the following order:
   - Part 1: Setting Up a Simulated Environment
   - Part 2: Analyzing Security Governance Failures
   - Part 3: Implementing Security Governance Controls
   - Part 4: Developing Security Governance Metrics and Reporting

2. Include all required screenshots, script outputs, and explanations.

3. Format requirements:
   - Professional document format with consistent styling
   - Clear section headings and organization
   - Code blocks properly formatted and commented
   - Screenshots clearly labeled and readable

4. Submit your completed assignment through the course learning management system by the deadline.

### Grading Rubric

| Criteria | Excellent (90-100%) | Good (80-89%) | Satisfactory (70-79%) | Needs Improvement (<70%) |
|----------|---------------------|---------------|------------------------|--------------------------|
| Simulated Environment | Comprehensive environment that accurately recreates conditions similar to the Equifax breach; excellent documentation and explanation | Well-designed environment that recreates key aspects of the Equifax breach; good documentation and explanation | Basic environment that recreates some aspects of the Equifax breach; adequate documentation and explanation | Limited environment that fails to recreate important aspects of the Equifax breach; poor documentation and explanation |
| Security Governance Failure Analysis | Comprehensive, insightful analysis of governance failures with clear connections to the Equifax case study; excellent comparison report | Thorough analysis of governance failures with good connections to the Equifax case study; solid comparison report | Basic analysis of governance failures with some connections to the Equifax case study; adequate comparison report | Superficial analysis of governance failures with limited connections to the Equifax case study; poor comparison report |
| Security Governance Control Implementation | Comprehensive implementation of controls that effectively address all identified failures; excellent documentation and verification | Thorough implementation of controls that address most identified failures; good documentation and verification | Basic implementation of controls that address some identified failures; adequate documentation and verification | Limited implementation of controls that fail to address key failures; poor documentation and verification |
| Security Governance Metrics and Reporting | Comprehensive metrics framework with excellent visualizations and reporting mechanisms; clear explanation of how metrics support governance | Well-developed metrics framework with good visualizations and reporting mechanisms; solid explanation of how metrics support governance | Basic metrics framework with adequate visualizations and reporting mechanisms; general explanation of how metrics support governance | Limited metrics framework with poor visualizations and reporting mechanisms; weak explanation of how metrics support governance |
| Overall Quality | Professional presentation, excellent organization, error-free, exceeds expectations | Good presentation, well-organized, minimal errors, meets all requirements | Acceptable presentation, organized, some errors, meets basic requirements | Poor presentation, disorganized, significant errors, fails to meet requirements |

### Academic Integrity

This assignment must be completed individually. All work must be your own. Proper citation is required for any external sources used. Plagiarism or any form of academic dishonesty will result in a failing grade and potential disciplinary action.

### Resources

The following resources may be helpful in completing this assignment:

- Course reading materials on security governance case studies
- Docker documentation for container setup
- Python documentation for scripting
- Matplotlib documentation for data visualization
- Security governance frameworks and standards (NIST, ISO, COBIT)

### Questions and Support

If you have questions about this assignment, please post them to the course discussion forum or contact your instructor during office hours.

