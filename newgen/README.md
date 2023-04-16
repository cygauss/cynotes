wget -L https://raw.githubusercontent.com/cygauss/cynotes/main/newgen/1.sh && bash 1.sh
chroot /mnt/gentoo
source /etc/profile
wget -L https://raw.githubusercontent.com/cygauss/cynotes/main/newgen/2.sh &&bash 2.sh
env-update && source /etc/profile
wget -L https://raw.githubusercontent.com/cygauss/cynotes/main/newgen/3.sh &&bash 3.sh
passwd
