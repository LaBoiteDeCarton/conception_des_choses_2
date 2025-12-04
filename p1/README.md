# Part 1: K3s and Vagrant

This setup creates two virtual machines using Vagrant to run a K3s Kubernetes cluster.

## Virtual Machines

1. **dmercadiS** (Server)
   - IP: 192.168.56.110
   - Role: K3s server (control plane)
   - Hostname: dmercadiS

2. **dmercadiSW** (Worker)
   - IP: 192.168.56.111
   - Role: K3s agent (worker node)
   - Hostname: dmercadiSW

## Prerequisites

- Vagrant
- VirtualBox
- At least 2GB of free RAM

## Usage

```bash
# Start both VMs
vagrant up

# SSH into the server
vagrant ssh dmercadiS

# SSH into the worker
vagrant ssh dmercadiSW

# Check cluster status (from server node)
vagrant ssh dmercadiS -c "kubectl get nodes"

# Stop the VMs
vagrant halt

# Destroy the VMs
vagrant destroy -f
```

## Features

- K3s server running on dmercadiS
- K3s agent running on dmercadiSW
- Passwordless SSH configured
- kubectl installed and configured on server node
- Private network for inter-node communication
- Automatic token sharing between nodes

## Verification

After running `vagrant up`, you can verify the cluster is working:

```bash
# Check nodes
vagrant ssh dmercadiS -c "kubectl get nodes"

# Check system pods
vagrant ssh dmercadiS -c "kubectl get pods -A"
```

Both nodes should appear as "Ready" in the node list.
