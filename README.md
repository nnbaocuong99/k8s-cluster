# ❗️ Introducing

### ✨<ins>***1. Sumary***</ins>:
- This is my research report and project template on how to install a Kubernetes (k8s) cluster and set up a CI/CD pipeline for a Java project. It’s designed with beginners in mind, especially those who are new to Docker and want to learn about backend development and CI/CD pipelines.
- In this project, I’m using both Windows and MacOS (similar to Linux). Keep in mind that the images in your project might look slightly different with mine, but dw abt it. Take your time to research, as they serve the same function.
- I’d also love to hear others’ opinions on what might be missing or not listed in this project. Remember, though, that this is just a template. Feel free to create your own unique content pls don’t stalk, copy, or claim someone else’s work as your own. Let’s avoid that kind of behavior! 😊
- I’d like to express my sincere thanks to [@QuocNVC](https://github.com/quoc9x) and [@TruongLM](https://github.com/lmt2407) for their invaluable assistance. It’s a pleasure to collaborate with such talented individuals on this project.

<br>

### ✨<ins>***2. Tools, things I'm using for this project***</ins>:
| Name           | Official Website                           | Note                                                                |
|:--------------:|:-------------------------------------------|:--------------------------------------------------------------------|
| **Kubernetes** | https://kubernetes.io                      | also need [K3s](https://k3s.io), RKE (checking the logstack by ELK) |
| **Rancher**    | https://rancher.com/docs/                  |                                                                     |
| **Apache**     | https://maven.apache.org                   |                                                                     | 
| **Docker**     | https://www.docker.com                     |                                                                     | 
| **Helm**       | https://helm.sh                            |                                                                     | 
| **ArgoCD**     | https://argo-cd.readthedocs.io/en/stable/  |                                                                     |
| **VmBox**      | https://www.virtualbox.org                 |                                                                     |

<br>

| OS               | Package Manager         |  Official Website                                                    |
|:----------------:|:------------------------|:---------------------------------------------------------------------|
| Windows          | Winget <br> Chocolately | https://github.com/microsoft/winget-cli <br> https://chocolatey.org/ |
| MacOS            | Homebrew                | https://brew.sh/                                                     |
| Ubuntu (v16.04)  | APT                     |                                                                      |

<br>

### ✨<ins>***3. Updating features: (This project has been discontinued.)***</ins>:
- [Mindmap](https://github.com/nnbaocuong99/details-k8s-project/tree/main/figma) and more example images for this project (WIP)
- [Knowns error](https://github.com/nnbaocuong99/details-k8s-project/tree/main/error-report): Error while doing the project will be listed here. Feel free to submit your problem at [Issues](https://github.com/nnbaocuong99/k8s/issues) tab.
---

<br>

# ❗️ Guides step by step
### ✨ <ins>Setup VMBox & Cluster</ins>
#### 1. Install:
- [Git](https://git-scm.com/)
- [curl](https://curl.se/)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) <sup>recommend v6.0. (its easier to setup and provider)</sup>
- [Vagrant](https://developer.hashicorp.com/vagrant/downloads) 
- Package Manager: Based on your OS check [this](https://github.com/nnbaocuong99/k8s/edit/main/README.md#2-tools-things-im-using-for-this-project) for more

#### 2. Create virtual machines:
- In [document](https://github.com/nnbaocuong99/k8s/tree/main/document) folder download 2 script files named <mark>`Vagrantfile-masternode`</mark> and <mark>`Vagrantfile-workernode`</mark>.
- You totally can create yourself one, copy my scripts into yours if you wanna more features for your VM.

<br>

> [!caution]
> - Take your own risk before using if you modify my script. recommend things in the script I suggest you to modify: OS version, `vm.network` (IP), `hostname`, `password`
> - Remember to put your files in **2 separate folders**.
> - Remember to re-name them and change the file type to <mark>`Vagrantfile`</mark> not the <mark>`.txt`</mark> or any.

<div align="center"> 
    <img src="https://github.com/user-attachments/assets/3660636e-4882-421c-b44d-5debcd681028" alt="uvu" width="250"> </br> <sup>Vagrantfile on Windows will look like this</sup>
    <br>
    <br>
</div>

- Open 2 terminals each separate folders then run the command below. Until your VM finished these setup steps, you'll that they're running like in the image below.
  ```json
  $ vagrant up
  ```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222043942-022f202d-065d-49fb-a8b4-8d390b9720f4.png" alt="uvu" width="800"> <!--</br> <sup>Pic.2 Result of 2 VMs</sup>-->
    <br>
    <br>
</div>

<br>

### ✨ <ins>Setup VMBox & Cluster</ins>

> [!warning]
> - Please, always use the root user at first.
>   ```json
>   $ sudo su
>   ```
> - Your `username` and `ip_address` based on how you modify your `Vagrantfile`. (check [this](https://github.com/nnbaocuong99/k8s/edit/main/README.md#2-create-virtual-machines) for more).
> - Remember to double-check if Docker has been installed yet.
>   ```json
>   $ docker version
>   ```

#### <ins>1:</ins>
- SSH into the `master-node`
  ```json
  $ ssh username@your_ip_address
  ```

#### <ins>2:</ins>
- Based on your OS, choose your Rancher version on [rancher/rancher-Tags](https://hub.docker.com/r/rancher/rancher/tags) <sup>(take a look on [version guides](https://github.com/nnbaocuong99/k8s/tree/main/version%20guides) here if you don't know how to)</sup>
- Copy and replace `tag` with the version you choose below:
  ```json
  $ docker run -d --name=rancher-server --restart=unless-stopped -p 80:80 -p 443:443 --privileged rancher/rancher:tag
  ```

- Wait until the image successfully pulled then run these commands to get your container id.
  ```json
  $ docker ps
  $ sudo docker ps -aqf "name=containername"`
  ```
- Replace `container id` you just got into this, then save <ins>***THE RED LINE***</ins> code thats your password!
  ```bash
  $ docker logs  container-id  2>&1 | grep "Bootstrap Password:"
  ```

#### <ins>3:</ins>
- Navigate to the `IP Address` (*base on your config*) of your `masternode`
  ```yaml
  https://192.168.56.200
  https://192.168.56.200/g (recommend this one because its friendly for begginers)
  ```
- Login to the Rancher with username:`admin` and the `password` your just got it earlier. <!--(In this case `admin / J-L1fXH0OwibH60HlcVv` was mine)-->  
- Choose <ins>**Custom**</ins> mode
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222045349-2a57a602-aa60-4621-ba25-01b6fb166668.png" alt="uvu" width="800"> </br> <sup>Setting 1</sup>
    <br>
    <br>
</div>

- Set a name for it, setting like the image below and copy the scripts.
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222045781-fed45b98-6a0a-4dc0-ae70-7daa7db23490.png" alt="uvu" width="800"> </br> <sup>Setting 2</sup>
    <br>
    <br>
</div>

#### <ins>4:</ins>
- Add <mark>`--address worker_IP`</mark> (replace `worker_IP` with your real `workernode IP`) before the <mark>`--etcd`</mark> and you'll get the final script like this:
```json
$ sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run  rancher/rancher-agent:v2.7-091ed163cc5c53efc50bd1a580cb4e54fa097e82-head --server https://192.168.56.200/ --token p5zcnnpcb5cx8pg89vkk5nkx8gbzltk9wbkmfjp6rsn9n6kf729vjp --ca-checksum 37bde28c0dc9fbd360146f727ff4b1cd254d9f17490789f93775fb2ce15b58da --address your_worker_IP --etcd --controlplane --worker
```
- Do the same these [steps](https://github.com/nnbaocuong99/k8s/edit/main/README.md#1) and SSH into the worker-node.`
- Run the copied script up there.

#### <ins>5:</ins>
- Get back to your masternode click the button `Kubeconfig File` on the right top corner to open your cluster config. It will look like this:

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/222042743-1cf31c2b-ed01-4eb1-8ef9-45a4de0dd9b4.png" alt="uvu" width="1000">
    <br>
    <br>
</div>

- Always save your configuration files and name them, as they are important. If you have more than 5 clusters, keep in mind that `kubectl` can only connect to one cluster at a time.
- Find the <mark><ins>**default Kubeconfig**</ins></mark> file in your device, paste it into it to connect and work with your cluster.
 
<br>

> [!tip]
> ### How to find your Kubeconfig file?
>
> ##### 1. On Linux, Ubuntu and MacOS
> ###### • You can check if it exists by running: `ls ~/.kube/config`
> ###### • Default config file storage at:
> </div>
> <div align="left">
>    <img src="https://user-images.githubusercontent.com/100349044/222038197-c05c1c93-b440-4b14-afcf-cbb43a33a7d8.png" alt="uvu" width="200">
>    <br>
>    <br>
> </div>
>
> ##### 2. On Windows
> ###### • Manual method: Open `C:\Users\%USERNAME%` and create a folder <mark>`.kube`</mark> & a file name <mark>`config`</mark> inside it. 
> ###### • In advance, you can create or verify its existence using: `dir %USERPROFILE%\.kube\config`
> ###### • The default location is
> <div align="left">
>     <img src="https://user-images.githubusercontent.com/100349044/222041299-5ed55daf-ec51-4cbe-a973-96cc6b7123a7.png" alt="uvu" width="300">
>     <br>
>     <br>
> </div>
>
> ##### You can also set the `KUBECONFIG` environment variable or use the `--kubeconfig` flag with `kubectl` to specify a custom location. Check [docs](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/#:~:text=To%20set%20environment%20variables%2C%20include%20the%20env%20or,value%20directly%20for%20each%20variable%20that%20you%20name.) for more.

#### <ins>6:</ins>
##### Follow this installation guides with your OS
- [***Linux, Ubuntu***](https://github.com/nnbaocuong99/details-k8s-project/tree/main/Installations-Docs/Linux%2C%20Ubuntu)
- [***Windows***](https://github.com/nnbaocuong99/details-k8s-project/tree/main/Installations-Docs/Windows)
- [***MacOS***](https://github.com/nnbaocuong99/details-k8s-project/tree/main/Installations-Docs/MacOS)
---

<br>

### ✨ <ins>Install ArgoCD and Setup Pipelines</ins>
#### <ins>1:</ins>
- Install ArgoCD on [***Windows***](https://github.com/nnbaocuong99/details-k8s-project/tree/main/Installations-Docs/ArgoCD-CLI).
- Install ArgoCD on [***MacOS***](https://github.com/nnbaocuong99/details-k8s-project/tree/main/Installations-Docs/ArgoCD-CLI).
- Install ArgoCD on [***Linux, Ubuntu***](https://github.com/nnbaocuong99/details-k8s-project/tree/main/Installations-Docs/ArgoCD-CLI).

<br>

#### <ins>2:</ins>
- Create namespace
  ```json
  $ kubectl create namespace argocd
  $ kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  ```

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223318199-ee2a4732-5e44-400b-896a-dd7fcb69bf71.png" alt="uvu" width="800">
    <br>
    <br>
</div>


#### 2. Expose and port forward✨
- Change the ArgoCD-server service type to LoadBalancer:
```bash
$ kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223318334-d9d6ba33-d86a-4f4f-9bb8-0fd26dfe0477.png" alt="uvu" width="800">
    <br>
    <br>
</div>


- Run the port forward command to expose the services:
```bash
$ kubectl port-forward svc/argocd-server -n argocd 8080:443
```
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223347531-b88c2478-a3e7-422c-bb2c-fcffa8de5ad2.png" alt="uvu" width="500">
    <br>
    <br>
</div>


> **Warning** 

You can choose between 2 easier way for you is
1. Change from `port-forward` to `node-port` (you can do a research because im not gonna using it in this project)

2. Use the port to get direct into it with `node-IP` *in this case this is gonna be*
- Run the following command to get your port:
```ruby
kubectl get service -n argocd
```

<div align="center">
    <img src="https://github.com/nnbaocuong99/k8s/assets/100349044/02c2de93-1373-417a-b0c4-6b038e261af1" alt="uvu" width="700">
    <br>
    <br>
</div>

- In this case, my result - the port is: `32294` copy it and merge with your node IP: 
  
![image](https://github.com/nnbaocuong99/k8s/assets/100349044/540ce773-be5a-4798-8b57-37a5d2208210)

```html
https://192.168.56.201:32294/login?return_url=https%3A%2F%2F192.168.56.201%3A32294%2Fapplications
```



#### 3. Access✨
- Once the command exposed, you can access to https://localhost:8080 and it will require to login with `admin` and `password`
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223347770-c13a1d22-3f17-4bec-9f88-cbdced92a4db.png" alt="uvu" width="1000">
    <br>
    <br>
</div>


- Back to local terminal and get argocd password (**based64** installed recommend) by run the command
```shell
$ kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223346388-26210ddf-a562-4a62-95d5-fd89dda63c8e.png" alt="uvu" width="800">
    <br>
    <br>
</div>

- In this case, this is the result
> username: `admin` | password: `6vH7QkjCQFiPPHPZ`

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223376752-e0cc22de-5383-4307-9afc-370050b4e4c1.png" alt="uvu" width="1000">
    <br>
    <br>
</div>

---

<br>

## ❗️ Part 4: CI/CD 🟠
> <ins>**First of all**</ins> , check [this](https://www.geeksforgeeks.org/what-is-ci-cd/) to get to know more about CI/CD before you start it
#### *In this part I'll show my result and how to setup also finish the CI/CD project. Lets go!*

<details>
<summary><samp>&#9776;</samp> Click to expand </summary>

### ⚒ CI

#### ✏️ <ins>Step 1:</ins>
***Setup and account***

- Create and account on [Gitlab](https://gitlab.com/)
> You totally can use others platform like Github or what ever, but in this case i highly recommend to use Gitlab because the CI/CD tool from Gitlab is extremely easy to use, all you need to do is create a file in the root location of your repository called `.gitlab-ci.yml`. This file is basically a recipe for how Gitlab should execute pipelines.
- Create a repository, push your content or use the content in this project.
- If you're already cloned this project but there is no file called `.gitlab-ci.yml` Create one and copy this content below into it. 
```yaml
stages:
  - build

build-image:
  stage: build
  image: docker:latest
  services:
    - docker:dind
  rules:
  before_script:
    - docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWD
  script:
    - >
      docker build
      --build-arg DOCKER_USERNAME=$DOCKER_USERNAME
      --build-arg DOCKER_PASSWD=$DOCKER_PASSWD
      -t $DOCKER_USERNAME/demo-gitlabci:1.0 .
    - docker push $DOCKER_USERNAME/demo-gitlabci:1.0
```
- Commit, push your code again and `Pipelines` will automatically start.


#### ✏️ <ins>Step 2:</ins>
***Add Variables***
- In the Repo: `Settings` -> `CI/CD` -> `Variables` -> `Add Variables`
- Add this:
  - `$DOCKER_USERNAME` = your Docker username
  - `$DOCKER_PASSWD`= your Docker password

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/224215639-21e60eda-d930-456c-bdbd-969c0e46d1cf.png" alt="uvu" width="734">
    <br>
    <br>
</div>


#### ✏️ <ins>Step 3:</ins>
***Register a Runner***
- To make sure that your pipelines run correctly you must use `Runners` to run the `jobs`. First time hear about it? `GitLab Runner` is an application that works with GitLab CI/CD to run jobs in a pipeline ([See more](https://docs.gitlab.com/runner/)). Go to`Repository Settings` -> `CI/CD` -> `Runners` thenn you'll will see that you have 2 ways:
  - Validate your account and use shared runners.
  - Register an individual runner to run your jobs.

- To <ins>*install*</ins> Gitlab Runners on your OS follow [this](https://github.com/nnbaocuong99/details-k8s-project/blob/main/Installations-Docs/Gitlab%20Runners/README.md) guide.
- To <ins>*register*</ins> Gitlab Runners on your OS follow [this](https://github.com/nnbaocuong99/details-k8s-project/tree/main/Installations-Docs/Gitlab%20Runners%20Register) guide.

> *When your runner has been successfully registered. It will look like this*
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225208767-177fac85-a0d9-49f4-8fd9-d99d75557f00.png" alt="uvu" width="1000">
    <br>
    <br>
</div>
 <img src="https://user-images.githubusercontent.com/100349044/225203073-2c221aef-6760-47bf-9586-ca0c85699d78.png" alt="uvu" width="430">


#### ✏️ <ins>Step 4:</ins>
***Run the Pipeline***
- Commit your code or make changes anh the Pipeline will auto start itself
- This is a few pic i took during it: 

> 1. Runners in action
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/227698536-de871019-3875-48c7-b9d5-4b0c44e4ef17.png" alt="uvu" width="300">
    <img src="https://user-images.githubusercontent.com/100349044/227698573-3d136065-f088-4119-92d5-68b6612879d2.png" alt="uvu" width="700">
    <br>
    <br>
</div>


> 2. Logs and whats happening
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225229115-79c6f3f0-bfde-4ab4-9411-93cf1222e60c.png" alt="uvu" width="1100">
    <br>
    <br>
</div>

> 3. When the Pipeline finished it will look like this:
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225229048-78b48381-08c5-4bf9-ac1a-58fc0791f02e.png" alt="uvu" width="800">
    <br>
    <br>
</div>

> 4. You can check around or your [Docker Hub](https://hub.docker.com/) to make sure that this job is running correctly
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225229079-9bb9b104-3d78-4d2f-aa42-8ae581b482f8.png" alt="uvu" width="700">
    <br>
    <br>
</div>

<br>

### ⚒ CD

<br>

#### ✏️ <ins>Step 5:</ins>
***Connect Reposiory***
- Now, scroll back and continue from the step where we got the password and login into ArgoCD.
- On the left column menu bar: `Settings` -> `Connect Repo` then just fill it with your information and connect. (Id still recommend using Gitlab)
- Alright, when you are all set. It will look like this

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225237699-b14b9456-18ec-41d9-aa5d-f78f2c24c269.png" alt="uvu" width="1000">
    <br>
    <br>
</div>

#### ✏️ <ins>Step 6:</ins>
***Create Chart and values files***
- Back to your repo and create 2 files name `Chart.yaml` and `values.yaml`. Take a look on my [Chart](https://github.com/nnbaocuong99/details-k8s-project/blob/main/demo-app/Chart.yaml) and [values](https://github.com/nnbaocuong99/details-k8s-project/blob/main/demo-app/values.yaml) files.
- Or copy the content and make your own: 
> Chart.yaml | replace the `name` to what you desired
```yaml
apiVersion: v2
name: demo-app
description: A Helm chart for Kubernetes

# A chart can be either an 'application' or a 'library' chart.
#
# Application charts are a collection of templates that can be packaged into versioned archives
# to be deployed.
#
# Library charts provide useful utilities or functions for the chart developer. They're included as
# a dependency of application charts to inject those utilities and functions into the rendering
# pipeline. Library charts do not define any templates and therefore cannot be deployed.
type: application

# This is the chart version. This version number should be incremented each time you make changes
# to the chart and its templates, including the app version.
# Versions are expected to follow Semantic Versioning (https://semver.org/)
version: 0.1.0

# This is the version number of the application being deployed. This version number should be
# incremented each time you make changes to the application. Versions are not expected to
# follow Semantic Versioning. They should reflect the version the application is using.
# It is recommended to use it with quotes.
appVersion: "1.16.0"
```

> values.yaml | replace the `repository`, `tag` to what you desired
```yaml
# Default values for demo-app.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: 1

image:
  repository: nnbaocuong99/details-k8s-project
  pullPolicy: Always
  # Overrides the image tag whose default is the chart appVersion.
  tag: "1.0"

imagePullSecrets: []
nameOverride: ""
fullnameOverride: ""

serviceAccount:
  # Specifies whether a service account should be created
  create: true
  # Annotations to add to the service account
  annotations: {}
  # The name of the service account to use.
  # If not set and create is true, a name is generated using the fullname template
  name: ""

podAnnotations: {}

podSecurityContext: {}
  # fsGroup: 2000

securityContext: {}
  # capabilities:
  #   drop:
  #   - ALL
  # readOnlyRootFilesystem: true
  # runAsNonRoot: true
  # runAsUser: 1000

service:
  type: NodePort
  port: 80

ingress:
  enabled: false
  className: ""
  annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  hosts:
    - host: chart-example.local
      paths:
        - path: /
          pathType: ImplementationSpecific
  tls: []
  #  - secretName: chart-example-tls
  #    hosts:
  #      - chart-example.local

resources:
  # We usually recommend not to specify default resources and to leave this as a conscious
  # choice for the user. This also increases chances charts run on environments with little
  # resources, such as Minikube. If you do want to specify resources, uncomment the following
  # lines, adjust them as necessary, and remove the curly braces after 'resources:'.
  limits:
    cpu: 100m
    memory: 128Mi
  requests:
    cpu: 100m
    memory: 128Mi

autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80
  # targetMemoryUtilizationPercentage: 80

nodeSelector: {}

tolerations: []

affinity: {}
```

#### ✏️ <ins>Step 7:</ins>
***Create an application***
- Now lets get to the final step, back to the main screen of the ArgoCD and click on `+ NEW APP` or `CREATE APPLICATION`
- Fill your information into it like this and make sure that's correct.
- A few things to pay attentions on it:
  - The application name should have `-` or `_` between every single word` 
  - Replace the `https://gitlab.com/nnbaocuong99/k8s` with your repo link.
  - **Destination** should be default `https://kubernetes.default.svc` and `argocd`
  - <ins>***If everything is done correctly, the</ins> `values.yaml` <ins>file will be automatically detected***</ins>

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225269790-5d818597-62fa-4f41-b405-99250245c5f3.jpg" width="500" />
    <img src="https://user-images.githubusercontent.com/100349044/225269903-9aab72cf-748f-468d-93eb-d0eca293449a.jpg" width="500" /> 
    <br>
    <br>
</div>

- Click on `Create` and if you see the result like this, congrats! you just created your app. And what it gonna do?.. details in the second pic. 

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225292869-a7a4f0ed-dff6-49b5-92bd-cf6ab9481075.png" alt="uvu" width="800">
    <br>
    <br>
</div>

> details in the app
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225295383-0907a37e-2200-4f1b-98e8-835346de2355.jpg" alt="uvu" width="1000">
    <br>
    <br>
</div>

- Last step, now just simply click on `Sync` button and your app will become like this: 
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225504635-192335ff-7f10-4349-9cb5-00482fb79611.png" alt="uvu" width="1000">
    <br>
    <br>
</div>

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225504816-f23fa704-cb48-46a7-a26c-0e8b556cd0e8.jpg" alt="uvu" width="500">
    <br>
    <br>
</div>

<br>

</details>

<br>

## ❗️ Part 5: [Create Database and how to work with it on k8s](https://github.com/nnbaocuong99/Database) (WIP - Coming soon)


<br>

---

<br>

***If you've arrived this far, thank you for taking time out of your day to, read these guides, my project. And the most important thing is good luck on your CI/CD pipelines!***

✨ *Best wishes*,
𝓃𝓃𝒷𝒸,





<!--
> [!tip]
> ### How to find your Kubeconfig file?
>
> ##### 1. On Linux, Ubuntu:
> ###### • You can check if it exists by running:
> ```json
> $ ls ~/.kube/config.
> ```
> ###### • Default config file storage at:
> </div>
> <div align="left">
>    <img src="https://user-images.githubusercontent.com/100349044/222038197-c05c1c93-b440-4b14-afcf-cbb43a33a7d8.png" alt="uvu" width="200">
>    <br>
>    <br>
> </div>
>
> <br>
>
> ##### 2. On Windows
> ###### • You need to open `C:\Users\%USERNAME%` and create a folder `.kube` & a file name `config` as a manual method. Verify its existence using: 
> ```json
> $ dir %USERPROFILE%\.kube\config.
> ```
> ###### • The default location is
> <div align="left">
>     <img src="https://user-images.githubusercontent.com/100349044/222041299-5ed55daf-ec51-4cbe-a973-96cc6b7123a7.png" alt="uvu" width="300">
>     <br>
>     <br>
> </div>
>
>
> ##### 3. On MacOS:
> <div align="left">
>    <img src="https://user-images.githubusercontent.com/100349044/222041470-074745c4-39a7-432c-bf3b-3c7ec75ba988.png" alt="uvu" width="200">
>    <br>
>    <br>
> </div>

-->



<!--
> Explaination
> - `-a:` all.     | Works even if your container is not running.
> - -q: quietmode. | Output only display numeric container IDs.
> - -f: filter.    | Filter output based on conditions provided.

[PowerShell](https://learn.microsoft.com/en-us/powershell/) or basically just [Terminal](https://apps.microsoft.com/store/detail/windows-terminal/)

<h1 align="center"> ✨ how to install k8s step by step </h1> 
https://user-images.githubusercontent.com/100349044/225245044-9004d673-eb69-4ea7-ae61-7d3e5cc1f39b.mp4
<p align='right'> © nnbaocuong99 - Spagbo - https://bio.link/spagbo </p>
  - This is my *Report,Research Repo/Project* about how to install k8s cluster and CI/CD Pipeline for a Java project. This also a good template for a beginners (i think so xD). BTW, huge thanks to [@QuocNVC](https://github.com/quoc9x) and [@TruongLM](https://github.com/lmt2407) for the help 😍
  - <ins>***Firstly***</ins>, imo this will be sufficient requirements for what u will need to learn and do. / also really wanna hear others opinions abt what im missing, or not listed in this project. 
  - <ins>***Secondly***</ins>, heading to the point this is basic CI/CD template project for users who new to docker and starting to learn about backend and CI/CD pipline. This project included: k8s, Docker, helm, Vmbox and vagrant script.
  - <ins>***Last***</ins>, many thanks for reading but one more thing this is template. Remember create your own stuff, DO NOT try to stalk, copy or join into other projects and say thats yours. Thats suck and only losers do it

-->


<!--
![image](https://user-images.githubusercontent.com/100349044/225504635-192335ff-7f10-4349-9cb5-00482fb79611.png)

![photo_2023-03-09_15-47-10](https://user-images.githubusercontent.com/100349044/225504816-f23fa704-cb48-46a7-a26c-0e8b556cd0e8.jpg)
![1](https://user-images.githubusercontent.com/100349044/225269790-5d818597-62fa-4f41-b405-99250245c5f3.jpg)
![photo_2023-03-09_15-39-25](https://user-images.githubusercontent.com/100349044/225295383-0907a37e-2200-4f1b-98e8-835346de2355.jpg)
![2](https://user-images.githubusercontent.com/100349044/225269903-9aab72cf-748f-468d-93eb-d0eca293449a.jpg)

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225248069-39650b53-5079-4268-8f1d-e6e83d8c5b5c.jpg" alt="uvu" width="800">
    <br>
    <br>
</div>

https://user-images.githubusercontent.com/100349044/225245044-9004d673-eb69-4ea7-ae61-7d3e5cc1f39b.mp4
--> 
