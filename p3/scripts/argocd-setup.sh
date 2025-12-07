# ==============================================================================
# This is an ArgoCD setup script for deploying an application to a local Kubernetes cluster using K3D.
# ==============================================================================

# Sources : 
#   https://argo-cd.readthedocs.io/en/stable/getting_started/
#   https://yashguptaa.medium.com/application-deploy-to-kubernetes-with-argo-cd-and-k3d-8e29cf4f83ee


k3d cluster create dmercadiS
kubectl create namespace dev
microk8s enable dns && microk8s stop && microk8s start
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath=”{.data.password}” | base64 -d; echo
argocd login
argocd app create app-iot-dmercadi --repo https://github.com/dmercadi/app-iot-dmercadi.git --path app-iot-dmercadi --dest-server https://kubernetes.default.svc --dest-namespace dev
argocd app sync app-iot-dmercadi


# il est possible d'utiliser un autre mode de deployement sur argoCD 'Declarative Setup'
# source : https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/