<h1 align="center"> chi tiết các bước cài k8s </h1> 

[figma file for details](https://github.com/nnbaocuong99/details-k8s-project/tree/main/figma)

---

# ✨ install and setup vmbox and cluster:

## B1. cài đặt máy ảo - vmbox:
- sử dụng [Vagrant-master](https://github.com/nnbaocuong99/details-k8s-project/blob/main/document/vagrantfile-master) đổi tên thành Vagrantfile và chạy command `vagrant up` để cài máy ảo master
- sử dụng [Vagrant-worker](https://github.com/nnbaocuong99/details-k8s-project/blob/main/document/Vagrantfile-worker) đổ tên thàhh Vagrantfile và chạy command `vagrant up` để cà máy ảo worker (node)


## B2. cài đặt rancher và k8s:

1. vmbox master:
- ssh vào máy ảo bằng terminal (cú pháp `ssh username@IP`), với trường hợp ssh bằng vscode không dc thì phải add user bằng command:
```
$ useradd --comment 'ur-username-go-here' --create-home ur-username-go-here --shell /bin/bash
```
- `sudo su` để chuyển sang root user. 
- `docker version` (optional) để kiểm tra docker đã cài đặt chưa bằng 
- chạy commands để cài rancher. (lựa chọn tag để cài đặt phiên bản compatible với máy. for example đây là bả 2.7)
```
$ docker run -d --name=rancher-server --restart=unless-stopped -p 80:80 -p 443:443 --privileged rancher/rancher:v2.7-091ed163cc5c53efc50bd1a580cb4e54fa097e82-linux-amd64
```
- truy cập https://192.168.56.200 để setup cluster. 
- `copy token`
- truy cập https://192.168.56.200/g để chuyển giao diện và lấy config cuả kube

2. vmbox worker:
- ssh vào máy ảo.
- tạo cluster và paste token lấy đc từ bứớc `copy token` bên trên và thêm thuộc tính `--address worker_IP` vào trc `-etcd` để tránh việc 2 máy ảo bị trùng dải IP 

example:
```
sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run  rancher/rancher-agent:v2.7-091ed163cc5c53efc50bd1a580cb4e54fa097e82-head --server https://192.168.56.200/ --token p5zcnnpcb5cx8pg89vkk5nkx8gbzltk9wbkmfjp6rsn9n6kf729vjp --ca-checksum 37bde28c0dc9fbd360146f727ff4b1cd254d9f17490789f93775fb2ce15b58da --address worker_IP --etcd --controlplane --worker
```

3. local
- vào https://192.168.56.200/g để copy file config 
- làm theo huongdan. cd và paste config vào `~/.kube/config` để cấu hình máy local ăn với cluster.

4. trên terminal cuar máy local
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
