# ==============================================================================
# This is a K3D setup script for creating a local Kubernetes cluster using K3D.
# First we need to install prerequisites like Docker, kubectl, and K3D itself.
# Designed for macOS systems using Homebrew.
# ==============================================================================

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed: $(brew --version | head -n1)"
fi

# Update Homebrew
brew update

##### DOCKER INSTALLATION
# Source : https://docs.docker.com/desktop/install/mac/
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing Docker Desktop for Mac..."
    brew install --cask docker
    echo "Docker Desktop installed. Please start Docker Desktop from Applications folder."
    echo "Waiting for Docker to start..."
    while ! docker info &> /dev/null; do
        echo "Waiting for Docker to be ready..."
        sleep 5
    done
else
    echo "Docker is already installed: $(docker --version)"
fi
##### DOCKER INSTALLATION END

##### KUBECTL INSTALLATION
# Source : https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
if ! command -v kubectl &> /dev/null; then
    echo "kubectl not found. Installing kubectl..."
    brew install kubectl
else
    echo "kubectl is already installed: $(kubectl version --client --short 2>/dev/null || kubectl version --client)"
fi
##### KUBECTL INSTALLATION END


##### K3D INSTALLATION
# Source : https://k3d.io/stable/#installation
if ! command -v k3d &> /dev/null; then
    echo "k3d not found. Installing k3d..."
    brew install k3d
else
    echo "k3d is already installed: $(k3d version)"
fi
##### K3D INSTALLATION END

##### ARGOCD-CLI INSTALLATION
# Source : https://argo-cd.readthedocs.io/en/stable/cli_installation/
echo "Checking for ArgoCD CLI installation"
if (! command -v argocd &> /dev/null); then
    echo "ArgoCD CLI not found. Installing ArgoCD CLI..."
    brew install argocd
else
    echo "ArgoCD CLI is already installed"
fi
##### ARGOCD-CLI INSTALLATION END
