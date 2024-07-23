## ⚒ What we should install to work with k8s on MacOS:


### <ins>1. Quick guide</ins>
- <ins>*On Windows there is a package manager similar to Scoop or Chocolatey,... on MacOS it called [Homebrew](https://brew.sh/) and highly recommended by so many users*</ins>

> [!tip]
> ##### And if you choosing others installation method. or the version selection:
> - <mark>`amd`</mark> for ***Intel chip***
> - <mark>`arm`</mark> for ***Apple Silicon chip***

- You can simply install it on your MacOS by run this command:
  ```css
  $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223048033-004366f1-e936-4579-854e-48810e7c8664.png" alt="uvu" width="600">
    <br>
    <br>
</div>

<br>

### <ins>2. curl</ins>
Run the commands below in the terminal:
```css
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
$ brew install curl
```
<div align="center">
     <img src="https://user-images.githubusercontent.com/100349044/223296377-fa65775b-001d-47ad-84e3-713f05e8e899.png" alt="uvu" width="650">
     <br>
     <br>
</div>

<br>

### <ins>3. Kubectl</ins>
Run the installation commands:
```css
# Install
$ brew install kubectl
$ brew install kubernetes-cli

# Or download the latest release:
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"

# Downlad the checksum & validate:
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl.sha256"
$ echo "$(cat kubectl.sha256)  kubectl" | shasum -a 256 --check

#Make the kubectl binary executable.
$ chmod +x ./kubectl

#Move the kubectl binary to a file location on your system PATH.
$ sudo mv ./kubectl /usr/local/bin/kubectl
$ sudo chown root: /usr/local/bin/kubectl
```

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223046588-e725db8c-3561-4244-9147-6e4b76e39dbf.png" alt="uvu" width="1000">
    <br>
    <br>
</div>

### <ins>4. Helm</ins>
Install Helm with Homebrew:
```css
$ brew install helm
$ brew install kubernetes-helm
```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223296514-6cd8f144-0090-4ded-92f6-3add3addbe4e.png" alt="uvu" width="700">
    <br>
    <br>
</div>

From script: 
```css
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
```

From Source (also for Linux)
```css
$ git clone https://github.com/helm/helm.git
$ cd helm
$ make
```
