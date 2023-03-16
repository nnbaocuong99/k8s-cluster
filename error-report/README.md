# ❗️ extra: error research



### ❌ Error 1:  
#### 1. <ins>*How it came:*</ins>
- Cant SSH into VMbox using VScode
#### 2. <ins>*Explain:*</ins>
- Didnt create an user on `Home` So its unable to SSh into it.
#### 3. <ins>*How to solve it:*</ins>
> Replace `your-username-go-here` with the name you're expecting in the command below:
```
$ useradd --comment 'ur-username-go-here' --create-home your-username-go-here --shell /bin/bash
```


---



### ❌ Error 2: 
#### 1. <ins>*How it came:*</ins>
- Cant change the services type to `Load Balancer` | error: `curl: (60) SSL certificate problem: self signed certificate in certificate chain`
#### 2. <ins>*Explain:*</ins>
- Setup the node worker with the new version of Rancher now using curl and the command gonna be: 
```
$ curl -fL https://192.168.56.200/system-agent-install.sh | sudo  sh -s - 
--server https://192.168.56.200 
--label 'cattle.io/os=linux' 
--token kbsl8cbpkz48pxdcr24bz4862fpjqslz98b8sg9b4k774p2jwxbjdz 
--ca-checksum e45e675a2c76868ec0d39c847fc1a79aeea78e7b56c710396b5b2536113ca85f 
--IP_address--etcd --controlplane --worker
```
#### 3. <ins>*How to solve it:*</ins>
1. Replce the `token` and `checksum` 
2. Tick on the `select to skip the TLS verification if your server has a self-signed certificate`


---


### ❌ Error 3: 
#### 1. <ins>*How it came:*</ins>
- `error: unable to parse "'{spec:": yaml: found unexpected end of stream`
<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223314345-128751ab-cc33-4abf-b8d8-ba6db40a2b35.png" alt="uvu" width="800">
    <br>
    <br>
</div>

#### 2. <ins>*Explain:*</ins>
- Missing the `\` on a path following like this this command
```
$ minikube kubectl -- --namespace default patch pvc elasticsearch-data-elasticsearch-data-0 
--patch '{\"spec\": {\"volumeClaimTemplate\": {\"requests\": {\"storage\": \"2Gi\"}}}}'
```

#### 3. <ins>*How to solve it:*</ins>
- Final command used in repo: 
```
$ kubectl patch svc argocd-server -n argocd -p "{\"spec\": {\"type\": \"LoadBalancer\"}}"
```


---


### Error 4: 
#### 1. <ins>*How it came:*</ins>
![image](https://user-images.githubusercontent.com/100349044/225235601-65ca51cd-98de-422c-b071-21e3b8bcda98.png)

#### 2. <ins>*Explain:*</ins>
- Wrong application name
#### 3. <ins>*How to solve it:*</ins>
- Create an application should be not any space and also with `-`
