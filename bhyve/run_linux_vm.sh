ISO=linuxvm.iso 
NAME=linuxvm
IMG=/root/bhyve/vms/linuxvm.img
MAP=/root/bhyve/vms/linuxvm.map
COM1=/dev/nmdm1A
COM2=/dev/nmdm1B
NET=tap0

grub-bhyve -m $MAP -r hd0,msdos1 -M 1024M $NAME

bhyve -A -H -P -s 0:0,hostbridge -s 1:0,lpc -s 2:0,virtio-net,$NET -s 3:0,virtio-blk,$IMG -l com1,$COM1 -c 1 -m 1024M $NAME
