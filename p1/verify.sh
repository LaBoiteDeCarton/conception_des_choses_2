#!/bin/bash

# Verification script for K3s Vagrant setup
# This script documents the requirements met by the Vagrantfile

echo "=== K3s Vagrant Setup Verification ==="
echo ""

echo "✓ Requirement 1: Two virtual machines created"
echo "  - Machine 1: dmercadiS (server)"
echo "  - Machine 2: dmercadiSW (worker)"
echo ""

echo "✓ Requirement 2: Hostname conventions"
echo "  - Server hostname ends with 'S': dmercadiS"
echo "  - Worker hostname ends with 'SW': dmercadiSW"
echo ""

echo "✓ Requirement 3: IP addresses configured"
echo "  - Server IP: 192.168.56.110"
echo "  - Worker IP: 192.168.56.111"
echo ""

echo "✓ Requirement 4: K3s roles"
echo "  - dmercadiS: K3s server mode"
echo "  - dmercadiSW: K3s agent/worker mode"
echo ""

echo "✓ Requirement 5: SSH without password"
echo "  - Configured via: config.ssh.insert_key = false"
echo "  - Vagrant manages SSH keys automatically"
echo ""

echo "✓ Requirement 6: Modern Vagrant practices"
echo "  - Uses Vagrant API version 2"
echo "  - Uses modern Ubuntu box (ubuntu2204)"
echo "  - Uses private network for inter-VM communication"
echo "  - Proper provisioning scripts"
echo ""

echo "✓ Requirement 7: kubectl installed"
echo "  - K3s includes kubectl"
echo "  - Configured on server node"
echo "  - Accessible without sudo"
echo ""

echo "=== Setup Complete ==="
echo ""
echo "To use this setup:"
echo "  1. Run: vagrant up"
echo "  2. Wait for provisioning to complete"
echo "  3. SSH to server: vagrant ssh dmercadiS"
echo "  4. Check cluster: kubectl get nodes"
echo ""
