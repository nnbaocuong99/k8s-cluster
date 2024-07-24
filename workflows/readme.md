# Workflow explanation for this project.

### 1. About GitOps (Summary with my knowledge about it)
- CI/CD, which stands for <ins>***Continuous Integration and Continuous Delivery/Deployment***</ins>, is a set of practices and tools that streamline the software development process.
**Continuous Integration (CI)** involves <ins>**automatically integrating**</ins> code changes from multiple contributors into a shared repository, where automated builds and tests are run.
This helps catch and resolve integration issues early. **Continuous Delivery (CD)** extends this by <ins>**automatically preparing code changes for release to production**</ins>, while CD takes it a step further by automatically releasing validated changes to production.
Together, these practices enable faster, more reliable software delivery by automating manual processes, improving code quality through consistent testing, and reducing the time between writing code and seeing it live in production.

- DevOps takes this operational framework, which includes best practices used for application development — such as `version control`, `collaboration`, `compliance`, and CI/CD then applies it to automation.

- CI/CD <ins>**pipelines**</ins> help teams deliver software updates more frequently, make it easier to trigger, and allow for tracking commits, following established workflows.

- Read this free e-book [Modernize Your CI/CD](https://github.com/user-attachments/files/16359831/Modernize.Your.CI_CD.pdf) if you want to get to know more in detail.

<br>

### 2. Now, let's break down how each tool fits into this in a GitOps workflow:
#### <ins>Rancher in Kubernetes setup:</ins>
- *A platform can be used for provision and managing Kubernetes clusters across different environments.*
- *The Kubernetes cluster configurations can be stored in Git repositories.*
- *Changes to cluster configurations are made through Git commits and pull requests.*

#### <ins>ArgoCD:</ins>
- *ArgoCD is a declarative, GitOps continuous delivery tool for Kubernetes.*
- *Monitoring Git repositories for changes in application manifests.*
- *Automatically synchronizing the state of the Kubernetes cluster with the desired state defined in Git.*
- *Providing a web UI for visualizing the state of applications and any drift between Git and the cluster.*

#### <ins>Kubectl:</ins>
- *Kubectl is the command-line tool for interacting with Kubernetes clusters.*
- *It's primarily used for read-only operations and debugging.*
- *Direct cluster modifications using kubectl are discouraged, as changes should be made through Git.*

#### <ins>GitLab:</ins>
- *GitLab serves as the Git repository and CI/CD platform. It hosts the Git repositories containing application code, Kubernetes manifests, and infrastructure-as-code.*
- *GitLab CI/CD pipelines can be used to automate testing, building, and potentially triggering deployments.*

#### <ins>Helm:</ins>
- *Helm is a package manager for Kubernetes.*
- *Helm charts (packages of pre-configured Kubernetes resources) are stored in Git.*
- *ArgoCD can deploy applications using these Helm charts.*
- *Helm allows for templating and versioning of Kubernetes manifests, making it easier to manage complex* applications.

#### <ins>Docker:</ins>
- *Docker is used for containerizing applications and code is packaged into Docker images.*
- *These images are referenced in the Kubernetes manifests stored in Git.*
- *The CI/CD pipeline (in GitLab) would typically build and push Docker images to a registry.*

<br>

### <ins>3. Workflow explain:</ins>

- *Developers make changes to application code or Kubernetes manifests and push to GitLab.*
- *GitLab CI/CD pipeline runs tests, builds Docker images, and updates Helm charts or Kubernetes manifests with new image tags.*
- *Changes are committed to the GitOps repository (could be a separate repo or a specific branch).*
- *ArgoCD detects changes in the GitOps repository.*
- *ArgoCD applies these changes to the Kubernetes clusters managed by Rancher.*
- *The entire system state is now reflected in Git, and the clusters are in sync with this desired state.*

<!--
> [!note] 
> ##### This GitOps approach ensures that the entire system is version controlled, easily auditable, and can be quickly rolled back if issues arise. It also allows for better collaboration and review processes through Git's pull request mechanisms.
-->
