sudo mkdir /mydata/containerd

sudo sed -i "s/#root = \"\/var\/lib\/containerd\"/version = 2\nroot = \"\/mydata\/containerd\"/" /etc/containerd/config.toml
sudo sed -i 's/\[plugins\."io\.containerd\.grpc\.v1\.cri"\.containerd\.runtimes\.runc\]/\[plugins\."io\.containerd\.grpc\.v1\.cri"\.containerd\.runtimes\.runc\]\n    runtime_type="io\.containerd\.runc\.v2"/' /etc/containerd/config.toml

sudo systemctl restart containerd