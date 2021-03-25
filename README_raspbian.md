


automatisch inloggen via raspbian config.
sudo raspi-config[]
kiezen voor system options> boot options > b2 console autologin

pi@raspberrypi:/ $ pi@raspberrypi:/ $ sudo raspi-config
Removed /etc/systemd/system/default.target.
Created symlink /etc/systemd/system/default.target → /lib/systemd/system/multi-user.target.
ln: failed to create symbolic link '/etc/systemd/system/getty.target.wants/getty@tty1.service': No such file or directory


file 99-fbturbo.conf
gekopieerd naar /etc/X11/xorg.conf (stond in de beschrijving van de file in /usr/share/X11/99-fbturbo)

in xorg.conf fb naar 0 gezet (lijkt niet uit te maken)

in raspi-config de screen resolution aangepast.

directory aangemaakt in /etc/X11/xorg.conf.d 
file aangemaakt die heet 99-calibration.conf 
onderstaande toegevoegd.

Section "Device"
# WaveShare SpotPear 3.5", framebuffer 1
Identifier "uga"
driver "fbdev"
Option "fbdev" "/dev/fb1"
Option "ShadowFB" "off"
EndSection

Section "Monitor"
# Primary monitor. WaveShare SpotPear 480x320
Identifier "WSSP"
EndSection

Section "Screen"
Identifier "primary"
Device "uga"
Monitor "WSSP"
EndSection

Section "ServerLayout"
Identifier "default"
Screen 0 "primary" 0 0
EndSection


automatisch inloggen werkt nog niet goed.
Override.conf toegevoegd aan /etc/systemd/system/getty@tty1.service.d
maar nu komt de output op het scherm te staan.
Tevens sudo mkdir getty.target.wants gedaan.

Override.conf verdwijderd.

directory etc/systemd/system/getty.target.wants toegevoegd.
Daarna raspi-config automatisch login toegepast


etc/rc.local aangepast

#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

# Print the IP address
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi
#Suppress Kernel Messages
dmesg --console-off                                                                                                     
exit 0

geen effect

FBCON map naar 2 gezet in de cmdline.txt

Nginx

server{
    listen 80;

    # Make site accessible from http://localhost/
    server_name 192.168.21.18;
    root /home/pi/UI/xradio-pro/;
    index index.html;
    location / {
        try_files $uri $uri/ /index.html;
    }
}


https://medium.com/@CristianSitov/delivering-multiple-angular2-apps-with-a-single-nginx-server-at-different-urls-55b42ca4c4ce



