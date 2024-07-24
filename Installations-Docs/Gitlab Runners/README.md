# How to <ins>Install</ins> and <ins>Register</ins> Gitlab Runner?

### On Windows
#### Remember to follow the prompts to enter your GitLab `instance URL`, `registration token`, and other details.

- Create a folder on your system, for example, `C:\GitLab-Runner`.
- Download the GitLab Runner binary for Windows from the official GitLab website. Place the downloaded binary in the folder you created.
- Make sure to restrict write permissions on the GitLab Runner directory and executable to prevent unauthorized changes.
- Open an elevated command prompt (Run as Administrator).
- Navigate to the folder where you placed the binary and run the following command to register the runner:
   ```ruby
   $ cd C:\GitLab-Runner
   $ .\gitlab-runner.exe register
   ```
- Run the following commands to install and start GitLab Runner as a service:
  ```ruby
  $ .\gitlab-runner.exe install
  $ .\gitlab-runner.exe start
   ```
- Ensure the runner is running by checking the Windows Services or using the command:
  ```ruby
  $ .\gitlab-runner.exe status
  ```

<br>

### On Linux
- Download the GitLab Runner binary for your Linux distribution from the official GitLab website.
- Move the binary to `/usr/local/bin` and give it executable permissions:
  ```ruby
  $ sudo mv gitlab-runner /usr/local/bin/gitlab-runner
  $ sudo chmod +x /usr/local/bin/gitlab-runner
  ```
- Register the Runner: Run the following command to register the runner:
  ```ruby
  $ sudo gitlab-runner register
  ```
- Run the following commands to install and start GitLab Runner as a service:
  ```ruby
  $ sudo gitlab-runner install
  $ sudo gitlab-runner start
  ```
- Ensure the runner is running by checking its status:
  ```ruby
  $ sudo gitlab-runner status
  ```

<br>

### On MacOS
#### Do the same steps with Linux





















<!--
### On Windows
- Create a folder in your system `C:\GitLab-Runner`
- Download the binary file for [64-bit](https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-windows-amd64.exe) or [32-bit](https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-windows-386.exe), put it into the folder
- Install GitLab Runner as a service and start it: `gitlab-runner start`

<br>

### On Linux, Ubuntu
#### With me im using this way, in addition to have another way is [manual install](https://docs.gitlab.com/runner/install/linux-manually.html)
```css
$ curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
$ sudo apt-get install gitlab-runner
```

<br>

### On MacOS
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
-->
