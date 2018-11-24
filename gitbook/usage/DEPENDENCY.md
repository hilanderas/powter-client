# Dependency

1. Install [Docker CE 18.06](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

	**Add current user to docker group**
```bash
sudo usermod -aG docker $USER
```

2. Install `docker-compose` command :  
  * x86 : docker-compose 1.22.0 [reference](https://docs.docker.com/compose/install/)  
  * armv6 : 
```bash
sudo apt install python-pip
pip install docker-compose
```

3. Install `unzip`, `tree`, `iftop`, `make`
```bash
sudo apt install build-essential tree unzip iftop -y
```

4. Reboot
```bash
sudo reboot
```
