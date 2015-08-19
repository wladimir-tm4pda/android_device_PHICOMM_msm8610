# Start linux swap
mount -o rw,remount,barrier=1 /system
if [ ! -f /system/phicomm.swap ];then
    #rm /system/phicomm.swap
    dd if=/dev/zero of=/system/phicomm.swap bs=1024 count=307200    
fi
busybox mkswap /system/phicomm.swap
busybox swapon /system/phicomm.swap

while [ 1 ]
do
swap_on=$(busybox free|busybox grep "Swap"|busybox tr -s ' '|busybox cut -d ' ' -f2)
if [ "$swap_on" == "0" ];then
    busybox mkswap /system/phicomm.swap
    busybox swapon /system/phicomm.swap
fi
sleep 8
done

