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


xinit: connection to X server lost


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

u

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


disable cmd line text & change bootlogo
https://raspberrypi.stackexchange.com/questions/67607/is-it-possible-to-disable-the-boot-messages-and-terminal-on-the-pitft-while-usin


https://yingtongli.me/blog/2016/12/21/splash.html


https://stackoverflow.com/questions/46143476/why-does-fbi-not-show-splash-image-during-system-startup

apt install fbi
copy splashscreen file into the directory mentioned in the file below.

create /etc/systemd/system/splashscreen.service with following:

[Unit]
Description=Splash screen
DefaultDependencies=no
After=local-fs.target

[Service]
ExecStart=/usr/bin/fbi --noverbose -a home/ubuntu/XradioPro/xradiopro.png
StandardInput=tty
StandardOutput=tty

[Install]
WantedBy=sysinit.target

systemctl enable splashscreen


nginx apt install
firewall policies
