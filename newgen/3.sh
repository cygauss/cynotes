emerge linux-firmware
USE="symlink" emerge gentoo-sources
emerge genkernel
genkernel --mountboot --save-config --install all
echo "/dev/nvme2n1p2 /boot vfat defaults,noatime 0 2" > /etc/fstab
echo "/dev/nvme3n1p1 /     ext4 noatime          0 1" > /etc/fstab
echo cygen > /etc/hostname 
emerge dhcpcd
rc-update add dhcpcd default
rm /etc/conf.d/hwclock
cd /etc/conf.d
wget -L https://raw.githubusercontent.com/cygauss/cynotes/main/newgen/hwclock
cd -
emerge sysklogd
rc-update add sysklogd default
emerge cronie
rc-update add cronie default
emerge chrony
rc-update add chronyd default
emerge mlocate
emerge grub
echo "GRUB_DISABLE_OS_PROBER=false" > /etc/default/grub
emerge --autounmask-write os-prober
mkdir /etc/config-archive
dispatch-conf
emerge --newuse os-prober
grub-install --target=x86_64-efi --efi-directory=/boot --removable
grub--mkconfig -o /boot/grub/grub.cfg
exit
