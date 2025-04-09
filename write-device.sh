#!/bin/bash

DEVICE=$1

sudo umount /dev/$DEVICE
sudo dd if=buildroot/output/images/sdcard.img of=/dev/$DEVICE
sync
sudo umount /dev/$DEVICE
