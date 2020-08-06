az aks get-credentials --resource-group finalproject --name cluster
cd /kubernetes
kubectl apply -f backend.yaml
kubectl apply -f frontend.yaml
kubectl apply -f nginx.yaml