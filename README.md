<h1 align="center"> ✨ how to install k8s step by step (my research) ✨ </h1> 

[figma file for details](https://github.com/nnbaocuong99/details-k8s-project/tree/main/figma)

---

# ❗️ part 1: setup vmbox and cluster

## ⚒ install vmbox and setup:
1. install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://developer.hashicorp.com/vagrant/downloads) <sup> for VirtualBox recommend 6.0 version, (easier to setup and provider) and the latest version for Vagrant. </sup>

2. create 2 folders for 2 vagrant files, change name of them to `Vagrantfile` and use the terminal in each:
   - use [Vagrant-master](https://github.com/nnbaocuong99/details-k8s-project/blob/main/document/vagrantfile-master) for the <ins>*master node*</ins>
   - use [Vagrant-worker](https://github.com/nnbaocuong99/details-k8s-project/blob/main/document/Vagrantfile-worker) for the <ins>*worker node*</ins>
3. run the command in the terminal u opened ealier:
```
$ vagrant up
```

## ⚒ install rancher và k8s:

### 1. on the master node (IP: 192.168.56.200): 
- get urself a terminal and ssh into the node with this command `ssh username@IP`
- if u r using vscode or any remote control method, u will need to add an user. replace `ur-username-go-here` with the name u r expecting:
```
$ useradd --comment 'ur-username-go-here' --create-home ur-username-go-here --shell /bin/bash
```
   
- switch to the root user: `$ sudo su`
- check if ur docker has been installed yet: `$ docker version` (optional)
- run the command below to install rancher. (choose ur compatible version)
```
$ docker run -d --name=rancher-server --restart=unless-stopped -p 80:80 -p 443:443 --privileged rancher/rancher:v2.7-091ed163cc5c53efc50bd1a580cb4e54fa097e82-linux-amd64
```
- access to https://192.168.56.200 or https://192.168.56.200/g finish the cluster setup. then `copy config` of the cluster
- cd and paste it into your `~/.kube/config`


### 2. vmbox worker (IP: 192.168.56.201):
- ssh into it.
- _*during the creating cluster step*_: because of rancher will help u to setup the whole entire clusters but in this situation the master and worker are on the same IP so they could be conflict. so in the token u copied from upthere u need to to add the `--address worker_IP` before the `-etcd`. thats gonna be:
```
$ sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run  rancher/rancher-agent:v2.7-091ed163cc5c53efc50bd1a580cb4e54fa097e82-head --server https://192.168.56.200/ --token p5zcnnpcb5cx8pg89vkk5nkx8gbzltk9wbkmfjp6rsn9n6kf729vjp --ca-checksum 37bde28c0dc9fbd360146f727ff4b1cd254d9f17490789f93775fb2ce15b58da --address worker_IP --etcd --controlplane --worker
```
---

# ❗️ part 2: install tools to interac, work with k8s.
1. all about the kube.
- update ur system:
```
sudo apt-get update -y
sudo apt-get upgrade -y
```

- install curl:
```
sudo apt-get install curl
sudo apt-get install apt-transport-https
```

- install minikube:
```
# check the virtualization supported onr ur device or not:
$ grep -E --color 'vmx|svm' /proc/cpuinfo

# if u installe it thru the package, u totally can download the binary
$ curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube

# add it into the env path
$ sudo mkdir -p /usr/local/bin/
$ sudo install minikube /usr/local/bin/
```








```
apt-get update 
apt-get install -y kubelet kubeadm kubectl 
```
- cài đặt argocd: (đã cài kubectl và config file default)
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
