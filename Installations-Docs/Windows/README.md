## ⚒ What we should install to work with k8s on Windows:
### <ins>1. Scoop</ins>

Open a PowerShell terminal then run:
```css
$ Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
$ irm get.scoop.sh | iex
```

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222875034-ca5f633f-37ee-4180-ae9d-c37fb248d745.png" alt="uvu" width="1000">
    <br>
    <br>
</div>

<br>

### <ins>2. curl</ins>
Download it from official page: [curl - Download](https://curl.se/download.html)

Or run the command:
```css
$ scoop install curl
```

<br>

### <ins>3. Kubectl</ins>
#### Commands
- Install [Scoop](https://scoop.sh/) or [Chocolatey](https://community.chocolatey.org/)
- Run commands
```css
$ scoop install kubectl
$ choco install kubernetes-cli
```
#### Binary
- Download [latest release](https://dl.k8s.io/release/v1.26.0/bin/windows/amd64/kubectl.exe)
- Create a folder `C:\Program Files` and name it <ins>**KubeTools**</ins>, copy the downloaded file (<ins>**kubectl.exe**</ins>) into it.
- Add the folder location to the Windows PATH environment variable (optional): 
  - Right click `This PC` -> `Properties` -> `Advanced system settings` -> `Environment variables`
  - In the `System variables` choose `Path` -> `Edit` -> `New` -> `C:\Program Files\KubeTools`
- `cd .\KubeTools\` and run the curl command below to download the kubectl command:
```css
$ curl -LO https://dl.k8s.io/release/v1.21.0/bin/windows/amd64/kubectl.exe  
```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222653672-2035576f-732b-4355-9553-a9b08ce9ce46.png" alt="uvu" width="800">
    <br>
    <br>
</div>

### <ins>4. Helm</ins>
- Install [Scoop](https://scoop.sh/) or [Chocolatey](https://community.chocolatey.org/)
- Run commands
```css  
$ scoop install helm
$ choco install kubernetes-helm
```

- If you prefer Chocolatey here is the [Helm package](https://community.chocolatey.org/packages/kubernetes-helm) build to Chocolatey

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222875084-4fc95ebd-88b4-44e6-8ed1-85ef43c08b26.png" alt="uvu" width="1000">
    <br>
    <br>
</div>

