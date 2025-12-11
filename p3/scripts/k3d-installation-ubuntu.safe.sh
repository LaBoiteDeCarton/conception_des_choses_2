# ==============================================================================
# This is a K3D installation script for creating a local Kubernetes cluster using K3D.
# First we need to install requirements like Docker, kubectl, and K3D itself.
# ==============================================================================

sudo apt update && sudo apt upgrade -y
sudo apt install curl


##### DOCKER INSTALLATION
# Source : https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script
echo "Checking for Docker installation"
if (! command -v docker &> /dev/null); then
    echo "Docker not found. Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo rm get-docker.sh
else
    echo "Docker is already installed"
fi
##### DOCKER INSTALLATION END

##### KUBECTL INSTALLATION
# Source : https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
echo "Checking for kubectl installation"
if (! command -v kubectl &> /dev/null); then
    echo "kubectl not found. Installing kubectl..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
else
    echo "kubectl is already installed"
fi
##### KUBECTL INSTALLATION END


##### K3D INSTALLATION
# Source : https://k3d.io/stable/#installation
echo "Checking for k3d installation"
if (! command -v k3d &> /dev/null); then
    echo "k3d not found. Installing k3d..."
    curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
else
    echo "k3d is already installed"
fi
##### K3D INSTALLATION END

##### ARGOCD-CLI INSTALLATION
# Source : https://argo-cd.readthedocs.io/en/stable/cli_installation/
echo "Checking for ArgoCD CLI installation"
if (! command -v argocd &> /dev/null); then
    echo "ArgoCD CLI not found. Installing ArgoCD CLI..."
    curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
    sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
    rm argocd-linux-amd64
else
    echo "ArgoCD CLI is already installed"
fi
##### ARGOCD-CLI INSTALLATION END
