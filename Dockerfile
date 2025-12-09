# GRC Engineering Labs - Docker Container
# Provides a complete lab environment for GRC training
#
# Maintainer: Aminu Idris, AMCPN
# Organization: ICDFA
# Version: 1.0.0

FROM ubuntu:22.04

# Avoid interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Set working directory
WORKDIR /grc-labs

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    wget \
    git \
    vim \
    nano \
    unzip \
    zip \
    tar \
    gzip \
    net-tools \
    dnsutils \
    iputils-ping \
    traceroute \
    htop \
    tree \
    jq \
    bc \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    libreoffice \
    libreoffice-calc \
    ca-certificates \
    gnupg \
    lsb-release \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN python3 -m pip install --upgrade pip

# Install Python packages for GRC labs
RUN pip3 install --no-cache-dir \
    pandas \
    openpyxl \
    xlrd \
    requests \
    beautifulsoup4 \
    lxml \
    pyyaml \
    jinja2 \
    click \
    colorama \
    tabulate \
    python-dotenv \
    cryptography \
    paramiko \
    fabric \
    ansible

# Create grc user
RUN useradd -m -s /bin/bash -G sudo grc && \
    echo "grc:grc" | chpasswd && \
    echo "grc ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Copy lab materials
COPY . /grc-labs/

# Set ownership
RUN chown -R grc:grc /grc-labs

# Switch to grc user
USER grc

# Set environment variables
ENV PATH="/grc-labs/scripts:${PATH}"
ENV PYTHONPATH="/grc-labs:${PYTHONPATH}"

# Default command
CMD ["/bin/bash"]
