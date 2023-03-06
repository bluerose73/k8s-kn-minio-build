# Build a one-node Knative cluster + a one-node minio storage

## 1. Start up a 2-node cluster on Cloudlab

The public hostname should be:
http://node0.k8s-kn-ceph.faaspipeline-pg0.utah.cloudlab.us:9090/browser
http://node1.k8s-kn-ceph.faaspipeline-pg0.utah.cloudlab.us:9090/browser

ssh bluerose@hp127.utah.cloudlab.us
ssh bluerose@hp134.utah.cloudlab.us

## 2. Install Single-node Knative on Node0

```shell
# Flush ip table
sudo iptables -F
sudo iptables-save

# Disable swap
sudo swapoff -a
cat /etc/fstab | grep -v '^#' | grep -v 'swap' | sudo tee /etc/fstab
```

Install Docker Engine
```shell
sudo apt-get update
sudo apt-get install -y\
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Configure bridge
```shell
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# 设置所需的 sysctl 参数，参数在重新启动后保持不变
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

# 应用 sysctl 参数而不重新启动
sudo sysctl --system
```

Install k8s with kubeadm
```shell
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

Install Knative
```shell
placeholder
```

## 3. Install Single-node Minio on Node1

```shell
wget https://dl.min.io/server/minio/release/linux-amd64/archive/minio_20230222182345.0.0_amd64.deb -O minio.deb
sudo dpkg -i minio.deb

cd /mydata
sudo mkdir minio
sudo chmod -R 777 ./minio

minio server /mydata/minio --console-address :9090
```