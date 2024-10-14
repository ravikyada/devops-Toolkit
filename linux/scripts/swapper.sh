#! /usr/bin/bash
read -p "Give size of swap you wants to create:" usr_input
echo "Your swap memory will be create of size : $usr_input"

sudo fallocate -l $usr_input /swapfile
sudo chmod 600 /swapfile

sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon --show

sudo cp /etc/fstab /etc/fstab.bak
echo '/swap.sh none swap sw 0 0' | sudo tee -a /etc/fstab

sudo sysctl vm.swappiness=10
sudo sysctl vm.vfs_cache_pressure=50
echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.conf