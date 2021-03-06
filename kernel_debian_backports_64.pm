<?xml version="1.0"?>
<app>

<category>
Kernels
</category>

<name>
Debian-Backports 64 bit
</name>

<description>
Debian Backports kernel Meltdown patched, 64 bit
</description>

<installable>
64
</installable>
 
<screenshot>none</screenshot>

<preinstall>
echo "deb http://http.debian.net/debian stretch-backports main">/etc/apt/sources.list.d/mxpitemp.list
apt-get update
apt-get install -t stretch-backports linux-image-amd64 linux-headers-amd64
</preinstall>

<install_package_names>
linux-image-amd64
linux-headers-amd64
</install_package_names>


<postinstall>
rm -f /etc/apt/sources.list.d/mxpitemp.list
/usr/share/mx-packageinstaller-pkglist/rebuild_dkms_packages.sh linux-image-amd64
apt-get -y remove linux-image-amd64 linux-headers-amd64
apt-get update
</postinstall>


<uninstall_package_names>

</uninstall_package_names>
</app>
