# How to register a runner? 
> You totally can follow the offiical guide [here](https://docs.gitlab.com/runner/register/index.html) if you need it or basiclly follow my steps

- When you open the Repository `Settings` -> `CI/CD` -> `Runners` your will see this

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/224939554-eb48b078-45d9-4cd9-9e1e-e26020f75988.png" alt="uvu" width="734">
    <br>
    <br>
</div>

- For the <ins>**provide the runner**</ins>: most users use `Docker` to executor but I always use `shell` so in this case i will choose `shell` instead of `docker`, just replace it with the type you'll choose.  


## On Windows✨
1. Open a PowerShell or Terminal in `C:\GitLab-Runner`
2. Run command:
```bash
$ .\gitlab-runner.exe register
```
3. Enter GitLab instance URL | `https://gitlab.com/`
4. Enter a description, associated tags, and any optional maintenance for the runner
5. Provide the runner executor, type `shell`


## On Linux, Ubuntu✨
1. Run command:
```bash
$ sudo gitlab-runner register
```
2. Enter GitLab instance URL | `https://gitlab.com/`
3. Enter the token you obtained
4. Enter a description, associated tags, and any optional maintenance for the runner
5. Provide the runner executor, type `shell`


## On MacOS✨
> Install [Docker](https://docs.docker.com/desktop/install/mac-install/) before registering on macOS.

1. Run the following command:
```bash
$ gitlab-runner register
```
2. Enter GitLab instance URL | `https://gitlab.com/`
3. Enter the token you obtained
4. Enter a description, associated tags, and any optional maintenance for the runner
5. Provide the runner executor, type `shell`
