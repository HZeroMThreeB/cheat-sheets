# NixOS ZFS install

## List disks by id
```
find /dev/disk/by-id/ | grep -v "eui"
```
## Set disk
```
DISK='/dev/disk/by-id/disk1'
```
## Set a mount point
```
MNT=$(mktemp -d)
```
## Enable Nix Flakes functionality
```
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```
## Install programs needed for system installation
```
if ! command -v git; then nix-env -f '<nixpkgs>' -iA git; fi
if ! command -v jq;  then nix-env -f '<nixpkgs>' -iA jq; fi
if ! command -v partprobe;  then nix-env -f '<nixpkgs>' -iA parted; fi
```
## Partition the disks.
```
 partition_disk () {
 local disk="${1}"
 blkdiscard -f "${disk}" || true

 parted --script --align=optimal  "${disk}" -- \
 mklabel gpt \
 mkpart EFI 2MiB 1GiB \
 mkpart bpool 1GiB 5GiB \
 mkpart rpool 5GiB -1 \
 mkpart BIOS 1MiB 2MiB \
 set 1 esp on \
 set 4 bios_grub on \
 set 4 legacy_boot on

 partprobe "${disk}"
 udevadm settle
}

for i in ${DISK}; do
   partition_disk "${i}"
done 
```
## Create boot pool
```
# shellcheck disable=SC2046
zpool create \
    -o compatibility=grub2 \
    -o ashift=12 \
    -o autotrim=on \
    -O acltype=posixacl \
    -O canmount=off \
    -O compression=lz4 \
    -O devices=off \
    -O normalization=formD \
    -O relatime=on \
    -O xattr=sa \
    -O mountpoint=/boot \
    -R "${MNT}" \
    bpool \
    $(for i in ${DISK}; do
       printf '%s ' "${i}-part2";
      done)
```
## Create root pool
```
# shellcheck disable=SC2046
zpool create \
    -o ashift=12 \
    -o autotrim=on \
    -R "${MNT}" \
    -O acltype=posixacl \
    -O canmount=off \
    -O compression=lz4 \
    -O dnodesize=auto \
    -O normalization=formD \
    -O relatime=on \
    -O xattr=sa \
    -O mountpoint=/ \
    rpool \
   $(for i in ${DISK}; do
      printf '%s ' "${i}-part3";
     done)
```
## Create root system container:
```
zfs create \
 -o canmount=off \
 -o mountpoint=none \
rpool/nixos
```
## Create system datasets, manage mountpoints with mountpoint=legacy
```
zfs create -o mountpoint=legacy     rpool/nixos/root
mount -t zfs rpool/nixos/root "${MNT}"/
zfs create -o mountpoint=legacy rpool/nixos/home
mkdir "${MNT}"/home
mount -t zfs rpool/nixos/home "${MNT}"/home
zfs create -o mountpoint=none   rpool/nixos/var
zfs create -o mountpoint=legacy rpool/nixos/var/lib
zfs create -o mountpoint=legacy rpool/nixos/var/log
zfs create -o mountpoint=none bpool/nixos
zfs create -o mountpoint=legacy bpool/nixos/root
mkdir "${MNT}"/boot
mount -t zfs bpool/nixos/root "${MNT}"/boot
mkdir -p "${MNT}"/var/log
mkdir -p "${MNT}"/var/lib
mount -t zfs rpool/nixos/var/lib "${MNT}"/var/lib
mount -t zfs rpool/nixos/var/log "${MNT}"/var/log
```
## Format and mount ESP
```
for i in ${DISK}; do
 mkfs.vfat -n EFI "${i}"-part1
 mkdir -p "${MNT}"/boot/efis/"${i##*/}"-part1
 mount -t vfat -o iocharset=iso8859-1 "${i}"-part1 "${MNT}"/boot/efis/"${i##*/}"-part1
done
```
## Clone template flake configuration
```
mkdir -p "${MNT}"/etc
git clone --depth 1 --branch openzfs-guide \
  https://github.com/ne9z/dotfiles-flake.git "${MNT}"/etc/nixos
```
## FROM NOW ON, THE COMPLETE CONFIGURATION OF THE SYSTEM WILL BE TRACKED BY GIT, SET A USER NAME AND EMAIL ADDRESS TO CONTINUE
```
rm -rf "${MNT}"/etc/nixos/.git
git -C "${MNT}"/etc/nixos/ init -b main
git -C "${MNT}"/etc/nixos/ add "${MNT}"/etc/nixos/
git -C "${MNT}"/etc/nixos config user.email "you@example.com"
git -C "${MNT}"/etc/nixos config user.name "GENTOOBER"
git -C "${MNT}"/etc/nixos commit -asm 'initial commit'
```
## Customize configuration to your hardware
```
for i in ${DISK}; do
  sed -i \
  "s|/dev/disk/by-id/|${i%/*}/|" \
  "${MNT}"/etc/nixos/hosts/exampleHost/default.nix
  break
done

diskNames=""
for i in ${DISK}; do
  diskNames="${diskNames} \"${i##*/}\""
done

sed -i "s|\"bootDevices_placeholder\"|${diskNames}|g" \
  "${MNT}"/etc/nixos/hosts/exampleHost/default.nix

sed -i "s|\"abcd1234\"|\"$(head -c4 /dev/urandom | od -A none -t x4| sed 's| ||g' || true)\"|g" \
  "${MNT}"/etc/nixos/hosts/exampleHost/default.nix

sed -i "s|\"x86_64-linux\"|\"$(uname -m || true)-linux\"|g" \
  "${MNT}"/etc/nixos/flake.nix
```
## Detect kernel modules needed for boot
```
cp "$(command -v nixos-generate-config || true)" ./nixos-generate-config

chmod a+rw ./nixos-generate-config

# shellcheck disable=SC2016
echo 'print STDOUT $initrdAvailableKernelModules' >> ./nixos-generate-config

kernelModules="$(./nixos-generate-config --show-hardware-config --no-filesystems | tail -n1 || true)"

sed -i "s|\"kernelModules_placeholder\"|${kernelModules}|g" \
  "${MNT}"/etc/nixos/hosts/exampleHost/default.nix
```
## Set root password
```
rootPwd=$(mkpasswd -m SHA-512)
```
### Declare password in configuration
```
sed -i \
"s|rootHash_placeholder|${rootPwd}|" \
"${MNT}"/etc/nixos/configuration.nix
```
## YOU CAN ENABLE NETWORKMANAGER FOR WIRELESS NETWORKS AND GNOME DESKTOP ENVIRONMENT IN CONFIGURATION.NIX.

## AFTER /etc/nixos/configuration.nix edition
### Commit changes to local repo
```
git -C "${MNT}"/etc/nixos commit -asm 'initial installation'
```
### Update flake lock file to track latest system version
```
nix flake update --commit-lock-file \
  "git+file://${MNT}/etc/nixos"
```
## Install system and apply configuration
```
nixos-install \
--root "${MNT}" \
--no-root-passwd \
--flake "git+file://${MNT}/etc/nixos#exampleHost"
```
## Unmount filesystems
```
umount -Rl "${MNT}"
zpool export -a
```
## Reboot and be happy : )
```
reboot
```

