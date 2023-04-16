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
