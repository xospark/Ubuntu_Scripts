#!/bin/bash
######################################################################################################
#    .oooooo..o ooooooooo.         .o.       ooooooooo.   oooo    oooo    ooooooo  ooooo   .oooooo.   
#  d8P'    `Y8 `888   `Y88.      .888.      `888   `Y88. `888   .8P'      `8888    d8'   d8P'  `Y8b  
#  Y88bo.       888   .d88'     .8"888.      888   .d88'  888  d8'          Y888..8P    888      888 
#  ` "Y8888o.   888ooo88P'     .8' `888.     888ooo88P'   88888[             `8888'     888      888 
#       `"Y88b  888           .88ooo8888.    888`88b.     888`88b.          .8PY888.    888      888 
#  oo     .d8P  888          .8'     `888.   888  `88b.   888  `88b.       d8'  `888b   `88b    d88' 
#  8""88888P'  o888o        o88o     o8888o o888o  o888o o888o  o888o    o888o  o88888o  `Y8bood8P'  
######################################################################################################                                                                                                 
                                                                                                  
swap_dir="/swapfile"

sudo dd if=/dev/zero of=$swap_dir bs=1024 count=6291456
sudo chmod 600 $swap_dir
sudo mkswap $swap_dir
sudo swapon $swap_dir
echo "$swap_dir none swap sw 0 0" | sudo tee -a /etc/fstab
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
echo "vm.vfs_cache_pressure=80" | sudo tee -a /etc/sysctl.conf
echo "vm.dirty_ratio=10" | sudo tee -a /etc/sysctl.conf
echo "vm.dirty_background_ratio=5" | sudo tee -a /etc/sysctl.conf
echo "vm.dirty_background_ratio=5" | sudo tee -a /etc/sysctl.conf
echo "vm.dirty_background_ratio=5" | sudo tee -a /etc/sysctl.conf
echo "vm.dirty_background_ratio=5" | sudo tee -a /etc/sysctl.conf
echo "vm.dirty_background_ratio=5" | sudo tee -a /etc/sysctl.conf

echo "net.ipv4.conf.default.log_martians=1" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.conf.default.accept_source_route=0" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.conf.all.send_redirects=0" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.conf.all.log_martians=1" | sudo tee -a /etc/sysctl.conf
echo "kernel.sysrq=0" | sudo tee -a /etc/sysctl.conf
echo "kernel.kptr_restrict=2" | sudo tee -a /etc/sysctl.conf
echo "kernel.dmesg_restrict=1" | sudo tee -a /etc/sysctl.conf
echo "kernel.core_uses_pid=1" | sudo tee -a /etc/sysctl.conf
echo "fs.suid_dumpable=0" | sudo tee -a /etc/sysctl.conf
echo "net.ipv6.conf.default.accept_redirects=0" | sudo tee -a /etc/sysctl.conf
echo "net.ipv6.conf.all.accept_redirects=0" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.conf.default.accept_redirects=0" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_redirects=0" | sudo tee -a /etc/sysctl.conf

swapon --show
