mkfs;mount,cd /mnt/gentoo;wget -L https://raw.githubusercontent.com/cygauss/cynotes/main/newgen
bash 1.sh
chroot /mnt/gentoo
source /etc/profile
bash 2.sh
env-update && source /etc/profile
bash 3.sh
