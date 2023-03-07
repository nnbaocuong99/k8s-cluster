# ❗️ extra: error research
### Error 1: 
1. How it came: `curl: (60) SSL certificate problem: self signed certificate in certificate chain`

2. Explain: 
- Setup the node worker with the new version of Rancher now using curl and the command gonna be: 
```
curl -fL https://192.168.56.200/system-agent-install.sh | sudo  sh -s - --server https://192.168.56.200 --label 'cattle.io/os=linux' --token kbsl8cbpkz48pxdcr24bz4862fpjqslz98b8sg9b4k774p2jwxbjdz --ca-checksum e45e675a2c76868ec0d39c847fc1a79aeea78e7b56c710396b5b2536113ca85f --etcd --controlplane --worker
```

3. How to solve it:
- Replce the `token` and `checksum` 
- Tick on the `select to skip the TLS verification if your server has a self-signed certificate`

---

### Error 2: 
1. How it came: `error: unable to parse "'{spec:": yaml: found unexpected end of stream`

<div align="center">
    <img src="https://user-images.githubusercontent.com/100349044/223314345-128751ab-cc33-4abf-b8d8-ba6db40a2b35.png" alt="uvu" width="800">
    <br>
    <br>
</div>


2. Explain: 
- I am using below command to patch new storage to volumeclaimtemplate:
```
 $ minikube kubectl -- --namespace default patch pvc elasticsearch-data-elasticsearch-data-0 --patch '{\"spec\": {\"volumeClaimTemplate\": {\"requests\": {\"storage\": \"2Gi\"}}}}'
```

3. How to solve it:
- Use this command: 
```
$ kubectl patch svc argocd-server -n argocd -p "{\"spec\": {\"type\": \"LoadBalancer\"}}"
```
