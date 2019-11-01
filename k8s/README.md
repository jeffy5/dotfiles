# K8s deployment note

> Note the process of k8s deployment.


## 1. Update yum source

```
sudo yum update
sudo yum install -y vim git
```


## 2. Install docker

Just flow offical install guide: [Docker Install](https://docs.docker.com/install/linux/docker-ce/centos/)


## 3. Install kubeadm

Just flow offical install guide: [Kubeadm Install](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)


## Notes


### Replace kubeadm's yum source

```
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF
```

### Kubeadm initialize with config file

#### Pull related image first

```
kubeadm config images pull
```

#### Replace master server ip and start initialization

```
kubeadm init --config kubeadm.conf
```
