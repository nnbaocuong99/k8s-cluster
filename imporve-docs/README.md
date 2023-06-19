<h1 align="center"> Usage guide - setup node k8s </h1> 

---

### 1. Request server:
- **Request server to System with the informations included below:**
  - *CPUs:*
  - *RAM capacity:*
  - *OS partition storage capacity:*
  - *Data partition storage capacity:*
  - *IP range of the server assigned to the project:*
  - *SSH user granted Sudo privileges*
  - *Things needs to be checked after receiving the server:*
  - *Compared to the request to the server specifications *
  - *SSH User:*
  - *Installed OS and version:*
  - *Docker*

<br>

> **Warning** You must change your server name similar to the name you use to join the node: `root@name-nodexx`
> - *In this case:*
>   - `name`: name of the project you wanna use, for example: mpos, payment, etc...
>   - `xx`: cardinal numbers of the node
> - Optional: Cài đặt Docker

<br>

## 2. Join server as a worker node of the k8s cluster

### <ins>Basic requirement informations configuration:</ins>

<br>

- **✏️ Config Docker / Command list**

  - Run `crontab -e` and then comment comment: `@reboot sleep 60 && mkdir /data/docker-run -p`
  
  <br>
  
  - Delete `/var/lib/docker`
  ```ruby
  $ rm -rf /var/lib/docker
  ```
  
  <br>

  - Create folder `/data/docker` 
  ```ruby
  $ mkdir /data/docker
  ```

  <br>

  - Create symbolic link `/data/docker to /var/lib`
  ```ruby
  $ ln -s /data/docker /var/lib
  ```

  <br>

  - Create a file name it `daemon.json` then use the content below:
  ```ruby
  $ vi /etc/docker/daemon.json

  #config
  {
  "log-driver": "json-file",
  "log-opts": {
      "max-size": "100m",
      "max-file": "2"
      }
  }
  ```

  <br>

  - Restart Docker: 
  ```ruby
  $ Systemctl restart docker
  ```
  
<br>

- **✏️ Create LVM Disk data:**
  - Create a `PersistentVolume`: 
  ```ruby
  $ pvcreate /dev/disk-name
  ```
  
  <br>

  - Create volume group: 
  ```ruby
  $ vgcreate vg-name /dev/disk-name
  ```
  
  <br>

  - Create logical volume: 
  ```ruby
  $ lvcreate -L size -n lv-name vg-name
  ```
  
  <br>

  - Format logical volume to `ext4`: 
  ```ruby
  $ mkfs.ext4 /dev/vg-name/lv-name
  ```
  
  <br>

  - Mount logical vomune to `/data`:
  ```ruby
  $ mount /dev/vg-name/lv-name /data
  ```
  
  <br>

  - Mount dynamic logical vomune to `/data`:
  ```ruby
  #check id lv: 
  $ blkid
    
  #add dynamic mount:
  $ vi /etc/fstab -> UUID=lv-uuid /data ext4 defaults 0 0
  ```

<br>

- **✏️ Join node to cluster:**
  - Run the command to join the node from Rancher
  - config Tains (optional) for node when the active mode of the node successfully enabled

---

Congrats! you're all set

Thanks for Reading!
