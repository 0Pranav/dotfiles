#!/bin/bash
echo "1" > /sys/bus/pci/devices/0000\:00\:14.3/remove
sleep 1
echo "1" > /sys/bus/pci/rescan
