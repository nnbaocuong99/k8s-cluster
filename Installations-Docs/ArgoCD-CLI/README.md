## 1. On Windows✨
- Open a **Powershell**
- Grab a version and download: (replace `$version` with the specific version)
```
$version = (Invoke-RestMethod https://api.github.com/repos/argoproj/argo-cd/releases/latest).tag_name
```

- Then run:
```
$url = "https://github.com/argoproj/argo-cd/releases/download/" + $version + "/argocd-windows-amd64.exe"
$output = "argocd.exe"

Invoke-WebRequest -Uri $url -OutFile $output
```
- Add it into `Windows PATH`

## 2. On Linux✨

- Download: 
```
$ curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
```

- Install and remove the temp file:
```
$ sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
$ rm argocd-linux-amd64
```

## 3. On MacOS✨
- Download the latest version with Homebrew:
```
$ brew install argocd
```

- Download the specific version With curl:
```
$ VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
$ curl -sSL -o argocd-darwin-amd64 https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-darwin-amd64
```
> Replace `VERSION` in the command below with the version of Argo CD you would like to download

- Install:
```
$ sudo install -m 555 argocd-darwin-amd64 /usr/local/bin/argocd
$ rm argocd-darwin-amd64
```
