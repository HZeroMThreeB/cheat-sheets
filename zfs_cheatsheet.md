# ZFS commands cheatsheet

## Devices and Pools

### List all devices in the server
```lsblk -S```

### List all pools
```zpool list```

### Clear device errors from a pool and try to rebuild the pool
```zpool clear```

### Create a zpool called 'files' in RAID 0 using /dev/sd[b,c,d]
```zpool create -f files /dev/sdb /dev/sdc /dev/sdd```

*Optional Parameters*
 -m mountpoint
                     Sets the mount point for the root dataset.  The default mount point is /pool or altroot/pool if altroot is specified.  The mount
                     point must be an absolute path, legacy, or none.  For more information on dataset mount points, see zfs(8).

### Create a zpool called 'files' in RAID 1 (Mirrored) using /dev/sda and /dev/sdb
```zpool create files mirror /dev/sda /dev/sdb```
*used striped instead of mirror for RAID 5*

### Change the base mountpoint of an existing ZFS Pool called $POOL to $NEWPATH
```zfs set mountpoint=$NEWPATH $POOL```

### Kill a pool named $POOL
```zpool destroy $POOL```

## File Systems

ZFS file systems live 'inside' pools.  By default they are mounted under the parent pool.

For example:

```
zfs get mountpoint rpool
NAME  PROPERTY    VALUE                      SOURCE
rpool   mountpoint  /var/lib/snapd/hostfs/rpool  local
```

```
zfs create rpool/docker   # docker is a filesystem in the pool named rpool
```
```
zfs get mountpoint rpool/docker
NAME        PROPERTY    VALUE                             SOURCE
rpool/docker  mountpoint  /var/lib/snapd/hostfs/rpool/docker  inherited from rpool
```

As you can see, ```rpool``` is mounted in ```/var/lib/snapd/hostfs/rpool``` and ```rpool/docker``` is mounted in ```/var/lib/snapd/hostfs/rpool/docker``` and it's that inherited from /rpool.

But what if we want rpool/docker to be mounted in /var/lib/docker?

```
zfs set mountpoint=/var/lib/docker rpool/docker
```

```
zfs get mountpoint rpool/docker
NAME        PROPERTY    VALUE            SOURCE
rpool/docker  mountpoint  /var/lib/docker  local
```
### List file systems

* `zfs list` shows all file systems
* `zfs list -r small` shows all file systems under small
* `zfs list -t snapshot` shows all snapshots

## Snapshots

Snapshots capture a point in time of a file system.  Snapshots can't be accessed directly, but you can clone them, back them up, and roll back to them.

### Create a snapshot

To create a filesystem snapshot, we use the `zfs snapshot` command.

We have a filesystem called test, mounted in my home directory.

```
zfs list -r rpool/test
NAME       USED  AVAIL  REFER  MOUNTPOINT
rpool/test    96K  4.36T    96K  /home/gentoober/test
```

I create a snapshot of the filesystem.

```
zfs snapshot rpool/test@demo
zfs list -t snapshot
NAME                                                                                           USED  AVAIL  REFER  MOUNTPOINT
rpool/test@demo                                                                                    0B      -    96K  -
```

# Rollback a snapshot
Now let's create a file in there.
```
touch /home/gentoober/test/afile.txt
ls /home/gentoober/test/
afile.txt
```
Now let's rollback to the snapshot.
```
zfs rollback rpool/test@demo
ls /home/gentoober/test/
<nothing is shown>
```

# Clone a snapshot

You can make a copy of a snapshot into a new filesystem..

Here we take the snapshot we created above `rpool/test@demo` and create a new
zfs filesystem `rpool/demobackup` from it.
```
zfs clone rpool/test@demo rpool/demobackup
```

Note: Snapshots that are used to create cloned file systems can't be deleted 
until the file system is deleted.  

# Clone a snapshot to another machine!

You can also 'send' your snapshot to another machine..

Here we're sending the `rpool/test@demo` snapshot to `othermachine` into the `backup/test` filesystem.

```zfs send rpool/test@demo | ssh othermachine zfs recv backup/test```

Obviously, the other machine will also need to have ZFS installed

# Remove a Snapshot

To remove a snapshot, use the zfs destroy command.

Example:
```
zfs destroy rpool/test@demo
```

## Remove all snapshots
```
for snapshot in $(zfs list -H -o name -t snapshot); do
    zfs destroy "$snapshot"
done
```