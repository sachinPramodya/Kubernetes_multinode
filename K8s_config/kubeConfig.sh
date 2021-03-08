
apt-get update
apt install kubernetes-cni -y # not in documentation needed for updates
apt-get install kubelet=$K8S_VERSION kubeadm=$K8S_VERSION kubectl=$K8S_VERSION -y 
apt-mark hold kubelet kubeadm kubectl
systemctl daemon-reload
systemctl restart kubelet

## Create Default Audit Policy

mkdir -p /etc/kubernetes
cat > /etc/kubernetes/audit-policy.yaml <<EOF
apiVersion: audit.k8s.io/v1beta1
kind: Policy
rules:
- level: Metadata
EOF

# folder to save audit logs
mkdir -p /var/log/kubernetes/audit

## Install NFS Client Drivers
sudo apt-get update 
sudo apt-get install -y nfs-common

