ISO=linuxvm.iso 
NAME=linuxvm
IMG=/root/bhyve/vms/linuxvm.img
MAP=/root/bhyve/vms/linuxvm.map
COM1=/dev/nmdm0A
COM2=/dev/nmdm0B
NET=tap2


echo "Connect to vm with:"
echo "cu -l $COM2"
echo ""
echo "Stop vm with:"
echo "bhyvectl --destroy --vm=$NAME"

echo "(hd0) $IMG" > $MAP
echo "(cd0) $ISO" >> $MAP

truncate -s 25G $IMG

grub-bhyve -m $MAP -r cd0 -M 1024M $NAME

bhyve -A -H -P -s 0:0,hostbridge -s 1:0,lpc -s 2:0,virtio-net,$NET -s 3:0,virtio-blk,$IMG -s 4:0,ahci-cd,$ISO -l com1,$COM1 -c 1 -m 1024M $NAME
