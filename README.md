###### <div align="center"> © Spagbo 8 Aug, 2022 // 2022-2024 </div>

<br>

# ❗️ Introducing

### ✨<ins>***1. Credit & Usage // Sumary***</ins>:
***Credit & Usage***
- This project is written by me and wouldn't be possible without the hard work and contributions of the following individuals:
  - [@QuocNVC](https://github.com/quoc9x) - Bug fixes and enhancements.
  - [@TruongLM](https://github.com/lmt2407) - VM script writer.
  - Special thanks to the open-source community for their support and inspiration!
- This project is for ***<mark><ins>learning-purposes Only***</mark></ins>, meant for educational and non-commercial use. Feel free to study, learn from it.
- This project has ***<mark><ins>No Unauthorized Copying***</mark></ins>. Please refrain from directly copying or using it for any commercial or production purposes without proper authorization.
- If you find this project helpful, consider giving credit by linking back to this repository. Mentioning it in your own project's documentation or `README` is appreciated.

***Sumary***
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
- [Known errors](https://github.com/nnbaocuong99/details-k8s-project/tree/main/error-report): Error while doing the project will be listed here. Feel free to submit your problem at [Issues](https://github.com/nnbaocuong99/k8s/issues) tab.

<br>

### ✨<ins>***4. Table of contents***</ins>: 
- ***❗️Introducing***
    - Sumary & Credit
    - Tools in project
    - Updating features
<br>

- ***❗️Guides step by step***
    - [Setup VMbox](https://github.com/nnbaocuong99/k8s/edit/main/README.md#-setup-vmbox)
         - Install tools
         - Create VM 
    - [Setup Rancher, cluster](https://github.com/nnbaocuong99/k8s/edit/main/README.md#-setup-rancher-cluster)
         - SSH master node
         - Rancher version guides
         - Work // masternode
         - Work // workernode
         - Config files
         - [tips](https://github.com/nnbaocuong99/k8s/edit/main/README.md#how-to-find-your-kubeconfig-file)    
    - [Setup ArgoCD](https://github.com/nnbaocuong99/k8s/edit/main/README.md#-argocd--setup-pipelines)
         - Install ArgoCD
         - Setup steps & [Port explain](https://github.com/nnbaocuong99/k8s/edit/main/README.md#bonus--lemme-explain-for-you-real-quick)
         - Work steps
    - [CI/CD](https://github.com/nnbaocuong99/k8s/edit/main/README.md#-cicd)
         - Get to know more about CI/CD
         - CI
         - Pics
         - CD
---

<br>

# ❗️ Guides step by step
### ✨ <ins>Setup VMBox</ins>
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
> - *Take your own risk before using if you modify my script. recommend things in the script I suggest you to modify: OS version, `vm.network`, `hostname`, `password`.*
> - *Remember to put your files in **2 separate folders**.*
> - *Remember to re-name them and change the file type to <mark>`Vagrantfile`</mark> not the <mark>`.txt`</mark> or any.*

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

### ✨ <ins>Setup Rancher, Cluster</ins>

> [!warning]
> - *Please, always use the root user at first.*
>   ```json
>   $ sudo su
>   ```
> - *Your `username` and `ip_address` based on how you modify your `Vagrantfile`. (check [this](https://github.com/nnbaocuong99/k8s/edit/main/README.md#2-create-virtual-machines) for more).*
> - *Remember to double-check if Docker has been installed yet.*
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
- Do the same these [steps](https://github.com/nnbaocuong99/k8s/edit/main/README.md#1) and SSH into the `worker-node.`
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
- You can also set the `KUBECONFIG` environment variable or use the `--kubeconfig` flag with `kubectl` to specify a custom location. Check [docs](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/#:~:text=To%20set%20environment%20variables%2C%20include%20the%20env%20or,value%20directly%20for%20each%20variable%20that%20you%20name.) for more.
<br>

> [!tip]
> ### *How to find your Kubeconfig file?*
>
> ##### *1. On Linux, Ubuntu and MacOS*
> ###### • *You can check if it exists by running: `ls ~/.kube/config`*
> ###### • *Default config file storage at:*
> </div>
> <div align="left">
>    <img src="https://user-images.githubusercontent.com/100349044/222038197-c05c1c93-b440-4b14-afcf-cbb43a33a7d8.png" alt="uvu" width="200">
>    <br>
>    <br>
> </div>
>
> <br>
>
> ##### *2. On Windows*
> ###### • *Manual method: Open `C:\Users\%USERNAME%` and create a folder <mark>`.kube`</mark> & a file name <mark>`config`</mark> inside it.*
> ###### • *In advance, you can create or verify its existence using: `dir %USERPROFILE%\.kube\config`*
> ###### • *Default config file storage at:*
> <div align="left">
>     <img src="https://user-images.githubusercontent.com/100349044/222041299-5ed55daf-ec51-4cbe-a973-96cc6b7123a7.png" alt="uvu" width="300">
>     <br>
>     <br>
> </div>

#### <ins>6:</ins>
Prepare for next steps, Make sure that you're installed all things below, follow this installation guides with your OS
- [***Linux, Ubuntu***](https://github.com/nnbaocuong99/details-k8s-project/tree/main/Installations-Docs/Linux%2C%20Ubuntu)
- [***Windows***](https://github.com/nnbaocuong99/details-k8s-project/tree/main/Installations-Docs/Windows)
- [***MacOS***](https://github.com/nnbaocuong99/details-k8s-project/tree/main/Installations-Docs/MacOS)
---

<br>

### ✨ <ins>ArgoCD // Setup Pipelines</ins>
#### <ins>1:</ins>
***Install ArgoCD on your OS first:***

- On [***Windows***](https://github.com/nnbaocuong99/details-k8s-project/tree/main/Installations-Docs/ArgoCD-CLI).
- On [***MacOS***](https://github.com/nnbaocuong99/details-k8s-project/tree/main/Installations-Docs/ArgoCD-CLI).
- On [***Linux, Ubuntu***](https://github.com/nnbaocuong99/details-k8s-project/tree/main/Installations-Docs/ArgoCD-CLI).

<br>

#### <ins>2:</ins>
***Setup steps***
- After insalled, you must create a namespace for it by running:
  ```json
  $ kubectl create namespace argocd
  $ kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  ```

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223318199-ee2a4732-5e44-400b-896a-dd7fcb69bf71.png" alt="uvu" width="900">
    <br>
    <br>
</div>

- <mark>***Run this command if you need, If everything went well, skip this step***</mark>, change the ArgoCD-server service type to LoadBalancer:

  <details>
  <summary><samp>&#9776;</samp> click to expand </summary>
      
  ```css
  $ kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
  ```
  
  <div align="center">
      <img src="https://user-images.githubusercontent.com/100349044/223318334-d9d6ba33-d86a-4f4f-9bb8-0fd26dfe0477.png" alt="uvu" width="800">
      <br>
      <br>
  </div>
  </details>

<br>

- Make sure you expose the services before using it by running:
  ```json
  $ kubectl port-forward svc/argocd-server -n argocd 8080:443
  ```

  <div align="center">
      <img src="https://user-images.githubusercontent.com/100349044/223347531-b88c2478-a3e7-422c-bb2c-fcffa8de5ad2.png" alt="uvu" width="600">
      <br>
      <br>
  </div>

<br>

> [!note] 
> ### 🌟BONUS // Lemme explain for you real quick
> #### Depending on the project you’re working on and the context, you’ll choose one of the two options to ensure your services run smoothly and avoid errors
> #### Simply in this project, Im gonna get direct into with `node IP`
> 
> <br>
>
> #### Port-forwarding
> - *Allows you to access services running inside a Kubernetes cluster from your local machine.*
> - *When you run `kubectl port-forward svc/argocd-server -n argocd 8080:443`, it sets up a proxy so that you can communicate with the ArgoCD server through port 8080 on your local machine.*
> - *Use Case: Useful for debugging, testing, or accessing the ArgoCD API server without exposing it externally.*
> - *Access: You can then access the ArgoCD API server using `localhost:8080`.*
> 
> <br>
>
> #### Node-port
> - *NodePort exposes a service on a specific port on each node in the cluster.*
> - *When you create a NodePort service, Kubernetes allocates a port (usually in the range 30000-32767) on each node. Requests to that port are forwarded to the service.*
> - *Typically used for exposing services externally, especially when you need to access them from outside the cluster.*
> - *You can access the ArgoCD service using the node’s IP address and the assigned NodePort.*
> 
> <br>
>
> #### In short
> - *In the case of NodePort, once your cluster starts, the specified port is automatically exposed, ensuring seamless external access to your services.*
> - *Port forwarding is more suitable for local development and debugging, while NodePort is better for exposing services externally. Choose the approach that aligns with your use case!*

<br>

#### <ins>3:</ins>
***Work steps***
- Use Kubectl to get your port:
  ```json
  $ kubectl get service -n argocd
  ```

  <div align="center">
      <img src="https://github.com/nnbaocuong99/k8s/assets/100349044/02c2de93-1373-417a-b0c4-6b038e261af1" alt="uvu" width="700">
      <br>
      <br>
  </div>

- Once you got your port (in this case, `32294` was mine. Copy and merge it with your `worker-node` IP, paste it into your browser like this
  <div align="center">
      <img src="https://github.com/nnbaocuong99/k8s/assets/100349044/540ce773-be5a-4798-8b57-37a5d2208210" alt="uvu" width="550">
      <br>
      <br>
  </div>

  <details>
  <summary> URL </summary>
      
  ```ruby
  # the URL
  https://192.168.56.201:32294/login?return_url=https%3A%2F%2F192.168.56.201%3A32294%2Fapplications
  ```
  
  </details>

<br>

- Retrieve your ArgoCD password for next steps // <ins>*(Install [**based64**](https://github.com/RickStrahl/Base64) If you haven’t)*</ins>
  ```json
  $ kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  ```

  <div align="center">
      <img src="https://user-images.githubusercontent.com/100349044/223346388-26210ddf-a562-4a62-95d5-fd89dda63c8e.png" alt="uvu" width="900">
      <br>
      <br>
  </div>

- Once the command exposed, Navigate to `ttps://localhost:8080` and login.
  ```css
  admin
  6vH7QkjCQFiPPHPZ
  ```
  
  <div align="center">
      <img src="https://user-images.githubusercontent.com/100349044/223347770-c13a1d22-3f17-4bec-9f88-cbdced92a4db.png" alt="uvu" width="1000">
      <br>
      <br>
  </div>

- Logged in successfully, and this is what your result looks like

  <div align="center">
      <img src="https://user-images.githubusercontent.com/100349044/223376752-e0cc22de-5383-4307-9afc-370050b4e4c1.png" alt="uvu" width="1000">
      <br>
      <br>
  </div>

---

<br>

### ✨ <ins>CI/CD</ins>


#### <ins>***1. Before you start // Get to know more***</ins>
- Please make sure you understand and successfully follow all these steps up there until now.
- Beginner? Read this [CI/CD Explained](https://about.gitlab.com/topics/ci-cd/) on Gitlab official website.
- Or read my [Workflows Explaination](https://github.com/nnbaocuong99/k8s/tree/main/workflows) in short if these websites make you feel complicated.

<br>

#### <ins>***2. CI***</ins>
- Create and account on [Gitlab](https://gitlab.com/) and make a repository.
- Use the content in my repository if you have already cloned it before or conversely, push your own content.
- <ins>(Optional)</ins> In case you using your contents, all you need to do is create a file in the root location of your repository called `.gitlab-ci.yml`. Copy the script below into it and `commit` to trigger the `Pipelines`. Then let it automatically start.

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

<br>

> [!note]
> - *You totally can use others platform like Github or what ever. But in this case, I highly recommend you to use Gitlab because the CI/CD tools from Gitlab is extremely easy to use.*
> - *`.yml` file is basically a recipe that specifies how GitLab should execute pipelines.*

<br>

***Add Variables***
- In your repository: `Settings`/`CI/CD`/`Variables`/`Add Variables`
- `Edit` and fill as:
  ```css
  $DOCKER_USERNAME = your Docker username
  $DOCKER_PASSWD   = your Docker password
  ```
  <div align="center">
      <img src="https://github.com/user-attachments/assets/9733685b-998a-4e3c-a647-64a668dff26f" alt="uvu" width="290">
      <br>
      <br>
  </div>

- Result
  <div align="center">
      <img src="https://user-images.githubusercontent.com/100349044/224215639-21e60eda-d930-456c-bdbd-969c0e46d1cf.png" alt="uvu" width="780">
      <br>
      <br>
  </div>

<br>

***Register a Runner***
- To make sure that your pipelines run correctly you must use `Runners` to run the jobs. [Read this](https://docs.gitlab.com/runner/) for more if this is your first time hear about it?  
- Heading to `Repository Settings`/`CI/CD`/`Runners` and you can choose between: <ins>**Validate account and use shared runners**</ins> or <ins>**Register an individual runner**</ins>.
- Up to you, you can skip or follow this guide [How to Install and Register Gitlab runners](https://github.com/nnbaocuong99/k8s/edit/main/Installations-Docs/Gitlab%20Runners)
- This is how runners look when they have successfully registered:

  <div align="center">
      <img src="https://user-images.githubusercontent.com/100349044/225208767-177fac85-a0d9-49f4-8fd9-d99d75557f00.png" alt="uvu" width="900">
      <br>
      <br>
  </div>

  <div align="center">
       <img src="https://user-images.githubusercontent.com/100349044/225203073-2c221aef-6760-47bf-9586-ca0c85699d78.png" alt="uvu" width="350">
  </div>

<br>

#### <ins>***3. Some photos taken during the Pipline process.***</ins>

<details>
<br>

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/227698573-3d136065-f088-4119-92d5-68b6612879d2.png" alt="uvu" width="1000"> </br> <sup>Pic 1. Commit anything to trigger the piplines</sup>
    <br>
    <br>
</div>

<br>

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/227698536-de871019-3875-48c7-b9d5-4b0c44e4ef17.png" alt="uvu" width="300"> </br> <sup>Pic 2. Jobs running</sup>
</div>

<br>

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225229115-79c6f3f0-bfde-4ab4-9411-93cf1222e60c.png" alt="uvu" width="1000"> </br> <sup>Pic 3. Logs</sup>
    <br>
    <br>
</div>

<br>

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225229048-78b48381-08c5-4bf9-ac1a-58fc0791f02e.png" alt="uvu" width="800"> </br> <sup>Pic 4. Pipeline finished</sup>
    <br>
    <br>
</div>

<br>

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225229079-9bb9b104-3d78-4d2f-aa42-8ae581b482f8.png" alt="uvu" width="800"> </br> <sup>Pic 5. Check around or your Docker Hub to make sure that this job is running correctly</sup>
    <br>
    <br>
</div>

<br>
</details>

<br>

#### <ins>***4. CD***</ins>

***Connect Reposiory***
- Now, get back to the tab where you left off with ArgoCD logged in.
- Click <mark>`Settings`</mark> on the left menu <mark>`Connect Repo`</mark>, fill your information and connect.

  <div align="center">
      <img src="https://user-images.githubusercontent.com/100349044/225237699-b14b9456-18ec-41d9-aa5d-f78f2c24c269.png" alt="uvu" width="1000">
      <br>
      <br>
  </div>

***Create Chart and values files***
- Get back to your repo, create 2 files name `Chart.yaml` and `values.yaml`.
  - `chart.yaml` might look like
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
    <br>
    
  - `values.yaml` might look like <ins>*(you can replace the `repository`, `tag` to what you desired)*</ins>
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

***Create an application***


> [!caution]
> - *Check this [docs](https://argo-cd.readthedocs.io/en/stable/getting_started/#6-create-an-application-from-a-git-repository) for more if you want advanced settings and CLI deploy method*
> - *The application name should have <mark>`-`</mark> or <mark>`_`</mark> between every single word.*
> - *`https://gitlab.com/nnbaocuong99/k8s` is MY REPOSITORY link. Replace it with your own repository link.*
> - ***Destination** should be default `https://kubernetes.default.svc` and `argocd`*
> - *<ins>If everything is done correctly, the</ins> `values.yaml` <ins>file will be automatically detected</ins>*

- Get back to the main screen of the ArgoCD and `+ NEW APP` or `CREATE APPLICATION` and fill the information, configurations.
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225269790-5d818597-62fa-4f41-b405-99250245c5f3.jpg" width="700" />
    <br>
    <br>
</div>

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225269903-9aab72cf-748f-468d-93eb-d0eca293449a.jpg" width="700" /> 
    <br>
    <br>
</div>

<br>

- If your result look like this, congrats! you just created your app.
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225292869-a7a4f0ed-dff6-49b5-92bd-cf6ab9481075.png" alt="uvu" width="700"> </br> <sup>If you have more than 1 app. They will appear here.</sup>
    <br>
    <br>
</div>

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225295383-0907a37e-2200-4f1b-98e8-835346de2355.jpg" alt="uvu" width="1000"> </br> <sup>When you open your app. It gonna look like this.</sup>
    <br>
    <br>
</div>

<br>

- Now, just simply click on `Sync` button and your app is ready to work
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225504635-192335ff-7f10-4349-9cb5-00482fb79611.png" alt="uvu" width="900">
    <br>
    <br>
</div>

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/225504816-f23fa704-cb48-46a7-a26c-0e8b556cd0e8.jpg" alt="uvu" width="400">
    <br>
    <br>
</div>

---

<br>

***<div align="center"> If you've arrived this far, congratulations! you’ve completed a comprehensive exercise on the CI/CD using the GitOps + ArgoCD, Helm approach. I hope my exercise has been helpful to you. Thank you for taking time out of your day to, read these guides, my project. And the most important thing is good luck on your CI/CD pipelines! </div>***

***<div align="right"> ✨ *Best wishes*, </br> 𝓃𝓃𝒷𝒸,</div>***

###### <div align="right"> Upcoming project (WIP) [Create Database and how to work with it on k8s](https://github.com/nnbaocuong99/Database)</div>
