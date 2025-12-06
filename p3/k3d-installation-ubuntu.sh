: <<'EOF'
This is a K3D setup script for creating a local Kubernetes cluster using K3D.
First we need to install prerequisites like Docker, kubectl, and K3D itself.
EOF

sudo apt update && sudo apt upgrade -y

##### DOCKER INSTALLATION
#Source : https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
##### DOCKER INSTALLATION END

##### KUBECTL INSTALLATION
#Source : https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
##### KUBECTL INSTALLATION END


##### K3D INSTALLATION
#Source : https://k3d.io/stable/#installation
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
##### K3D INSTALLATION END
