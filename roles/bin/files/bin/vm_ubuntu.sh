#!/bin/bash

VM_NAME="${1:-mint}"
OS_TYPE="Ubuntu_64"
VMS_PATH="$STORAGE/vms/"

vboxmanage createvm --name "$VM_NAME" --ostype $OS_TYPE --register

vboxmanage createmedium disk --filename "$VMS_PATH$VM_NAME/$VM_NAME.vdi" --size 20480

vboxmanage storagectl "$VM_NAME" --name SATA --add SATA --controller IntelAhci
vboxmanage storageattach "$VM_NAME" \
  --medium "$VMS_PATH$VM_NAME/$VM_NAME.vdi" \
  --port 0 --device 0 \
  --storagectl SATA \
  --type hdd

vboxmanage storagectl "$VM_NAME" --name IDE --add ide
vboxmanage storageattach "$VM_NAME" \
  --device 0 \
  --medium emptydrive \
  --port 0 \
  --storagectl IDE \
  --type dvddrive

vboxmanage sharedfolder add "$VM_NAME" \
  --automount \
  --hostpath "${VMS_PATH}shared" \
  --name shared

vboxmanage modifyvm "$VM_NAME" \
  --accelerate3d on \
  --audiocontroller hda \
  --audioout on \
  --boot1 dvd \
  --boot2 disk \
  --boot3 none \
  --boot4 none \
  --clipboard bidirectional \
  --cpus 2 \
  --draganddrop bidirectional \
  --firmware efi \
  --graphicscontroller vboxsvga \
  --ioapic on \
  --memory 4096 \
  --rtcuseutc on \
  --vram 128
