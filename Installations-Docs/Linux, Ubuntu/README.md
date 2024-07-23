## ⚒ What we should install to work with k8s on Linux, Ubuntu,...:

### <ins>1. curl</ins>
```css
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install curl
```

<br>

### <ins>2. Kubectl</ins>
```css
# Update your system:
$ sudo apt-get update -y
$ sudo apt-get upgrade -y

# Download the lastest release:
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Download the checksum file and validate:
$ curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
$ echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# Install kubectl
$ sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
$ apt-get install -y kubectl 
```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222874944-c71242a7-d782-4c8e-818f-5f41e1b8c665.png" alt="uvu" width="800">
    <br>
    <br>
</div>

<br>

### <ins>3. Helm</ins>

```css
# From Apt (Debian/Ubuntu)
$ curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
$ sudo apt-get install apt-transport-https --yes
$ echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
$ sudo apt-get update
$ sudo apt-get install helm

#From Script
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
```

- From the Binary Releases:
  - Download your [desired version](https://github.com/helm/helm/releases)
  - Unpack it `tar -zxvf helm-v3.0.0-linux-amd64.tar.gz`
  - Find the helm binary in the unpacked directory, and move it to its desired destination (mv linux-amd64/helm /usr/local/bin/helm)
#### Helm now has an installer script that will automatically grab the latest version of Helm and install it locally. You can fetch that script, and then execute it locally. It's well documented so that you can read through it and understand what it is doing before you run it.

<!--

-->
