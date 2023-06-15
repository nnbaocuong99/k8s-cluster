## ⚒ What we should install to work with k8s on MacOS:
- <ins>*On MacOS there is a package manager similar to Scoop or Chocolatey,... on Windows called Homebrew and highly recommended by so many users*</ins>
- You can simply install it on your MacOS by run this command:
```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223048033-004366f1-e936-4579-854e-48810e7c8664.png" alt="uvu" width="600">
    <br>
    <br>
</div>
- And if you choosing others installation method. or the version selection:
  - `amd` for Intel chip
  - `arm` for Apple Silicon chip

### <ins>1. curl</ins>
- Run the command below in the terminal:
```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
```
- If a password is required after running the command enter your Mac's user password to continue. Wait until the installation finish. 

- Run the command below in the terminal:
```bash
$ brew install curl
```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223296377-fa65775b-001d-47ad-84e3-713f05e8e899.png" alt="uvu" width="700">
    <br>
    <br>
</div>



### 2. Kubectl✨

- Run the installation command:
```bash
$ brew install kubectl
$ brew install kubernetes-cli
```

> or

- Download the latest release:
```bash
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
```

- Downlad the checksum & validate:
```bash
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl.sha256"
$ echo "$(cat kubectl.sha256)  kubectl" | shasum -a 256 --check
``` 

- Make the kubectl binary executable.
```bash
$ chmod +x ./kubectl
```

- Move the kubectl binary to a file location on your system PATH.
```bash
$ sudo mv ./kubectl /usr/local/bin/kubectl
$ sudo chown root: /usr/local/bin/kubectl
```

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223046588-e725db8c-3561-4244-9147-6e4b76e39dbf.png" alt="uvu" width="900">
    <br>
    <br>
</div>

### 3. Helm✨
- Install Helm with Homebrew:
```bash
$ brew install helm
$ brew install kubernetes-helm
```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223296514-6cd8f144-0090-4ded-92f6-3add3addbe4e.png" alt="uvu" width="700">
    <br>
    <br>
</div>

- From script: 
```bash
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
```

- From Source (also for Linux)
```bash
$ git clone https://github.com/helm/helm.git
$ cd helm
$ make
```
