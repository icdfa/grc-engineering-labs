# Troubleshooting Guide

This guide addresses common issues encountered while working through the GRC Engineering Labs programme.

## Table of Contents

- [Environment Setup Issues](#environment-setup-issues)
- [Lab Execution Problems](#lab-execution-problems)
- [Dataset and File Issues](#dataset-and-file-issues)
- [Script and Code Errors](#script-and-code-errors)
- [Documentation and Submission](#documentation-and-submission)
- [Tool-Specific Issues](#tool-specific-issues)
- [Getting Additional Help](#getting-additional-help)

## Environment Setup Issues

### Linux/WSL2 Installation Problems

**Problem:** Cannot install or access WSL2 on Windows

**Solutions:**
- Ensure Windows 10 version 2004 or higher (Build 19041 or higher)
- Enable virtualization in BIOS/UEFI
- Run PowerShell as Administrator and execute:
  ```powershell
  wsl --install
  ```
- Check Windows features: Enable "Virtual Machine Platform" and "Windows Subsystem for Linux"
- Restart computer after enabling features

**Problem:** WSL2 is slow or unresponsive

**Solutions:**
- Allocate more resources in .wslconfig file
- Close unnecessary Windows applications
- Update WSL2 kernel: `wsl --update`
- Consider using a native Linux installation or VM

### Python Installation Issues

**Problem:** Python 3.8+ not available or command not found

**Solutions:**
- Ubuntu/Debian: `sudo apt update && sudo apt install python3 python3-pip`
- Check version: `python3 --version`
- Create alias if needed: `alias python=python3`
- Ensure pip is installed: `sudo apt install python3-pip`

**Problem:** Python package installation fails

**Solutions:**
- Update pip: `python3 -m pip install --upgrade pip`
- Use virtual environment: `python3 -m venv labenv && source labenv/bin/activate`
- Install with user flag: `pip3 install --user package-name`
- Check for permission issues: use `sudo` if necessary (not recommended in venv)

### Git and GitHub Issues

**Problem:** Git not installed or configured

**Solutions:**
- Install git: `sudo apt install git`
- Configure user: 
  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "your.email@example.com"
  ```
- Verify configuration: `git config --list`

**Problem:** Cannot clone repository

**Solutions:**
- Check internet connection
- Verify repository URL
- Use HTTPS instead of SSH if authentication fails
- Generate SSH key if using SSH: `ssh-keygen -t ed25519 -C "your.email@example.com"`
- Add SSH key to GitHub account

## Lab Execution Problems

### Permission Denied Errors

**Problem:** Permission denied when executing scripts

**Solutions:**
- Make script executable: `chmod +x script-name.sh`
- Run with bash explicitly: `bash script-name.sh`
- Check file ownership: `ls -l script-name.sh`
- Use sudo only when necessary and appropriate

**Problem:** Cannot write to directory

**Solutions:**
- Check directory permissions: `ls -ld directory-name`
- Create directory in home folder instead: `mkdir ~/lab-work`
- Change ownership if needed: `sudo chown $USER:$USER directory-name`

### Command Not Found Errors

**Problem:** Command not found when following lab instructions

**Solutions:**
- Install required package: `sudo apt install package-name`
- Check if command exists: `which command-name`
- Verify PATH variable: `echo $PATH`
- Source your profile: `source ~/.bashrc` or `source ~/.profile`

### Lab Instructions Unclear

**Problem:** Lab instructions are ambiguous or incomplete

**Solutions:**
- Review the lab objectives to understand the goal
- Check related framework documentation in resources/
- Search GitHub Issues for similar questions
- Open a GitHub Discussion for clarification
- Review previous labs for context

## Dataset and File Issues

### Cannot Open Excel Files

**Problem:** Excel files won't open in LibreOffice or other tools

**Solutions:**
- Install LibreOffice: `sudo apt install libreoffice`
- Use Python pandas: `pip3 install pandas openpyxl`
- Convert to CSV if needed:
  ```python
  import pandas as pd
  df = pd.read_excel('file.xlsx')
  df.to_csv('file.csv', index=False)
  ```
- Use online viewers as last resort (be cautious with sensitive data)

**Problem:** Dataset appears corrupted or won't load

**Solutions:**
- Re-download the file from repository
- Check file integrity: `md5sum filename`
- Verify file is not empty: `ls -lh filename`
- Try opening in different application

### File Path Issues

**Problem:** Cannot find files or datasets

**Solutions:**
- Use absolute paths: `/home/username/grc-engineering-labs/datasets/file.xlsx`
- Check current directory: `pwd`
- List files: `ls -la`
- Navigate to correct directory: `cd /path/to/directory`
- Use tab completion to avoid typos

**Problem:** Spaces in filenames causing errors

**Solutions:**
- Use quotes: `cat "file name.txt"`
- Use backslash: `cat file\ name.txt`
- Rename files without spaces: `mv "file name.txt" file_name.txt`

## Script and Code Errors

### Bash Script Errors

**Problem:** Script fails with syntax errors

**Solutions:**
- Check shebang line: `#!/bin/bash`
- Verify line endings (Unix vs Windows): `dos2unix script.sh`
- Check for missing quotes or brackets
- Run with bash -x for debugging: `bash -x script.sh`
- Validate syntax: `bash -n script.sh`

**Problem:** Variables not expanding correctly

**Solutions:**
- Use double quotes for variable expansion: `echo "$variable"`
- Check variable assignment (no spaces): `variable="value"`
- Verify variable exists: `echo $variable`
- Use curly braces for clarity: `${variable}`

### Python Script Errors

**Problem:** Import errors or module not found

**Solutions:**
- Install required module: `pip3 install module-name`
- Check Python path: `python3 -c "import sys; print(sys.path)"`
- Use virtual environment
- Verify module name spelling

**Problem:** Syntax errors in Python code

**Solutions:**
- Check Python version: `python3 --version`
- Verify indentation (use spaces, not tabs)
- Check for missing colons, parentheses, or quotes
- Use a linter: `pip3 install pylint && pylint script.py`

### Encoding Issues

**Problem:** Special characters display incorrectly

**Solutions:**
- Set UTF-8 encoding: `export LANG=en_US.UTF-8`
- Specify encoding in Python: `open('file.txt', encoding='utf-8')`
- Check file encoding: `file -i filename`
- Convert encoding: `iconv -f ISO-8859-1 -t UTF-8 input.txt > output.txt`

## Documentation and Submission

### Markdown Rendering Issues

**Problem:** Markdown not rendering correctly

**Solutions:**
- Use proper Markdown syntax
- Preview in VS Code or online editor
- Check for missing blank lines
- Validate syntax: https://markdownlint.github.io/
- Use backticks for code blocks

**Problem:** Screenshots not displaying

**Solutions:**
- Use relative paths: `![Description](./images/screenshot.png)`
- Verify image file exists
- Check image format (PNG, JPG supported)
- Ensure image is committed to repository

### PDF Generation Issues

**Problem:** Cannot convert Markdown to PDF

**Solutions:**
- Install pandoc: `sudo apt install pandoc`
- Install LaTeX: `sudo apt install texlive-latex-base`
- Use pandoc: `pandoc input.md -o output.pdf`
- Alternative: Use online converters or print to PDF from browser

### Large File Issues

**Problem:** Cannot commit large files to Git

**Solutions:**
- Check file size: `ls -lh filename`
- Use .gitignore for large files
- Compress files: `gzip filename`
- Use Git LFS for large files: `git lfs install`
- Store large files externally and link

## Tool-Specific Issues

### Spreadsheet Formula Errors

**Problem:** Excel formulas not working in LibreOffice

**Solutions:**
- Check formula syntax differences
- Use LibreOffice Calc functions
- Recalculate: Ctrl+Shift+F9
- Check cell references
- Verify data types

### Text Editor Issues

**Problem:** Cannot save files or edit

**Solutions:**
- Check file permissions
- Save to home directory
- Use sudo for system files (carefully)
- Try different editor: nano, vim, gedit
- Check disk space: `df -h`

### Terminal Issues

**Problem:** Terminal freezes or becomes unresponsive

**Solutions:**
- Press Ctrl+C to cancel current command
- Press Ctrl+Z to suspend process
- Close and reopen terminal
- Kill frozen process: `ps aux | grep process-name` then `kill PID`
- Restart terminal service

## Network and Connectivity

### Cannot Access External Resources

**Problem:** Cannot download files or access websites

**Solutions:**
- Check internet connection
- Verify firewall settings
- Use curl to test: `curl -I https://example.com`
- Try different DNS: `sudo nano /etc/resolv.conf`
- Check proxy settings if behind corporate firewall

### Git Clone/Pull Failures

**Problem:** Git operations timeout or fail

**Solutions:**
- Check network connection
- Increase Git buffer: `git config --global http.postBuffer 524288000`
- Use shallow clone: `git clone --depth 1 repo-url`
- Try HTTPS instead of SSH
- Check GitHub status: https://www.githubstatus.com/

## Performance Issues

### System Running Slow

**Problem:** Labs take too long or system is sluggish

**Solutions:**
- Check available resources: `htop` or `top`
- Free up disk space: `df -h` and `du -sh *`
- Close unnecessary applications
- Increase VM resources if using virtual machine
- Clear cache: `sudo apt clean`

### Out of Memory Errors

**Problem:** System runs out of memory during labs

**Solutions:**
- Check memory usage: `free -h`
- Close unnecessary applications
- Increase swap space
- Use smaller datasets for testing
- Process data in chunks

## Common Lab-Specific Issues

### Week 1-4 (GRC101)

**Problem:** Linux commands not working as expected

**Solutions:**
- Verify command syntax: `man command-name`
- Check current directory and permissions
- Review Linux basics tutorial
- Practice commands in safe environment

### Week 10-14 (GRC103)

**Problem:** Risk calculations don't match expected results

**Solutions:**
- Double-check formulas: ALE = SLE × ARO
- Verify input values
- Check for rounding errors
- Review risk assessment methodology

### Week 29-31 (GRC203)

**Problem:** Python automation scripts fail

**Solutions:**
- Verify Python version compatibility
- Check all required modules installed
- Review error messages carefully
- Test script components individually
- Use print statements for debugging

### Week 36-39 (GRC301)

**Problem:** DevSecOps concepts unclear

**Solutions:**
- Review DevOps fundamentals first
- Study provided CI/CD examples
- Break down complex pipelines
- Use online DevSecOps resources

## Getting Additional Help

### Before Asking for Help

1. **Read error messages carefully** - They often contain the solution
2. **Search existing issues** - Someone may have encountered the same problem
3. **Review documentation** - Check README, GETTING_STARTED, and this guide
4. **Try basic troubleshooting** - Restart, update, check permissions
5. **Isolate the problem** - Determine exact step where issue occurs

### When Asking for Help

Provide the following information:

1. **Environment details:**
   - Operating system and version
   - Python version
   - Relevant software versions

2. **Problem description:**
   - What you were trying to do
   - What you expected to happen
   - What actually happened

3. **Steps to reproduce:**
   - Exact commands or actions taken
   - Any error messages (full text)
   - Screenshots if relevant

4. **What you've tried:**
   - Troubleshooting steps already attempted
   - Any temporary workarounds found

### Where to Get Help

1. **GitHub Issues** - For bugs and technical problems
2. **GitHub Discussions** - For questions and general help
3. **Repository Documentation** - README, FAQ, guides
4. **ICDFA Support** - For enrolled students
5. **Community Forums** - Cybersecurity and GRC communities

## Emergency Procedures

### Lost Work or Deleted Files

**Solutions:**
- Check Git history: `git log` and `git checkout commit-hash`
- Look in trash/recycle bin
- Check backup locations
- Use file recovery tools (TestDisk, PhotoRec)
- Recreate from notes and documentation

### System Corruption

**Solutions:**
- Boot from live USB
- Reinstall OS if necessary
- Restore from backup
- Recover important files before reinstalling
- Document lessons learned

### Deadline Pressure

**Solutions:**
- Communicate with instructors early
- Focus on core requirements first
- Document what you've completed
- Request extension if needed
- Learn time management for future labs

## Prevention Best Practices

1. **Regular backups** - Backup work frequently
2. **Version control** - Commit changes regularly
3. **Documentation** - Keep notes of what you do
4. **Testing** - Test in safe environment first
5. **Time management** - Start labs early
6. **Ask early** - Don't wait until deadline to ask for help

## Additional Resources

- Linux Command Reference: https://ss64.com/bash/
- Python Documentation: https://docs.python.org/3/
- Git Documentation: https://git-scm.com/doc
- Markdown Guide: https://www.markdownguide.org/
- Stack Overflow: https://stackoverflow.com/

---

**Last Updated:** December 2025  
**Maintained by:** Aminu Idris, AMCPN  
**Repository:** https://github.com/icdfa/grc-engineering-labs

If you find solutions to issues not covered here, please contribute by opening a pull request!
