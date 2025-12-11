# ==============================================================================
# This is an ArgoCD setup script for deploying an application to a local Kubernetes cluster using K3D.
# ==============================================================================

# Sources : 
#   https://argo-cd.readthedocs.io/en/stable/getting_started/
#   https://yashguptaa.medium.com/application-deploy-to-kubernetes-with-argo-cd-and-k3d-8e29cf4f83ee


sudo k3d cluster create dmercadiS --port "8888:80@loadbalancer"
sudo kubectl create namespace dev
sudo sudo kubectl create namespace argocd
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sudo kubectl wait --for=condition=ready --timeout=600s pod -l app.kubernetes.io/name=argocd-server -n argocd
echo "Starting port-forward in background..."
sudo kubectl port-forward svc/argocd-server -n argocd 8080:443 > /dev/null 2>&1 &
PORT_FORWARD_PID=$!
echo "Port-forward started with PID: $PORT_FORWARD_PID"
echo "Waiting for port-forward to be ready..."
sleep 5
sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
sudo kubectl apply -n argocd -f ../confs/argocd-app-iot-dmercadi.yaml
sudo kubectl wait --for=condition=ready --timeout=300s pod -l app=app-iot-dmercadi -n dev

# Wait for ingress to be ready
echo "Waiting for ingress to be ready..."
sleep 10

# K3D exposes Traefik on port 8888 by default when created with port mapping
echo "ArgoCD setup complete!"
echo "ArgoCD UI is available at: https://localhost:8080"
echo "Your application is available at: http://localhost:8888 (via Traefik ingress)"
echo "To stop the ArgoCD port-forward, run: kill $PORT_FORWARD_PID"
echo "Or use: pkill -f 'kubectl port-forward'"



# argocd login localhost:8080 --username admin --password $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d) --insecure
# argocd app create app-iot-dmercadi --repo https://github.com/LaBoiteDeCarton/conception_des_choses_2.git --path app-iot-dmercadi --dest-server https://kubernetes.default.svc --dest-namespace dev
# argocd app set app-iot-dmercadi --sync-policy automated --auto-prune
# argocd app sync app-iot-dmercadi

# echo "Waiting for application to be deployed..."
# kubectl wait --for=condition=ready --timeout=300s pod -l app=app-iot-dmercadi -n dev

# echo "Starting application port-forward in background..."
# kubectl port-forward svc/app-iot-dmercadi-service -n dev 8888:80 > /dev/null 2>&1 &
# APP_PORT_FORWARD_PID=$!
# echo "Application port-forward started with PID: $APP_PORT_FORWARD_PID"

# echo "ArgoCD setup complete!"
# echo "ArgoCD UI is available at: https://localhost:8080"
# echo "Your application is available at: http://localhost:8888"
# echo "To stop the ArgoCD port-forward, run: kill $PORT_FORWARD_PID"
# echo "To stop the application port-forward, run: kill $APP_PORT_FORWARD_PID"
# echo "Or use: pkill -f 'kubectl port-forward'"


# il est possible d'utiliser un autre mode de deployement sur argoCD 'Declarative Setup'
# source : https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/