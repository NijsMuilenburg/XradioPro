# waveshare35-rpi3b-ubuntu-20.04-64

This Ansible playbook will configure your Raspberry Pi Model 4 B running Ubuntu Server 20.04 (64-bit) to work with a Waveshare 3.5inch RPi LCD (A).

![](http://www.lcdwiki.com/images/4/44/MPI3501-001.jpg)

[Product Page](https://www.waveshare.com/product/3.5inch-RPi-LCD-A.htm)

Other links:
+ [Waveshare Wiki](https://www.waveshare.com/wiki/3.5inch_RPi_LCD_(A))
+ [Official GitHub](https://github.com/waveshare/LCD-show)
+ [LCD Wiki](http://www.lcdwiki.com/3.5inch_RPi_Display)
+ [GitHub: lcdwiki/LCD-show-ubuntu](https://github.com/lcdwiki/LCD-show-ubuntu)

#### Pre-install Notes

Instructions
---

a. Install ansible

```
# apt install ansible
```

b. Download the ansible repo to '/root'

```none
# cd

# git clone 'https://github.com/NijsMuilenburg/XradioPro'
```

c. Change into the project directory and run the Ansible playbook

```
# cd XradioPro

# ansible-playbook playbook.yaml
```

_**Note:** The update/upgrade part of the install takes quite a while_

```none
# ansible-playbook playbook.yaml
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost
does not match 'all'

PLAY [localhost] ****************************************************************************************

TASK [Gathering Facts] **********************************************************************************
ok: [localhost]

TASK [packages : Running apt-get update and upgrade] ****************************************************
```

- - -

**Reference:**
+ [GitHub: goodft/LCD-show](https://github.com/goodtft/LCD-show)
+ [Raspberry Pi Forums: 480x320 Touchscreen](https://www.raspberrypi.org/forums/viewtopic.php?p=977889#p977889)
+ [Ubuntu Mate Community: LCD 3.5 XPT2046 Touch screen does not work on Raspberry Pi 3 Model B+](https://ubuntu-mate.community/t/lcd-3-5-xpt2046-touch-screen-does-not-work-on-raspberry-pi-3-model-b/19261/3)
+ [GitHub: notro/fbtft](https://github.com/notro/fbtft/issues/433)
+ [GitHub:  swkim01/waveshare-dtoverlays](https://github.com/swkim01/waveshare-dtoverlays)

sudo apt install xserver-xorg-video-fbdev


Command to find connected display:
ps aux | grep Xorg
als er geen HDMI attached is krijg je 
ubuntu     25014  0.0  0.0   7692   640 pts/1    S+   11:20   0:00 grep --color=auto Xorg

https://www.raspberrypi.org/forums/viewtopic.php?t=162323
https://github.com/UnchartedBull/OctoDash/issues/199

X.Org X Server 1.20.9
X Protocol Version 11, Revision 0
[  1453.905] Build Operating System: Linux 4.15.0-130-generic aarch64 Ubuntu
[  1453.905] Current Operating System: Linux ubuntu 5.4.0-1028-raspi #31-Ubuntu SMP PREEMPT Wed Jan 20 11:30:45 UTC 202>[  1453.905] Kernel command line:  coherent_pool=1M 8250.nr_uarts=1 snd_bcm2835.enable_compat_alsa=0 snd_bcm2835.enable>[  1453.905] Build Date: 17 January 2021  09:13:31AM
[  1453.905] xorg-server 2:1.20.9-2ubuntu1.2~20.04.1 (For technical support please see http://www.ubuntu.com/support)
[  1453.905] Current version of pixman: 0.38.4
[  1453.905]    Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
[  1453.905] Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[  1453.906] (==) Log file: "/var/log/Xorg.0.log", Time: Sat Feb  6 17:15:30 2021
[  1453.906] (==) Using config directory: "/etc/X11/xorg.conf.d"
[  1453.906] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[  1453.907] (==) ServerLayout "default"
[  1453.907] (**) |-->Screen "primary" (0)
[  1453.907] (**) |   |-->Monitor "WSSP"
[  1453.907] (**) |   |-->Device "uga"
[  1453.907] (**) |   |-->GPUDevice "Allwinner A10/A13/A20 FBDEV"
[  1453.907] (**) |   |-->GPUDevice "uga"
[  1453.907] (**) |   |-->GPUDevice "uga"
[  1453.907] (==) Automatically adding devices
[  1453.907] (==) Automatically enabling devices


https://github.com/ssvb/xf86-video-fbturbo/wiki/Installation
dit lost de error van FT Turbo op


http://moodeaudio.org/forum/printthread.php?tid=940


[   191.139] (EE) open /dev/fb1: No such file or directory
[   191.139] (EE) No devices detected.
[   191.139] (EE)
Fatal server error:
[   191.139] (EE) no screens found(EE)
Is the crucial part. You see it wanted to use /dev/fb1 which is what you wanted to achieve if I remember the tutorial right, but that device does not exists so xserver failed. The display driver should have created it. So that is where you need to look. Installation/configuration of display driver.


hdmi_force_hotplug=1  >> zorgt voor blanco scherm op touch (wel zwart)

https://stackoverflow.com/questions/60304251/unable-to-open-x-display-when-trying-to-run-google-chrome-on-centos-rhel-7-5



C:\>ssh ubuntu@192.168.0.156
ubuntu@192.168.0.156's password:
Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-1028-raspi aarch64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sun Feb  7 08:45:23 UTC 2021

  System load:  1.77               Temperature:           55.0 C
  Usage of /:   20.8% of 58.27GB   Processes:             175
  Memory usage: 12%                Users logged in:       1
  Swap usage:   0%                 IPv4 address for eth0: 192.168.0.156

 * Introducing self-healing high availability clusters in MicroK8s.
   Simple, hardened, Kubernetes for production, from RaspberryPi to DC.

     https://microk8s.io/high-availability

12 updates can be installed immediately.
0 of these updates are security updates.
To see these additional updates run: apt list --upgradable


Last login: Sun Feb  7 08:43:47 2021
ubuntu@ubuntu:~$ # google-chrome --no-sandbox --user-data-dir
ubuntu@ubuntu:~$ startx


X.Org X Server 1.20.9
X Protocol Version 11, Revision 0
Build Operating System: Linux 4.15.0-130-generic aarch64 Ubuntu
Current Operating System: Linux ubuntu 5.4.0-1028-raspi #31-Ubuntu SMP PREEMPT Wed Jan 20 11:30:45 UTC 2021 aarch64
Kernel command line:  coherent_pool=1M 8250.nr_uarts=1 snd_bcm2835.enable_compat_alsa=0 snd_bcm2835.enable_hdmi=1 bcm2708_fb.fbwidth=640 bcm2708_fb.fbheight=480 bcm2708_fb.fbswap=1 smsc95xx.macaddr=DC:A6:32:30:68:84 vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000  net.ifnames=0 dwc_otg.lpm_enable=0 console=ttyS0,115200 console=tty1 root=LABEL=writable rootfstype=ext4 elevator=deadline rootwait fixrtc fbcon=map:10 fbcon=font:ProFont6x11 cgroup_enable=memory cgroup_memory=1 quiet splash
Build Date: 17 January 2021  09:13:31AM
xorg-server 2:1.20.9-2ubuntu1.2~20.04.1 (For technical support please see http://www.ubuntu.com/support)
Current version of pixman: 0.38.4
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Sun Feb  7 08:49:04 2021
(==) Using config directory: "/etc/X11/xorg.conf.d"
(==) Using system config directory "/usr/share/X11/xorg.conf.d"
/usr/bin/chromium-browser: 12: xdg-settings: not found

(chrome:2415): Gtk-WARNING **: 08:49:13.938: Theme parsing error: gtk.css:1566:23: 'font-feature-settings' is not a valid property name

(chrome:2415): Gtk-WARNING **: 08:49:13.965: Theme parsing error: gtk.css:3616:25: 'font-feature-settings' is not a valid property name

(chrome:2415): Gtk-WARNING **: 08:49:13.969: Theme parsing error: gtk.css:4078:23: 'font-feature-settings' is not a valid property name
[2415:2564:0207/084914.842819:ERROR:bus.cc(393)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[2415:2564:0207/084914.843016:ERROR:bus.cc(393)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[2415:2552:0207/084914.856804:ERROR:simple_backend_impl.cc(81)] Failed to create directory: /dev/null/Default/Code Cache/js
[2415:2551:0207/084914.856804:ERROR:simple_backend_impl.cc(81)] Failed to create directory: /dev/null/Default/Code Cache/wasm
[2415:2552:0207/084914.857151:ERROR:simple_backend_impl.cc(81)] Failed to create directory: /dev/null/Default/Code Cache/js
[2415:2552:0207/084914.857498:ERROR:simple_backend_impl.cc(757)] Simple Cache Backend: wrong file structure on disk: 1 path: /dev/null/Default/Code Cache/js
[2415:2551:0207/084914.857926:ERROR:simple_backend_impl.cc(81)] Failed to create directory: /dev/null/Default/Code Cache/wasm
[2415:2551:0207/084914.858319:ERROR:simple_backend_impl.cc(757)] Simple Cache Backend: wrong file structure on disk: 1 path: /dev/null/Default/Code Cache/wasm
[2415:2564:0207/084915.289219:ERROR:bus.cc(393)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[2415:2564:0207/084915.289926:ERROR:bus.cc(393)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[2559:2559:0207/084915.372866:ERROR:sandbox_linux.cc(374)] InitializeSandbox() called with multiple threads in process gpu-process.
[2415:2592:0207/084915.528372:ERROR:simple_backend_impl.cc(81)] Failed to create directory: /dev/null/Default/Code Cache/js
[2415:2592:0207/084915.528701:ERROR:simple_backend_impl.cc(81)] Failed to create directory: /dev/null/Default/Code Cache/js
[2415:2592:0207/084915.528767:ERROR:simple_backend_impl.cc(757)] Simple Cache Backend: wrong file structure on disk: 1 path: /dev/null/Default/Code Cache/js
[2415:2591:0207/084915.528854:ERROR:simple_backend_impl.cc(81)] Failed to create directory: /dev/null/Default/Code Cache/wasm
[2415:2591:0207/084915.529098:ERROR:simple_backend_impl.cc(81)] Failed to create directory: /dev/null/Default/Code Cache/wasm
[2415:2591:0207/084915.529158:ERROR:simple_backend_impl.cc(757)] Simple Cache Backend: wrong file structure on disk: 1 path: /dev/null/Default/Code Cache/wasm
[2562:2570:0207/084915.533386:ERROR:simple_backend_impl.cc(81)] Failed to create directory: /dev/null/Default/Cache
[2562:2570:0207/084915.534269:ERROR:simple_backend_impl.cc(81)] Failed to create directory: /dev/null/Default/Cache
[2562:2570:0207/084915.534377:ERROR:simple_backend_impl.cc(757)] Simple Cache Backend: wrong file structure on disk: 1 path: /dev/null/Default/Cache
[2562:2568:0207/084915.536732:ERROR:simple_backend_impl.cc(81)] Failed to create directory: /dev/null/Default/Cache
[2562:2568:0207/084915.536995:ERROR:simple_backend_impl.cc(81)] Failed to create directory: /dev/null/Default/Cache
[2562:2568:0207/084915.537047:ERROR:simple_backend_impl.cc(757)] Simple Cache Backend: wrong file structure on disk: 1 path: /dev/null/Default/Cache
[2562:2567:0207/084915.538190:ERROR:disk_cache.cc(184)] Unable to create cache
[2415:2415:0207/084915.644017:ERROR:disk_cache.cc(184)] Unable to create cache
[2415:2415:0207/084915.644742:ERROR:disk_cache.cc(184)] Unable to create cache
[2415:2564:0207/084921.847441:ERROR:bus.cc(393)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[2415:2564:0207/084921.849558:ERROR:bus.cc(393)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[2415:2564:0207/084921.849974:ERROR:bus.cc(393)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
[2415:2534:0207/084922.686820:ERROR:udev_watcher.cc(97)] Failed to begin udev enumeration.
^Cxinit: connection to X server lost

waiting for X server to shut down [2415:2538:0207/085012.704214:ERROR:zygote_communication_linux.cc(276)] Failed to send GetTerminationStatus message to zygote
(II) Server terminated successfully (0). Closing log file.

xinit: unexpected signal 2
Couldn't get a file descriptor referring to the console
ubuntu@ubuntu:~$ sudo startx


X.Org X Server 1.20.9
X Protocol Version 11, Revision 0
Build Operating System: Linux 4.15.0-130-generic aarch64 Ubuntu
Current Operating System: Linux ubuntu 5.4.0-1028-raspi #31-Ubuntu SMP PREEMPT Wed Jan 20 11:30:45 UTC 2021 aarch64
Kernel command line:  coherent_pool=1M 8250.nr_uarts=1 snd_bcm2835.enable_compat_alsa=0 snd_bcm2835.enable_hdmi=1 bcm2708_fb.fbwidth=640 bcm2708_fb.fbheight=480 bcm2708_fb.fbswap=1 smsc95xx.macaddr=DC:A6:32:30:68:84 vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000  net.ifnames=0 dwc_otg.lpm_enable=0 console=ttyS0,115200 console=tty1 root=LABEL=writable rootfstype=ext4 elevator=deadline rootwait fixrtc fbcon=map:10 fbcon=font:ProFont6x11 cgroup_enable=memory cgroup_memory=1 quiet splash
Build Date: 17 January 2021  09:13:31AM
xorg-server 2:1.20.9-2ubuntu1.2~20.04.1 (For technical support please see http://www.ubuntu.com/support)
Current version of pixman: 0.38.4
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Sun Feb  7 08:50:23 2021
(==) Using config directory: "/etc/X11/xorg.conf.d"
(==) Using system config directory "/usr/share/X11/xorg.conf.d"
/usr/bin/chromium-browser: 12: xdg-settings: not found
mkdir: cannot create directory ‘/run/user/0’: Permission denied
[2749:2749:0207/085025.578034:ERROR:zygote_host_impl_linux.cc(90)] Running as root without --no-sandbox is not supported. See https://crbug.com/638180.
xinit: connection to X server lost

waiting for X server to shut down (II) Server terminated successfully (0). Closing log file.

ubuntu@ubuntu:~$ xinit


X.Org X Server 1.20.9
X Protocol Version 11, Revision 0
Build Operating System: Linux 4.15.0-130-generic aarch64 Ubuntu
Current Operating System: Linux ubuntu 5.4.0-1028-raspi #31-Ubuntu SMP PREEMPT Wed Jan 20 11:30:45 UTC 2021 aarch64
Kernel command line:  coherent_pool=1M 8250.nr_uarts=1 snd_bcm2835.enable_compat_alsa=0 snd_bcm2835.enable_hdmi=1 bcm2708_fb.fbwidth=640 bcm2708_fb.fbheight=480 bcm2708_fb.fbswap=1 smsc95xx.macaddr=DC:A6:32:30:68:84 vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000  net.ifnames=0 dwc_otg.lpm_enable=0 console=ttyS0,115200 console=tty1 root=LABEL=writable rootfstype=ext4 elevator=deadline rootwait fixrtc fbcon=map:10 fbcon=font:ProFont6x11 cgroup_enable=memory cgroup_memory=1 quiet splash
Build Date: 17 January 2021  09:13:31AM
xorg-server 2:1.20.9-2ubuntu1.2~20.04.1 (For technical support please see http://www.ubuntu.com/support)
Current version of pixman: 0.38.4
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Sun Feb  7 08:50:49 2021
(==) Using config directory: "/etc/X11/xorg.conf.d"
(==) Using system config directory "/usr/share/X11/xorg.conf.d"
xinit: Unable to run program "xterm": No such file or directory
Specify a program on the command line or make sure that /usr/bin
is in your path.

xinit: connection to X server lost

waiting for X server to shut down (II) Server terminated successfully (0). Closing log file.

ubuntu@ubuntu:~$ xterm

Command 'xterm' not found, but can be installed with:

sudo apt install xterm

ubuntu@ubuntu:~$ sudo apt install xterm
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  x11-utils xbitmaps
Suggested packages:
  mesa-utils xfonts-cyrillic
The following NEW packages will be installed:
  x11-utils xbitmaps xterm
0 upgraded, 3 newly installed, 0 to remove and 9 not upgraded.
Need to get 969 kB of archives.
After this operation, 3205 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://ports.ubuntu.com/ubuntu-ports focal/main arm64 x11-utils arm64 7.7+5 [191 kB]
Get:2 http://ports.ubuntu.com/ubuntu-ports focal/main arm64 xbitmaps all 1.1.1-2 [28.1 kB]
Get:3 http://ports.ubuntu.com/ubuntu-ports focal/universe arm64 xterm arm64 353-1ubuntu1 [750 kB]
Fetched 969 kB in 0s (2753 kB/s)
Selecting previously unselected package x11-utils.
(Reading database ... 146249 files and directories currently installed.)
Preparing to unpack .../x11-utils_7.7+5_arm64.deb ...
Unpacking x11-utils (7.7+5) ...
Selecting previously unselected package xbitmaps.
Preparing to unpack .../xbitmaps_1.1.1-2_all.deb ...
Unpacking xbitmaps (1.1.1-2) ...
Selecting previously unselected package xterm.
Preparing to unpack .../xterm_353-1ubuntu1_arm64.deb ...
Unpacking xterm (353-1ubuntu1) ...
Setting up x11-utils (7.7+5) ...
Setting up xbitmaps (1.1.1-2) ...
Setting up xterm (353-1ubuntu1) ...
Processing triggers for mime-support (3.64ubuntu1) ...
Processing triggers for hicolor-icon-theme (0.17-2) ...
Processing triggers for gnome-menus (3.36.0-1ubuntu1) ...
Processing triggers for man-db (2.9.1-1) ...
Processing triggers for desktop-file-utils (0.24-1ubuntu3) ...
^Aubuntu@ubuntu:~$ sudo apt install xterm
Reading package lists... Done
Building dependency tree
Reading state information... Done
xterm is already the newest version (353-1ubuntu1).
0 upgraded, 0 newly installed, 0 to remove and 9 not upgraded.
ubuntu@ubuntu:~$



Reading state information... Done
xterm is already the newest version (353-1ubuntu1).
0 upgraded, 0 newly installed, 0 to remove and 9 not upgraded.
ubuntu@ubuntu:~$ xinit


X.Org X Server 1.20.9
X Protocol Version 11, Revision 0
Build Operating System: Linux 4.15.0-130-generic aarch64 Ubuntu
Current Operating System: Linux ubuntu 5.4.0-1028-raspi #31-Ubuntu SMP PREEMPT Wed Jan 20 11:30:45 UTC 2021 aarch64
Kernel command line:  coherent_pool=1M 8250.nr_uarts=1 snd_bcm2835.enable_compat_alsa=0 snd_bcm2835.enable_hdmi=1 bcm2708_fb.fbwidth=640 bcm2708_fb.fbheight=480 bcm2708_fb.fbswap=1 smsc95xx.macaddr=DC:A6:32:30:68:84 vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000  net.ifnames=0 dwc_otg.lpm_enable=0 console=ttyS0,115200 console=tty1 root=LABEL=writable rootfstype=ext4 elevator=deadline rootwait fixrtc fbcon=map:10 fbcon=font:ProFont6x11 cgroup_enable=memory cgroup_memory=1 quiet splash
Build Date: 17 January 2021  09:13:31AM
xorg-server 2:1.20.9-2ubuntu1.2~20.04.1 (For technical support please see http://www.ubuntu.com/support)
Current version of pixman: 0.38.4
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Sun Feb  7 08:52:40 2021
(==) Using config directory: "/etc/X11/xorg.conf.d"
(==) Using system config directory "/usr/share/X11/xorg.conf.d"
^Cxinit: connection to X server lost

waiting for X server to shut down xterm: fatal IO error 11 (Resource temporarily unavailable) or KillClient on X server ":0"
(II) Server terminated successfully (0). Closing log file.


https://forums.freebsd.org/threads/beagleboneblack-problem-running-xorg.53340/#post-299791

werkt niet

https://github.com/Z-Bolt/OctoScreen/issues/43
HDMI clonen?

ubuntu@ubuntu:/etc/X11$ sudo apt-get -y install cmake
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  cmake-data libjsoncpp1 librhash0
Suggested packages:
  cmake-doc ninja-build
The following NEW packages will be installed:
  cmake cmake-data libjsoncpp1 librhash0
0 upgraded, 4 newly installed, 0 to remove and 9 not upgraded.
Need to get 4908 kB of archives.
After this operation, 25.6 MB of additional disk space will be used.
Get:1 http://ports.ubuntu.com/ubuntu-ports focal/main arm64 cmake-data all 3.16.3-1ubuntu1 [1612 kB]
Get:2 http://ports.ubuntu.com/ubuntu-ports focal/main arm64 libjsoncpp1 arm64 1.7.4-3.1ubuntu2 [69.8 kB]
Get:3 http://ports.ubuntu.com/ubuntu-ports focal/main arm64 librhash0 arm64 1.3.9-1 [111 kB]
Get:4 http://ports.ubuntu.com/ubuntu-ports focal/main arm64 cmake arm64 3.16.3-1ubuntu1 [3115 kB]
Fetched 4908 kB in 1s (4847 kB/s)
Selecting previously unselected package cmake-data.
(Reading database ... 146420 files and directories currently installed.)
Preparing to unpack .../cmake-data_3.16.3-1ubuntu1_all.deb ...
Unpacking cmake-data (3.16.3-1ubuntu1) ...
Selecting previously unselected package libjsoncpp1:arm64.
Preparing to unpack .../libjsoncpp1_1.7.4-3.1ubuntu2_arm64.deb ...
Unpacking libjsoncpp1:arm64 (1.7.4-3.1ubuntu2) ...
Selecting previously unselected package librhash0:arm64.
Preparing to unpack .../librhash0_1.3.9-1_arm64.deb ...
Unpacking librhash0:arm64 (1.3.9-1) ...
Selecting previously unselected package cmake.
Preparing to unpack .../cmake_3.16.3-1ubuntu1_arm64.deb ...
Unpacking cmake (3.16.3-1ubuntu1) ...
Setting up librhash0:arm64 (1.3.9-1) ...
Setting up cmake-data (3.16.3-1ubuntu1) ...
Setting up libjsoncpp1:arm64 (1.7.4-3.1ubuntu2) ...
Setting up cmake (3.16.3-1ubuntu1) ...
Processing triggers for man-db (2.9.1-1) ...
Processing triggers for libc-bin (2.31-0ubuntu9.2) ...
ubuntu@ubuntu:/etc/X11$ git clone https://github.com/tasanakorn/rpi-fbcp
fatal: could not create work tree dir 'rpi-fbcp': Permission denied
ubuntu@ubuntu:/etc/X11$ sudo git clone https://github.com/tasanakorn/rpi-fbcp
Cloning into 'rpi-fbcp'...
remote: Enumerating objects: 61, done.
remote: Total 61 (delta 0), reused 0 (delta 0), pack-reused 61
Unpacking objects: 100% (61/61), 18.24 KiB | 283.00 KiB/s, done.
ubuntu@ubuntu:/etc/X11$ cd rpi-fbcp/
ubuntu@ubuntu:/etc/X11/rpi-fbcp$ mkdir build
mkdir: cannot create directory ‘build’: Permission denied
ubuntu@ubuntu:/etc/X11/rpi-fbcp$ sudo mkdir build
ubuntu@ubuntu:/etc/X11/rpi-fbcp$ cd build
ubuntu@ubuntu:/etc/X11/rpi-fbcp/build$ sudo cmake ..
CMake Warning (dev) in CMakeLists.txt:
  No project() command is present.  The top-level CMakeLists.txt file must
  contain a literal, direct call to the project() command.  Add a line of
  code such as

    project(ProjectName)

  near the top of the file, but after cmake_minimum_required().

  CMake is pretending there is a "project(Project)" command on the first
  line.
This warning is for project developers.  Use -Wno-dev to suppress it.

-- The C compiler identification is GNU 9.3.0
-- The CXX compiler identification is GNU 9.3.0
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /etc/X11/rpi-fbcp/build
ubuntu@ubuntu:/etc/X11/rpi-fbcp/build$ sudo make
Scanning dependencies of target fbcp
[ 50%] Building C object CMakeFiles/fbcp.dir/main.c.o
/etc/X11/rpi-fbcp/main.c:9:10: fatal error: bcm_host.h: No such file or directory
    9 | #include <bcm_host.h>
      |          ^~~~~~~~~~~~
compilation terminated.
make[2]: *** [CMakeFiles/fbcp.dir/build.make:63: CMakeFiles/fbcp.dir/main.c.o] Error 1
make[1]: *** [CMakeFiles/Makefile2:76: CMakeFiles/fbcp.dir/all] Error 2
make: *** [Makefile:84: all] Error 2
ubuntu@ubuntu:/etc/X11/rpi-fbcp/build$ sudo make
[ 50%] Building C object CMakeFiles/fbcp.dir/main.c.o
/etc/X11/rpi-fbcp/main.c:9:10: fatal error: bcm_host.h: No such file or directory
    9 | #include <bcm_host.h>
      |          ^~~~~~~~~~~~
compilation terminated.
make[2]: *** [CMakeFiles/fbcp.dir/build.make:63: CMakeFiles/fbcp.dir/main.c.o] Error 1
make[1]: *** [CMakeFiles/Makefile2:76: CMakeFiles/fbcp.dir/all] Error 2
make: *** [Makefile:84: all] Error 2


root@ubuntu:~/raspi2fb/build# make
Scanning dependencies of target raspi2fb
[ 33%] Building C object CMakeFiles/raspi2fb.dir/raspi2fb.c.o
/root/raspi2fb/raspi2fb.c:53:10: fatal error: bcm_host.h: No such file or directory
   53 | #include "bcm_host.h"
      |          ^~~~~~~~~~~~
compilation terminated.
make[2]: *** [CMakeFiles/raspi2fb.dir/build.make:63: CMakeFiles/raspi2fb.dir/raspi2fb.c.o] Error 1
make[1]: *** [CMakeFiles/Makefile2:76: CMakeFiles/raspi2fb.dir/all] Error 2
make: *** [Makefile:130: all] Error 2
root@ubuntu:~/raspi2fb/build#


https://askubuntu.com/questions/1293785/how-can-i-set-the-resolution-and-rotate-the-screen-of-an-app-launched-with-start

https://askubuntu.com/questions/1213538/ee-no-screens-found-when-startx

http://moodeaudio.org/forum/printthread.php?tid=940

https://joy-it.net/en/products/RB-TFT3.5

https://stackoverflow.com/questions/28222548/how-to-disable-context-menu-on-right-click-long-touch-in-a-kiosk-mode-of-chrome
chromium-browser --kiosk mode blocked rechtermuisknop, maar lijkt ook press/hold te blocken.


https://raspberrypi.stackexchange.com/questions/34589/how-to-click-on-browser-page-while-emulating-touch-with-chromium
--touch-events=enabled

https://jsn-techtips.blogspot.com/2015/10/how-to-open-chrome-on-remote-machine.html
How to open browser (Chrome, Firefox) on the remote machine via terminal
