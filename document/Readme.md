<h1 align="center"> chi tiet cac buoc cai va setup k8s. </h1> 
- figma file for details: 

---

## install and setup vmbox and cluster:
1. 































































1. Tạo Master VM chạy rancher image:
- copy Vagrantfile-master ra thư mục và đổi tên thành Vagrantfile
- cài đặt: vagrant up

2. Tạo worker VM cài đặt cluster:
- copy Vagrantfile-worker ra thư mục và đổi tên thành Vagrantfile
- cài đặt: vagrant up

3. Chạy rancher image trên master VM:
- SSH vào master VM
- chuyển sang user root: sudo su
- kiểm tra docker đã cài đặt hay chưa: docker version
- chạy rancher image: docker run -d --name=rancher-server --restart=unless-stopped -p 80:80 -p 443:443 --privileged rancher/rancher:v2.7
- truy cập rancher UI: https://IP

4. Tạo cluster trên worker VM:
- truy cập rancher UI
- cấn create cluster
- chọn kiểu custom và làm theo hướng dẫn
- khi chạy rancher agent trên worker vm thêm thuộc tính --address worker_IP
