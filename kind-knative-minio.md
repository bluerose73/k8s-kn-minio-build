# Build a one-node Knative cluster + a one-node minio storage

## 1. Start up a 3-node cluster on Cloudlab

The public hostname should be:
http://node0.k8s-kn-ceph.faaspipeline-pg0.utah.cloudlab.us:9090/browser
http://node1.k8s-kn-ceph.faaspipeline-pg0.utah.cloudlab.us:9090/browser

ssh bluerose@hp127.utah.cloudlab.us
ssh bluerose@hp134.utah.cloudlab.us

## 2. Install Kind + knative with knative quickstart on Node 0

```shell
source env.sh
source install_docker.sh
source install_kubectl.sh
source install_kind.sh
source install_knative_quickstart.sh
```

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