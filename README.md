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

## ⚒ cài đặt rancher và k8s:

### 1. on the master node:
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
- access to https://192.168.56.200 and setup cluster. 







- `copy token`
- truy cập https://192.168.56.200/g để chuyển giao diện và lấy config cuả kube

2. vmbox worker:
- ssh vào máy ảo.
- tạo cluster và paste token lấy đc từ bứớc `copy token` bên trên và thêm thuộc tính `--address worker_IP` vào trc `-etcd` để tránh việc 2 máy ảo bị trùng dải IP 

example:
```
sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run  rancher/rancher-agent:v2.7-091ed163cc5c53efc50bd1a580cb4e54fa097e82-head --server https://192.168.56.200/ --token p5zcnnpcb5cx8pg89vkk5nkx8gbzltk9wbkmfjp6rsn9n6kf729vjp --ca-checksum 37bde28c0dc9fbd360146f727ff4b1cd254d9f17490789f93775fb2ce15b58da --address worker_IP --etcd --controlplane --worker
```

3. trên cụm k8s
- vào https://192.168.56.200/g để copy file config 
- làm theo huongdan. cd và paste config vào `~/.kube/config` để cấu hình máy local ăn với cluster.

## B3. trên terminal cuả máy local
- cài đặt từng thành phần cuar k8s 
```
apt-get update 
apt-get install -y kubelet kubeadm kubectl 
```
- cài đặt argocd: (đã cài kubectl và config file default)
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
