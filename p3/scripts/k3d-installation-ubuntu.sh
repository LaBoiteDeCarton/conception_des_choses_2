# ==============================================================================
# This is a K3D setup script for creating a local Kubernetes cluster using K3D.
# First we need to install requirements like Docker, kubectl, and K3D itself.
# ==============================================================================

sudo apt update && sudo apt upgrade -y

##### DOCKER INSTALLATION
# Source : https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
##### DOCKER INSTALLATION END

##### KUBECTL INSTALLATION
# Source : https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
##### KUBECTL INSTALLATION END


##### K3D INSTALLATION
# Source : https://k3d.io/stable/#installation
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
##### K3D INSTALLATION END

##### ARGOCD-CLI INSTALLATION
# Source : https://argo-cd.readthedocs.io/en/stable/cli_installation/
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
##### ARGOCD-CLI INSTALLATION END