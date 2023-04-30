# Init control plane
sudo kubeadm init --pod-network-cidr 10.244.0.0/16

# Make kubectl work for non-root user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Install pod network add-on (flannel)
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml

# Then you can join any number of worker nodes by running the following on each as root:

# kubeadm join 128.110.218.54:6443 --token lvwexg.uy6kbopoc7z562t7 \
#         --discovery-token-ca-cert-hash sha256:5bf1e6901d04ec181a96f6a5a341785fbdf4f92bc48d9c58a2a214237a5567aa 