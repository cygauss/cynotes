ntpd -q -g
wget -L https://mirrors.bfsu.edu.cn/gentoo/releases/amd64/autobuilds/20230409T163155Z/stage3-amd64-desktop-openrc-20230409T163155Z.tar.xz
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' 
rm /etc/portage/make.conf
cd /etc/portage/
wget -L https://raw.githubusercontent.com/cygauss/cynotes/main/gentoo/make.conf
cd -
mkdir --parents /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run

chroot /mnt/gentoo /bin/bash
source /etc/profile

env-update && source /etc/profile
