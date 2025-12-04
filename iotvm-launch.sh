#!/usr/bin/env bash
set -e

# Paths - UPDATE THIS ISO PATH TO YOUR ACTUAL FILE
IMG_DIR="$HOME/qemu"
IMG_NAME="iotvm.qcow2"
IMG_PATH="$IMG_DIR/$IMG_NAME"
ISO_PATH="$HOME/Downloads/ubuntu-24.04.1-live-server-arm64.iso"

# VM resources
RAM="8G"
CPUS="4"

mkdir -p "$IMG_DIR"

# Delete image if requested
if [ "$1" = "delete" ]; then
  if [ -f "$IMG_PATH" ]; then
    echo "Deleting disk image: $IMG_PATH"
    rm -i "$IMG_PATH"
  else
    echo "No disk image found at: $IMG_PATH"
  fi
  exit 0
fi

# Create image if it does not exist
if [ ! -f "$IMG_PATH" ]; then
  echo "=== Creating new disk image ==="
  qemu-img create -f qcow2 "$IMG_PATH" 40G
  
  # Validate ISO exists
  if [ ! -f "$ISO_PATH" ]; then
    echo "ERROR: Ubuntu ARM ISO not found at: $ISO_PATH"
    echo "Please update ISO_PATH in the script to your actual ISO file path."
    echo "Download Ubuntu ARM64 Server ISO from: https://ubuntu.com/download/server/arm"
    exit 1
  fi
  
  echo "=== First boot: Ubuntu installer (ISO: $ISO_PATH) ==="
  echo "Install Ubuntu to the disk, then 'Restart Now' when done."
  qemu-system-aarch64 \
    -machine virt,accel=hvf \
    -cpu host \
    -m "$RAM" \
    -smp "$CPUS" \
    -drive if=virtio,format=qcow2,file="$IMG_PATH" \
    -cdrom "$ISO_PATH" \
    -device virtio-net-pci,netdev=net0 \
    -netdev user,id=net0 \
    -display default,show-cursor=on
else
  echo "=== Booting installed Ubuntu VM ==="
  echo "Disk image exists: $IMG_PATH"
  qemu-system-aarch64 \
    -machine virt,accel=hvf \
    -cpu host \
    -m "$RAM" \
    -smp "$CPUS" \
    -drive if=virtio,format=qcow2,file="$IMG_PATH" \
    -device virtio-net-pci,netdev=net0 \
    -netdev user,id=net0 \
    -display default,show-cursor=on
fi
