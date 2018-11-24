# Dependency

### Install `unzip`, `tree`, `iftop`, `make`
```bash
sudo apt install build-essential tree unzip iftop -y
```

### Install Docker CE 18.06 [(reference)](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
Add current user to docker group after installation
```bash
sudo usermod -aG docker $USER
```

### Install `docker-compose` command :  
  * x86 : docker-compose 1.22.0 [(reference)](https://docs.docker.com/compose/install/)  
  * armv6 : 
```bash
sudo apt install python-pip
pip install docker-compose
```

### Reboot
```bash
sudo reboot
```
