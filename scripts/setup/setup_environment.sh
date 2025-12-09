#!/bin/bash
#
# GRC Engineering Labs - Environment Setup Script
# Automated setup for Ubuntu/Debian-based systems
#
# Maintainer: Aminu Idris, AMCPN
# Organization: ICDFA
# Version: 1.0.0

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Script configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
LOG_FILE="$PROJECT_ROOT/setup.log"

# Function to print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1" | tee -a "$LOG_FILE"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1" | tee -a "$LOG_FILE"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1" | tee -a "$LOG_FILE"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1" | tee -a "$LOG_FILE"
}

# Function to check if running on supported OS
check_os() {
    print_info "Checking operating system..."
    
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        OS=$ID
        VERSION=$VERSION_ID
        
        if [[ "$OS" == "ubuntu" ]] || [[ "$OS" == "debian" ]]; then
            print_success "Supported OS detected: $OS $VERSION"
            return 0
        else
            print_warning "OS $OS may not be fully supported. Proceeding anyway..."
            return 0
        fi
    else
        print_error "Cannot determine OS. This script is designed for Ubuntu/Debian."
        return 1
    fi
}

# Function to check if script is run with sudo
check_sudo() {
    if [[ $EUID -ne 0 ]]; then
        print_error "This script must be run with sudo privileges"
        print_info "Please run: sudo $0"
        exit 1
    fi
}

# Function to update system packages
update_system() {
    print_info "Updating system packages..."
    apt-get update -qq >> "$LOG_FILE" 2>&1
    print_success "System packages updated"
}

# Function to install essential packages
install_essentials() {
    print_info "Installing essential packages..."
    
    local packages=(
        "build-essential"
        "curl"
        "wget"
        "git"
        "vim"
        "nano"
        "unzip"
        "zip"
        "tar"
        "gzip"
        "net-tools"
        "dnsutils"
        "iputils-ping"
        "traceroute"
        "htop"
        "tree"
        "jq"
        "bc"
    )
    
    apt-get install -y -qq "${packages[@]}" >> "$LOG_FILE" 2>&1
    print_success "Essential packages installed"
}

# Function to install Python and related tools
install_python() {
    print_info "Installing Python 3 and pip..."
    
    apt-get install -y -qq python3 python3-pip python3-venv python3-dev >> "$LOG_FILE" 2>&1
    
    # Verify Python installation
    PYTHON_VERSION=$(python3 --version 2>&1 | awk '{print $2}')
    print_success "Python $PYTHON_VERSION installed"
    
    # Upgrade pip
    print_info "Upgrading pip..."
    python3 -m pip install --upgrade pip >> "$LOG_FILE" 2>&1
    print_success "pip upgraded"
}

# Function to install Python packages for GRC labs
install_python_packages() {
    print_info "Installing Python packages for GRC labs..."
    
    local packages=(
        "pandas"
        "openpyxl"
        "xlrd"
        "requests"
        "beautifulsoup4"
        "lxml"
        "pyyaml"
        "jinja2"
        "click"
        "colorama"
        "tabulate"
        "python-dotenv"
        "cryptography"
        "paramiko"
        "fabric"
        "ansible"
    )
    
    python3 -m pip install --quiet "${packages[@]}" >> "$LOG_FILE" 2>&1
    print_success "Python packages installed"
}

# Function to install LibreOffice for spreadsheet work
install_libreoffice() {
    print_info "Installing LibreOffice..."
    apt-get install -y -qq libreoffice libreoffice-calc >> "$LOG_FILE" 2>&1
    print_success "LibreOffice installed"
}

# Function to install Docker
install_docker() {
    print_info "Installing Docker..."
    
    # Remove old versions
    apt-get remove -y -qq docker docker-engine docker.io containerd runc >> "$LOG_FILE" 2>&1 || true
    
    # Install prerequisites
    apt-get install -y -qq ca-certificates gnupg lsb-release >> "$LOG_FILE" 2>&1
    
    # Add Docker GPG key
    mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg >> "$LOG_FILE" 2>&1
    
    # Add Docker repository
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    # Install Docker
    apt-get update -qq >> "$LOG_FILE" 2>&1
    apt-get install -y -qq docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin >> "$LOG_FILE" 2>&1
    
    # Add user to docker group
    if [[ -n "$SUDO_USER" ]]; then
        usermod -aG docker "$SUDO_USER"
        print_success "Docker installed and user $SUDO_USER added to docker group"
        print_warning "Please log out and back in for docker group changes to take effect"
    else
        print_success "Docker installed"
    fi
}

# Function to configure Git
configure_git() {
    print_info "Configuring Git..."
    
    if [[ -n "$SUDO_USER" ]]; then
        local git_user=$(sudo -u "$SUDO_USER" git config --global user.name 2>/dev/null || echo "")
        
        if [[ -z "$git_user" ]]; then
            print_warning "Git user not configured. Please run:"
            echo "  git config --global user.name \"Your Name\""
            echo "  git config --global user.email \"your.email@example.com\""
        else
            print_success "Git already configured for user: $git_user"
        fi
    fi
}

# Function to create virtual environment
create_venv() {
    print_info "Creating Python virtual environment..."
    
    local venv_dir="$PROJECT_ROOT/venv"
    
    if [[ -d "$venv_dir" ]]; then
        print_warning "Virtual environment already exists at $venv_dir"
    else
        python3 -m venv "$venv_dir" >> "$LOG_FILE" 2>&1
        print_success "Virtual environment created at $venv_dir"
        print_info "To activate: source venv/bin/activate"
    fi
}

# Function to verify installations
verify_installations() {
    print_info "Verifying installations..."
    
    local all_good=true
    
    # Check Python
    if command -v python3 &> /dev/null; then
        print_success "Python: $(python3 --version)"
    else
        print_error "Python not found"
        all_good=false
    fi
    
    # Check pip
    if command -v pip3 &> /dev/null; then
        print_success "pip: $(pip3 --version | awk '{print $1, $2}')"
    else
        print_error "pip not found"
        all_good=false
    fi
    
    # Check Git
    if command -v git &> /dev/null; then
        print_success "Git: $(git --version)"
    else
        print_error "Git not found"
        all_good=false
    fi
    
    # Check Docker
    if command -v docker &> /dev/null; then
        print_success "Docker: $(docker --version)"
    else
        print_warning "Docker not found (optional)"
    fi
    
    # Check LibreOffice
    if command -v libreoffice &> /dev/null; then
        print_success "LibreOffice: $(libreoffice --version | head -n1)"
    else
        print_warning "LibreOffice not found (optional)"
    fi
    
    if [[ "$all_good" == true ]]; then
        print_success "All required tools verified successfully"
        return 0
    else
        print_error "Some required tools are missing"
        return 1
    fi
}

# Function to display summary
display_summary() {
    echo ""
    echo "=========================================="
    echo "  GRC Engineering Labs Setup Complete"
    echo "=========================================="
    echo ""
    echo "Next steps:"
    echo "1. Log out and back in (for Docker group changes)"
    echo "2. Activate virtual environment: source venv/bin/activate"
    echo "3. Navigate to a lab: cd phase1/grc101/week1/"
    echo "4. Read lab instructions: cat LAB_INSTRUCTIONS.md"
    echo "5. Start learning!"
    echo ""
    echo "Documentation:"
    echo "- README.md - Programme overview"
    echo "- GETTING_STARTED.md - Getting started guide"
    echo "- FAQ.md - Frequently asked questions"
    echo "- TROUBLESHOOTING.md - Common issues"
    echo ""
    echo "Support:"
    echo "- GitHub Issues: https://github.com/icdfa/grc-engineering-labs/issues"
    echo "- GitHub Discussions: https://github.com/icdfa/grc-engineering-labs/discussions"
    echo ""
    echo "Log file: $LOG_FILE"
    echo "=========================================="
}

# Main execution
main() {
    echo "=========================================="
    echo "  GRC Engineering Labs - Setup Script"
    echo "  Version 1.0.0"
    echo "=========================================="
    echo ""
    
    # Initialize log file
    echo "Setup started at $(date)" > "$LOG_FILE"
    
    # Check if sudo
    check_sudo
    
    # Check OS
    check_os || exit 1
    
    # Update system
    update_system
    
    # Install components
    install_essentials
    install_python
    install_python_packages
    install_libreoffice
    
    # Ask about Docker
    read -p "Install Docker? (recommended) [Y/n]: " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
        install_docker
    else
        print_info "Skipping Docker installation"
    fi
    
    # Configure Git
    configure_git
    
    # Create virtual environment
    create_venv
    
    # Verify installations
    verify_installations
    
    # Display summary
    display_summary
    
    print_success "Setup completed successfully!"
    echo "Setup completed at $(date)" >> "$LOG_FILE"
}

# Run main function
main "$@"
