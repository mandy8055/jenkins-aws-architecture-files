## Fixing Low space issue in tmp directory

Although, you've provided enough space to your **build-server** but after starting, it starts to show low space on `/tmp` directory sometimes and the node will go offline often due to that. If this issue appears, what we can do is to mount the old `/tmp` directory to a newly created partition. Use below commands step by step to resolve this issue:

```bash
cd                              # change to your home directory
fallocate -l 8G mydrive.img    # create the virtual drive file with 8GB of data
mkfs -t ext3 mydrive.img        # format the virtual drive
sudo mkdir /tmp_new     # create a new temporary directory
sudo mount -t auto -o loop mydrive.img /tmp_new   # mount the virtual drive to the new temporary directory
sudo rsync -av /tmp/ /tmp_new/ # Copy the contents of /tmp to the new partition
sudo umount /tmp                # unmount the /tmp
# If there is an error umount: target is busy, then
sudo lsof /tmp # Find the PID of the process that is causing the issue
sudo kill -9 [PID]
sudo umount /tmp                # unmount the /tmp. This time it will work
# else
sudo mount -t auto -o loop mydrive.img /tmp   # mount the virtual drive
```

#### References

1. [**Umount target busy**](https://linuxhandbook.com/umount-target-busy/)
2. [**Mount /tmp issue**](https://stackoverflow.com/a/64480454)
