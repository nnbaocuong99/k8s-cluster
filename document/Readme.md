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
