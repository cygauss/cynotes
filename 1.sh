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
mount /dev/nvme2n1p2 /boot
emerge-webrsync
emerge --update --deep --newuse @world
emerge cpuid2cpuflags
echo "*/* $(cpuid2cpuflags)" > /etc/portage/package.use/00cpu-flags
echo "Asia/Chongqing" > /etc/timezone
emerge --config timezone-data
echo "en_SG.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
eselect locale set 4
env-update && source /etc/profile
emerge linux-firmware
USE="symlink" emerge gentoo-sources
emerge genkernel
genkernel --mountboot --save-config --install all
echo cygen > /etc/hostname
emerge dhcpcd
rc-update add dhcpcd default
emerge sysklogd
rc-update add sysklogd default
emerge cronie
rc-update add cronie default
emerge chrony
rc-update add chronyd default
emerge mlocate
emerge grub
emerge os-prober
mkdir /etc/config-archive
dispatch-conf
u
emerge os-prober
