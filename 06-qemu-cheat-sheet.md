# creating a virtual disk:

```
qemu-img create -f qcow2 <vdiskname>.qcow2 <n>G
```

```
qemu-img info <vdisk>
```

# creating a virtual machine:

```
qemu-system-x86_64 --enable-kvm -m <RAM>G -smp <n cores> -name '<vm name>' -boot d -cdrom <ISO path>
```

# start VM:

```
qemu-system-x86_64 --enable-kvm -m 4G -smp 4 -name "<vm name>" -boot c -hda <vmdisk>.qcow2
```
