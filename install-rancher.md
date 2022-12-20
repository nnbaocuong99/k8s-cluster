1. create VM
 - master: 3 CPU, 4G RAM
 - node: 2 CPU, 2G RAM
 2. install rancher on master VM
 - docker run -d --name=rancher-server --restart=unless-stopped -p 80:80 -p 443:443 --privileged rancher/rancher:v2.7
 3. install cluster:
 - access rancher UI: https://IP
 - run rancher-agent using command, add --address IP's VM
