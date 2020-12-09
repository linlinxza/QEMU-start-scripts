#!/bin/bash

# Start virtual viewer

kdocker virt-viewer Windows7 &

# Barrier KVM

#sudo -u $user /snap/bin/barrier &
/snap/bin/barrier &

virsh start Windows7
# Wait for QEMU to close
PID=`ps -ef | grep -m 1 /usr/bin/qemu-system-x86_64 | awk '{print $2}'`
while [ -e /proc/$PID ]; do sleep 0.1; done

# Kill Barrier
pkill barrier
pkill barriers

# Kill Virtual viewer (For Spice server to send audio to Pulseaudio)
pkill virt-viewer
