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
                                                                                                  
swap_dir="/swap"
swap_name="swapfile"

if [ "$EUID" -ne 0 ]
then
	echo "not root"
	exit 1
fi

fallocate_status=$(which fallocate >/dev/null 2>&1)

if [ "$?" -ne 0 ]
then
	echo "Please install fallocate"
	exit 1
fi

read -p "Enter size of swap file(Ex: 2GB): " swap_size
read -p "Can I create a swapfile located in /swap, (y)es/(n)o: " choice


if [ "$choice" != "y" ]
then
	read -p "Enter directory to store swap(Ex: /mnt): " swap_dir
fi

fallocate --length $swap_size $swap_dir/$swap_name

chmod 600 $swap_dir/$swap_name

mkswap $swap_dir/$swap_name

read -p "Ready to enable swap (y/n): " choice

if [ "$choice" == "y" ]
then
	swapon $swap_dir/$swap_name
else
	exit 0 
fi

read -p "Enable Swap At Boot(y/n): " choice

if [ "$choice" == "y" ]
then
	echo "$swap_dir/$swap_name swap swap defaults 0 0" >> /etc/fstab
	exit 0
else
	exit 0
fi

sysctl vm.swappiness=10

echo "vm.swappiness=10" >> /etc/sysctl.conf
echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.conf
