<h1 align="center"> ✨ how to install k8s step by step (my research) ✨ </h1> 

[figma file for details](https://github.com/nnbaocuong99/details-k8s-project/tree/main/figma)

---

# ❗️ Part 1: Setup VMBox & Cluster
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
- Download 2 files below, re-name to `Vagrantfile`
- Put each into 2 different folders:
   - [Vagrant-master](https://github.com/nnbaocuong99/details-k8s-project/blob/main/document/vagrantfile-master) for the <ins>*master node*</ins>
   - [Vagrant-worker](https://github.com/nnbaocuong99/details-k8s-project/blob/main/document/Vagrantfile-worker) for the <ins>*worker node*</ins>

### 3. Scripts
- Open 2 terminals each separate folders:
> This is my directory
```
C:\Users\spagbo\Desktop\vmb\master>
C:\Users\spagbo\Desktop\vmb\node>
```
- Run this command in the terminals you've been opened ealier:
```
$ vagrant up
```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222043942-022f202d-065d-49fb-a8b4-8d390b9720f4.png" alt="uvu" width="800">
    <br>
    <br>
</div>


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
- Choose the <ins>**custom**</ins> mode:
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222045349-2a57a602-aa60-4621-ba25-01b6fb166668.png" alt="uvu" width="800">
    <br>
    <br>
</div>

- Set a name then click next, tick on the `etcd` and `control panel` it will show you a script:
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222045781-fed45b98-6a0a-4dc0-ae70-7daa7db23490.png" alt="uvu" width="800">
    <br>
    <br>
</div>

### ✏️ <ins>Step 5:</ins> 
- Copy it and add `--address your_worker_IP` before the `--etcd` and you'll get the final script like this:
```
$ sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run  rancher/rancher-agent:v2.7-091ed163cc5c53efc50bd1a580cb4e54fa097e82-head --server https://192.168.56.200/ --token p5zcnnpcb5cx8pg89vkk5nkx8gbzltk9wbkmfjp6rsn9n6kf729vjp --ca-checksum 37bde28c0dc9fbd360146f727ff4b1cd254d9f17490789f93775fb2ce15b58da --address your_worker_IP --etcd --controlplane --worker
```

### ✏️ <ins>Step 6:</ins>
- SSH into the worker-node: `ssh username@your_ip_address`
- Run`$ sudo su` & `$ docker version`
- Run the copied script 
- Get into the masternode and copy the config file. Its look like this:

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222042743-1cf31c2b-ed01-4eb1-8ef9-45a4de0dd9b4.png" alt="uvu" width="1000">
    <br>
    <br>
</div>


### ✏️ <ins>Step 6:</ins>
- Copy to clipboard or save that config to `.txt` if you need it.
- Paste the config to <ins>**default Kubeconfig**</ins> file connect to the cluster
- Default Kubeconfig location in:

<div align="center">
  1. Linux, Ubuntu:
</div>

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222038197-c05c1c93-b440-4b14-afcf-cbb43a33a7d8.png" alt="uvu" width="200">
    <br>
    <br>
</div>

<div align="center">
  2. Windows:
</div>

> you need to open `C:\Users\%USERNAME%` and make a folder `.kube` and create a file name `config` 

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222041299-5ed55daf-ec51-4cbe-a973-96cc6b7123a7.png" alt="uvu" width="300">
    <br>
    <br>
</div>


<div align="center">
  3. MacOS:
</div>

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222041470-074745c4-39a7-432c-bf3b-3c7ec75ba988.png" alt="uvu" width="200">
    <br>
    <br>
</div>


---


# ❗️ Part 2: install tools to work with k8s
## ⚒ On Windows:

### ✏️ <ins>Scoop</ins>
- Open a PowerShell terminal then run:
```
$ Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
$ irm get.scoop.sh | iex
```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222875034-ca5f633f-37ee-4180-ae9d-c37fb248d745.png" alt="uvu" width="800">
    <br>
    <br>
</div>



### ✏️ <ins>curl</ins>
- Download it from official page: [curl - Download](https://curl.se/download.html)
> or
```
$ scoop install curl
```

### ✏️ <ins>Kubectl</ins>
- Basically run command below | [Scoop](https://scoop.sh/) or [Chocolatey](https://community.chocolatey.org/) installed require
```
$ scoop install kubectl
$ choco install kubernetes-cli
```
> or
- Download [latest release](https://dl.k8s.io/release/v1.26.0/bin/windows/amd64/kubectl.exe)
- Create a folder `C:\Program Files` and name it <ins>**KubeTools**</ins>, copy the downloaded file (<ins>**kubectl.exe**</ins>) into it.
- Add the folder location to the Windows PATH environment variable (optional): 
  - Right click `This PC` -> `Properties` -> `Advanced system settings` -> `Environment variables`
  - In the `System variables` choose `Path` -> `Edit` -> `New` -> `C:\Program Files\KubeTools`
- `cd .\KubeTools\` and run the curl command below to download the kubectl command:
```
$ curl -LO https://dl.k8s.io/release/v1.21.0/bin/windows/amd64/kubectl.exe  
```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222653672-2035576f-732b-4355-9553-a9b08ce9ce46.png" alt="uvu" width="800">
    <br>
    <br>
</div>

### ✏️ <ins>Helm</ins>
- Commands line to install | [Scoop](https://scoop.sh/) or [Chocolatey](https://community.chocolatey.org/) installed require
```  
$ scoop install helm
$ choco install kubernetes-helm
```
- If you prefer Chocolatey here is the [Helm package](https://community.chocolatey.org/packages/kubernetes-helm) build to Chocolatey

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222875084-4fc95ebd-88b4-44e6-8ed1-85ef43c08b26.png" alt="uvu" width="800">
    <br>
    <br>
</div>


## ⚒ On Linux, Ubuntu:

### ✏️ <ins>curl</ins>

- Update the system, get latest stable version:
```
$ sudo apt update
$ sudo apt upgrade
```

- Type the following `apt command` or `apt-get command`
```
$ sudo apt install curl
```

### ✏️ <ins>Kubectl</ins>
- Update your system:
```
$ sudo apt-get update -y
$ sudo apt-get upgrade -y
```

- Download the lastest release:
```
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

- download the checksum file and validate:
```
$ curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
$ echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
```

- Install kubectl
```
$ sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
$ apt-get install -y kubectl 
```

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222874944-c71242a7-d782-4c8e-818f-5f41e1b8c665.png" alt="uvu" width="800">
    <br>
    <br>
</div>


### ✏️ <ins>Helm</ins>
- From the Binary Releases:
  - Download your [desired version](https://github.com/helm/helm/releases)
  - Unpack it `tar -zxvf helm-v3.0.0-linux-amd64.tar.gz`
  - Find the helm binary in the unpacked directory, and move it to its desired destination (mv linux-amd64/helm /usr/local/bin/helm)


- From Apt (Debian/Ubuntu)
```
$ curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
$ sudo apt-get install apt-transport-https --yes
$ echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
$ sudo apt-get update
$ sudo apt-get install helm
```

- From Script
```
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
```
> Helm now has an installer script that will automatically grab the latest version of Helm and install it locally. You can fetch that script, and then execute it locally. It's well documented so that you can read through it and understand what it is doing before you run it.

## ⚒ On MacOS:
- <ins>*On MacOS there is a package manager similar to Scoop or Chocolatey,... on Windows called Homebrew and highly recommended by so many users*</ins>
- You can simply install it on your MacOS by run this command:
```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223048033-004366f1-e936-4579-854e-48810e7c8664.png" alt="uvu" width="700">
    <br>
    <br>
</div>
- And if you choosing others installation method. or the version selection:
  - `amd` for Intel chip
  - `arm` for Apple Silicon chip

### ✏️ <ins>curl</ins>
- Run the command below in the terminal:
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
```
- If a password is required after running the command enter your Mac's user password to continue. Wait until the installation finish. 

- Run the command below in the terminal:
```
$ brew install curl
```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223296377-fa65775b-001d-47ad-84e3-713f05e8e899.png" alt="uvu" width="700">
    <br>
    <br>
</div>



### ✏️ <ins>Kubectl</ins>

- Run the installation command:
```
$ brew install kubectl
$ brew install kubernetes-cli
```

> or

- Download the latest release:
```
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
```

- Downlad the checksum & validate:
```
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl.sha256"
$ echo "$(cat kubectl.sha256)  kubectl" | shasum -a 256 --check
``` 

- Make the kubectl binary executable.
```
$ chmod +x ./kubectl
```

- Move the kubectl binary to a file location on your system PATH.
```
$ sudo mv ./kubectl /usr/local/bin/kubectl
$ sudo chown root: /usr/local/bin/kubectl
```

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223046588-e725db8c-3561-4244-9147-6e4b76e39dbf.png" alt="uvu" width="800">
    <br>
    <br>
</div>

### ✏️ <ins>Helm</ins>
- Install Helm with Homebrew:
```
$ brew install helm
$ brew install kubernetes-helm
```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223296514-6cd8f144-0090-4ded-92f6-3add3addbe4e.png" alt="uvu" width="800">
    <br>
    <br>
</div>




- From script: 
```
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
```

- From Source (also for Linux)
```
$ git clone https://github.com/helm/helm.git
$ cd helm
$ make
```

---

# ❗️ part 3: argocd



kubectl patch svc argocd-server -n argocd -p "{\"spec\": {\"type\": \"LoadBalancer\"}}"











<!--

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
