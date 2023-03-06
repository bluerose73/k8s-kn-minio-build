# Build a one-node Knative cluster + a one-node minio storage

## 1. Start up a 2-node cluster on Cloudlab

The public hostname should be:
http://node0.k8s-kn-ceph.faaspipeline-pg0.utah.cloudlab.us:9090/browser
http://node1.k8s-kn-ceph.faaspipeline-pg0.utah.cloudlab.us:9090/browser

ssh bluerose@hp127.utah.cloudlab.us
ssh bluerose@hp134.utah.cloudlab.us

## 2. Install Kind + knative with knative quickstart on Node 0

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

Install kind + knative

## 3. Install Single-node Minio on Node1

```shell
wget https://dl.min.io/server/minio/release/linux-amd64/archive/minio-20230222182345.0.0.x86_64.rpm -O minio.rpm
sudo dnf install minio.rpm

cd /mydata
sudo mkdir minio
chmod -R 777 ./minio

minio server /mydata/minio --console-address :9090
```

## 4. Install locust on Node 2