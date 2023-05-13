# Build a 2-node Knative cluster + a one-node minio storage

## 1. Start up a 3-node cluster on Cloudlab

The public hostname should be:

node0.singlenode.faaspipeline-PG0.utah.cloudlab.us

node1.singlenode.faaspipeline-PG0.utah.cloudlab.us

node2.singlenode.faaspipeline-PG0.utah.cloudlab.us

## 2. Set up k8s control plane

```shell
source setup_control_plane.sh
```

Copy the output which looks like ``kubeadm join --token <token> <control-plane-host>:<control-plane-port> --discovery-token-ca-cert-hash sha256:<hash>``. It will be used to join worker nodes to the cluster.

## 3. Set up k8s worker nodes

```shell
source setup_worker_node.sh
```

Run ``kubeadm join --token <token> <control-plane-host>:<control-plane-port> --discovery-token-ca-cert-hash sha256:<hash>``

## 4. Install minio on storage node


## 5. Install Locust loadtester


## 6. Install Netdata resource monitor

## 7. Misc

Run docker as regular user

```sh
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```