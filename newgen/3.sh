emerge linux-firmware
USE="symlink" emerge gentoo-sources
emerge genkernel
genkernel --mountboot --save-config --install all
echo "/dev/nvme2n1p2 /boot vfat defaults,noatime 0 2" > /etc/fstab
echo "/dev/nvme3n1p1 /     ext4 noatime          0 1" > /etc/fstab
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
