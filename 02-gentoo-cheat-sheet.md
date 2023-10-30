# PORTAGE TMPFS
## Restoring TMPFS ebuilds:
```
du -sh /var/tmp/portage/
```
```
tar cpf - /var/tmp/portage/* | lz4 -vz --best - > ebuild.tar.lz4
```
```
lz4 -d ebuild.tar.lz4 && tar -xvf ebuild.tar -C /var/tmp/portage/*
```
```
ebuild /var/db/repos/gentoo/dev-python/PyQt6/PyQt6-6.5.2.ebuild merge
```
#### same to: dev-qt/qtmultimedia-6.5.2

