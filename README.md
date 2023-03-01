<h1 align="center"> ✨ how to install k8s step by step (my research) ✨ </h1> 

[figma file for details](https://github.com/nnbaocuong99/details-k8s-project/tree/main/figma)

---

# ❗️ part 1: Setup VMBox & Cluster
## ⚒ Setup:

### 1. Install: 
- [Git](https://git-scm.com/)
- [curl](https://curl.se/)
- [Oracle VM VirtualBox](https://www.virtualbox.org/wiki/Downloads) <sup>recommend v6.0. (its easier to setup and provider)</sup>
- [Vagrant by HashiCorp](https://developer.hashicorp.com/vagrant/downloads) 
- On:
  - Window: [Scoop](https://scoop.sh/) <sup>recommend</sup>, [Chocolatey](https://chocolatey.org/) or [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
  - MacOS: [Homebew](https://brew.sh/)

### 2. Create virtual machines: 
- Download 2 files below, re-name to `Vagrantfile` and put each into 2 different folders
   - Use [Vagrant-master](https://github.com/nnbaocuong99/details-k8s-project/blob/main/document/vagrantfile-master) for the <ins>*master node*</ins>
   - Use [Vagrant-worker](https://github.com/nnbaocuong99/details-k8s-project/blob/main/document/Vagrantfile-worker) for the <ins>*worker node*</ins>
- Open 2 terminals in each separate folder.

### 3. Scripts
- Run this command in the terminals you've been opened ealier:
```
$ vagrant up
```


## ⚒ Install Rancher & K8s:

### ✏️ 1. <ins>Step 1:</ins>
- Get yourself a terminal and ssh into the master-node `ssh username@your_ip_address`
- Optional: if you're using *VScode* or any remote control method, you'll need to add an user. replace `your-username-go-here` with the name you're expecting:
```
$ useradd --comment 'ur-username-go-here' --create-home your-username-go-here --shell /bin/bash
```

### ✏️ <ins>Step 2:</ins>
- Switch to the root user: `$ sudo su` 
- Check if ur docker has been installed yet: `$ docker version` 

### ✏️ <ins>Step 3:</ins>
- Choose a tag on [rancher/rancher Tags](https://hub.docker.com/r/rancher/rancher/tags)
- Replace `tag` with the one you've been choosing
```
$ docker run -d --name=rancher-server --restart=unless-stopped -p 80:80 -p 443:443 --privileged rancher/rancher:tag
```
- Wait until the image successfully pulled then get the container id
```
$ docker ps
$ sudo docker ps -aqf "name=containername"`

----------------
# explaination
-a: all.       | Works even if your container is not running.
-q: quietmode. | Output only display numeric container IDs.
-f: filter.    | Filter output based on conditions provided.
```

### ✏️ <ins>Step 4:</ins>
- Access: https://192.168.56.200 or https://192.168.56.200/g 
- Use the container id, replace `container id` in the command below to get the password
```
$ docker logs  container-id  2>&1 | grep "Bootstrap Password:"
```
- Copy the <ins>**red-line**</ins> key/code, thats the password. 
- Login to the Rancher `admin / password`
- Choose the <ins>**custom**</ins> mode, set a name and finish the setup

### ✏️ <ins>Step 5:</ins> 
- Finish setup session and Rancher will show you a <ins>**script**</ins>
- Copy it and add `--address your_worker_IP` before the `--etcd` and you'll get the final script like this:
```
$ sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run  rancher/rancher-agent:v2.7-091ed163cc5c53efc50bd1a580cb4e54fa097e82-head --server https://192.168.56.200/ --token p5zcnnpcb5cx8pg89vkk5nkx8gbzltk9wbkmfjp6rsn9n6kf729vjp --ca-checksum 37bde28c0dc9fbd360146f727ff4b1cd254d9f17490789f93775fb2ce15b58da --address your_worker_IP --etcd --controlplane --worker
```

### ✏️ <ins>Step 6:</ins>
- SSH into the worker-node: `ssh username@your_ip_address`
- Run`$ sudo su` & `$ docker version`
- Run the copied script 
- Get into the masternode and copy the config file. Its look like this:
```
apiVersion: v1
kind: Config
clusters:
- name: "masternode"
  cluster:
    server: "https://192.168.56.200/k8s/clusters/c-2mvpn"
    certificate-authority-data: "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJ2RENDQ\
      VdPZ0F3SUJBZ0lCQURBS0JnZ3Foa2pPUFFRREFqQkdNUnd3R2dZRFZRUUtFeE5rZVc1aGJXbGoKY\
      kdsemRHVnVaWEl0YjNKbk1TWXdKQVlEVlFRRERCMWtlVzVoYldsamJHbHpkR1Z1WlhJdFkyRkFNV\
      FkzTnpJNQpNekU1TVRBZUZ3MHlNekF5TWpVd01qUTJNekZhRncwek16QXlNakl3TWpRMk16RmFNR\
      Vl4SERBYUJnTlZCQW9UCkUyUjVibUZ0YVdOc2FYTjBaVzVsY2kxdmNtY3hKakFrQmdOVkJBTU1IV\
      1I1Ym1GdGFXTnNhWE4wWlc1bGNpMWoKWVVBeE5qYzNNamt6TVRreE1Ga3dFd1lIS29aSXpqMENBU\
      VlJS29aSXpqMERBUWNEUWdBRVk3WkZxYVp2a0k3NQoyRG1vSTFEa2ZyZG5hNG5PWllZK2V1NVlzQ\
      Tg2ZFRpK0VPd2RWb1c1dm5va2tsQ0RDZE5zMGhjT1NEWnBhVVgzClhjMXRmWm15MEtOQ01FQXdEZ\
      1lEVlIwUEFRSC9CQVFEQWdLa01BOEdBMVVkRXdFQi93UUZNQU1CQWY4d0hRWUQKVlIwT0JCWUVGR\
      UlyN0Vkakl3MStCUmc4UDFuYW5XWi9IZ080TUFvR0NDcUdTTTQ5QkFNQ0EwY0FNRVFDSUR1bgorT\
      0tHQldlUE5DYkRXQ2JrdTdaVXRncmpBa1MvU1RXSGpLc2tJa3lUQWlCSktXSWRHT0NqR1d1dmhRa\
      VFDWnlHCkZRdm4rclBiMENhU2hZak1PSmNzSUE9PQotLS0tLUVORCBDRVJUSUZJQ0xxxxxxxxxx"
- name: "masternode-worker-node01"
  cluster:
    server: "https://192.168.56.201:6443"
    certificate-authority-data: "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM0VENDQ\
      WNtZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFTTVJBd0RnWURWUVFERXdkcmRXSmwKT\
      FdOaE1CNFhEVEl6TURJeU5UQXpNVEl3TjFvWERUTXpNREl5TWpBek1USXdOMW93RWpFUU1BNEdBM\
      VVFQXhNSAphM1ZpWlMxallUQ0NBU0l3RFFZSktvWklodmNOQVFFQkJRQURnZ0VQQURDQ0FRb0NnZ\
      0VCQU5SM3BWck0wWFJ0CnV2RVlEb1JFMFA4M1BSVjl0eXNxRkNzSmpoYktCM1RBMmlKT3plbXdFM\
      mVxOFI4ZFU4Q2lzbjk1T3dTSEF0QTkKSlBKS1BGNGc5SDJXVk1JQUlhNXFFZE40cGxOdWU3bHN3d\
      EdIODZqVktodGJmRlF1MlF6cS9Ub2JKNko1Tks3QgpPUG40YnJhaHVkY0tDQ1NzSzM5Y2VGeS9HU\
      29KOFNpd3VIU3V5dzNhRmhoc1Y4dXdXMEdyNEhSNDdBcnkydXpmCk85TDZ2K3F4bWhUUk05K09DN\
      FZ3UE1DcW9ReTA5d1VWU054UVZRRmsyV3pOcHRYQ3F3cUFhd2tMRVpVUG9tUDYKbzkzd2RCVlY3d\
      UN3QTBhV3ZFcDkwQnFkZmU4UGFiVDI3b0Q3R05vS3dpUHFXZ1lpT0lPSGsrcHBVSnFEOFU2RgpXc\
      EQ3UEt4TnpZRUNBd0VBQWFOQ01FQXdEZ1lEVlIwUEFRSC9CQVFEQWdLa01BOEdBMVVkRXdFQi93U\
      UZNQU1CCkFmOHdIUVlEVlIwT0JCWUVGSnFSSUJtaGtIRmY0UGh6R1pESGhEblkwdXcxTUEwR0NTc\
      UdTSWIzRFFFQkN3VUEKQTRJQkFRQWtYaHVRcTNRU0xhQzRMUTQ4dG5yeFBVNFpYMVh0b1MyUEtjU\
      09jdzAwLzIwTkIzczhyRGF2SVhqUApWYzZ6aEIxTWsvVTJYYU9PTjZ6bWYyM2tjcE5UMWFRVTFjd\
      HFxYi9yQUt0dWNjR1I2ODVENEtPeVpQLy9MSDB6CmtJektQK0RzVDU1c3hobUlzTjdMNlMyNzBHc\
      npWZnVFQmsyMG9Yc3Q3Zkh4VlFVTHhSSy91NmQvVmZPNkxpM1kKRTdjeVg1U1pkaWxBRERmZktUM\
      Dg0MkNzQ0V5c1EyT3ptbWhWcUNFdHhQRTFBLzBBSDdSRW5zeG9BTGQxWG1QRApSZks4RXZTWGNHa\
      XBDNGlieWQ2NFVibndIQnk3OHp0eit4MzlTbUhOdDFESTZsWEQyN1J6U1NQK1VpZDdZMWdpCmxvT\
      G54SEg1NjhIVnVyTm45VVRmV05oalRYNzQKLS0tLS1FTkQgQ0VSVElGSUNBVxxxxxxxxxx="

users:
- name: "masternode"
  user:
    token: "kubeconfig-user-cxtwrfxgql:cx6tmfj84pqrgm24crgcws8hl96jvkt86wm6v4mvxhjzbh4749qg7n"


contexts:
- name: "masternode"
  context:
    user: "masternode"
    cluster: "masternode"
- name: "masternode-worker-node01"
  context:
    user: "masternode"
    cluster: "masternode-worker-node01"

current-context: "masternode"

```

### ✏️ <ins>Step 6:</ins>
- Back to the local, open a terminal
- With: 
  - Linux, Ubuntu, MacOS: `$ cd ~/.kube/config` and paste to save the config
  - Windows 10: 
    - Download [latest release v1.26.0](https://dl.k8s.io/release/v1.26.0/bin/windows/amd64/kubectl.exe)
    - Create a folder, name it <ins>**KubeTools**</ins> and copy the `kubectl.exe` into it.
    - Open `C:\Users\%USERNAME%` and make a folder `.kube`

---


# ❗️ part 2: install tools to interac, work with k8s.

## ⚒ important and need to be install (for real)
### 1. update ur system:
```
$ sudo apt-get update -y
$ sudo apt-get upgrade -y
```

### 2. install kubectl:
```
# download the lastest release:
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"


# download the checksum file:
$ curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"


# Validate
$ echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check


# install kubectl
$ sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
$ apt-get install -y kubectl 
```

## ⚒ not important 

### 1. curl and [Homebrew](https://brew.sh)
```
$ sudo apt-get install curl
$ sudo apt-get install apt-transport-https
```

### 2. minikube:
```
# check the virtualization supported onr ur device or not:
$ grep -E --color 'vmx|svm' /proc/cpuinfo


# if u installe it thru the package, u totally can download the binary:
$ curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube


# add it into the env path
$ sudo mkdir -p /usr/local/bin/
$ sudo install minikube /usr/local/bin/


# or use the homebrew:
$ brew install minikube


# check
$ minikube version
```

### 3. kubeadm, kubelet:
```
# update the apt package index and install packages needed to use the k8s `apt` repository:
$ sudo apt-get update
$ sudo apt-get install -y apt-transport-https ca-certificates curl


# download signing key:
$ sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg


# add the k8s apt repository:
$ echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list


# update apt package index, install kubelet, kubeadm and kubectl, and pin their version:
$ sudo apt-get update
$ sudo apt-get install -y kubelet kubeadm kubectl
$ sudo apt-mark hold kubelet kubeadm kubectl
```

---

# ❗️ part 3: install argocd and helm.
## ⚒ [argocd](https://argo-cd.readthedocs.io/en/stable/)

### 1. requirements
- installed kubectl
- have a kubeconfig file (default location `~/.kube/config`)

### 2. install
```
# install
$ kubectl create namespace argocd
$ kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


# download cli. installation instructions can be found via the CLI installation documentation.
$ https://github.com/argoproj/argo-cd/releases/latest. 


# mac, linux and WSL Homebrew:
$ brew install argocd
```

## ⚒ [helm](https://helm.sh/docs)

### 1. from script
```
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
```

### 2. thru package-mng (macos)

```
# from homebrew (macos)
$ brew install helm


# from apt (debian/ubuntu) 
$ curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
$ sudo apt-get install apt-transport-https --yes
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
$ sudo apt-get update
$ sudo apt-get install helm


# from source (linux, macos)
$ git clone https://github.com/helm/helm.git
$ cd helm
$ make
```

---

# ❗️ part 4: [practicing] - deploy a service using helm in

## ⚒ deploy a service with helm

### 1. for example: nginx
```
# To install an NGINX Ingress controller using Helm, first add the nginx-stable repository to helm, then run helm repo update . After we have added the repository we can deploy using the chart nginx-stable/nginx-ingress.
$ helm repo add nginx-stable https://helm.nginx.com/stable
$ helm repo update


# The following command installs the chart with the release name nginx-ingress
$ helm install nginx-ingress nginx-stable/nginx-ingress --set rbac.create=true
```

---

# ❗️ extra: error research
- error: `curl: (60) SSL certificate problem: self signed certificate in certificate chain`
- explain: the new version of rancher now using curl and the command gonna be: 
```

$ curl -fL https://192.168.56.200/system-agent-install.sh | sudo  sh -s - --server https://192.168.56.200 --label 'cattle.io/os=linux' --token kbsl8cbpkz48pxdcr24bz4862fpjqslz98b8sg9b4k774p2jwxbjdz --ca-checksum e45e675a2c76868ec0d39c847fc1a79aeea78e7b56c710396b5b2536113ca85f --etcd --controlplane --worker` 
```

- still trying solving this problem with some ways:

1. replace both the `token` and `checksum` of the old to new script 

=> tick on the `select to skip the TLS verification if your server has a self-signed certificate`

<!--
### 1. on the master node (IP: 192.168.56.200): ffffffff
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
- access to https://192.168.56.200 or https://192.168.56.200/g 

- login and get the password by run the command below and login to setup the cluster (during this step, move to the worker VM)
```
$ docker logs  container-id  2>&1 | grep "Bootstrap Password:"
```
- then `copy config` of the cluster
- cd and paste it into your `~/.kube/config`


### 2. vmbox worker (IP: 192.168.56.201):
- ssh into it.
- _*during the creating cluster step*_: because of rancher will help u to setup the whole entire clusters but in this situation the master and worker are on the same IP so they could be conflict. so in the token u copied from upthere u need to to add the `--address worker_IP` before the `-etcd` 
- thats gonna be:
```
$ sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run  rancher/rancher-agent:v2.7-091ed163cc5c53efc50bd1a580cb4e54fa097e82-head --server https://192.168.56.200/ --token p5zcnnpcb5cx8pg89vkk5nkx8gbzltk9wbkmfjp6rsn9n6kf729vjp --ca-checksum 37bde28c0dc9fbd360146f727ff4b1cd254d9f17490789f93775fb2ce15b58da --address worker_IP --etcd --controlplane --worker
```
- *!!! new error !!!*


```
curl: (60) SSL certificate problem: self signed certificate in certificate chain

#explain: 
the new version of rancher now using curl and the command gonna be: `curl -fL https://192.168.56.200/system-agent-install.sh | sudo  sh -s - --server https://192.168.56.200 --label 'cattle.io/os=linux' --token kbsl8cbpkz48pxdcr24bz4862fpjqslz98b8sg9b4k774p2jwxbjdz --ca-checksum e45e675a2c76868ec0d39c847fc1a79aeea78e7b56c710396b5b2536113ca85f --etcd --controlplane --worker` 


#solve: 
=> replce the `token` and `checksum` 
=> tick on the `select to skip the TLS verification if your server has a self-signed certificate`
```
-->
