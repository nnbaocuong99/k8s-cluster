# How to install Gitlab Runner?


## On Windows✨
1. Create a folder in your system `C:\GitLab-Runner`

2. Download the binary file for [64-bit](https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-windows-amd64.exe) or [32-bit](https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-windows-386.exe), put it into the folder in `1`

3. In that folder open a  `PowerShell` or `Terminal`  and run an elevated command prompt:

5. [Register a runner](https://docs.gitlab.com/runner/register/index.html)

6. Install GitLab Runner as a service and start it: `gitlab-runner start`
> You can either run the service using the Built-in System Account (recommended) or using a user account.


## On Linux, Ubuntu✨
> With me im using this way, in addition to have another way is [manual install](https://docs.gitlab.com/runner/install/linux-manually.html)
1. Add the official GitLab repository:
```bash
$ curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
```

2. Install the latest version of GitLab Runner, or skip to the next step to install a specific version:
```bash
$ sudo apt-get install gitlab-runner
```

3. [Register a runner](https://docs.gitlab.com/runner/register/index.html)


## On MacOS✨
1. Download the binary:

2. For Intel - amd / Apple Silicon - arm
```bash
$ sudo curl --output /usr/local/bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-darwin-amd64"
$ sudo curl --output /usr/local/bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-darwin-arm64"
```

You can download a binary for every available version as described in Bleeding Edge - download any other tagged release.

3. Permissions to execute:
```bash
$ sudo chmod +x /usr/local/bin/gitlab-runner
```

4. As the user who will run the runners, [Register a runner](https://docs.gitlab.com/runner/register/index.html). (Open a terminal and switch to the current user `su - <username>`


5. Install GitLab Runner service and start it:
```bash
$ cd ~
$ gitlab-runner install
$ gitlab-runner start
```

6. Reboot your system.

---


# How to register a runner? 


## On Windows✨
## On Linux, Ubuntu✨
## On MacOS✨
