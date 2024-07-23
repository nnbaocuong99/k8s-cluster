### <ins>1. On Windows</ins>

Run commands (grab a version and download: (replace `$version` with the specific version)
```css
$version = (Invoke-RestMethod https://api.github.com/repos/argoproj/argo-cd/releases/latest).tag_name
$url = "https://github.com/argoproj/argo-cd/releases/download/" + $version + "/argocd-windows-amd64.exe"
$output = "argocd.exe"

Invoke-WebRequest -Uri $url -OutFile $output
```
Then [add it into `Windows PATH`](https://helpdeskgeek.com/windows-10/add-windows-path-environment-variable/)

<br>

### <ins>2. On Linux</ins>
```css
$ curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
$ sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
$ rm argocd-linux-amd64
```

<br>

### <ins>3. On MacOS</ins>
```css
# Download the latest version with Homebrew:
$ brew install argocd

--------------------------------------------

# Download the specific version With curl:
$ VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
$ curl -sSL -o argocd-darwin-amd64 https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-darwin-amd64

// Replace `VERSION` in the command below with the version of Argo CD you would like to download

# Install:
$ sudo install -m 555 argocd-darwin-amd64 /usr/local/bin/argocd
$ rm argocd-darwin-amd64
```
