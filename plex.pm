<?xml version="1.0"?>
<app>

<category>
Media Center
</category>

<name>  
Plex
</name>

<description>  
Plex Mediaserver (includes web client)
</description>

<installable>
all
</installable>

<screenshot>https://www.plex.tv/wp-content/uploads/2016/06/image-block-plex-media-server-macbook.jpg</screenshot>

<preinstall>
x-terminal-emulator -e apt-get install apt-transport-https
curl https://downloads.plex.tv/plex-keys/PlexSign.key | apt-key add -
echo "deb https://downloads.plex.tv/repo/deb ./public main">/etc/apt/sources.list.d/plex.list
x-terminal-emulator -e apt-get update
</preinstall>

<install_package_names>
plexmediaserver
</install_package_names>


<postinstall>
rm -f /etc/apt/sources.list.d/plex.list
cp /usr/share/mx-packageinstaller-pkglist/plex_stuff/default/plexmediaserver /etc/default/plexmediaserver
rm /etc/init.d/plexmediaserver
chown -R plex:plex /var/lib/plexmediaserver/
cp /usr/share/mx-packageinstaller-pkglist/plex_stuff/init/plexmediaserver /etc/init.d/plexmediaserver
update-rc.d plexmediaserver defaults
nohup service plexmediaserver start >/var/log/plex_initial_start.log
</postinstall>


<uninstall_package_names>
plexmediaserver
</uninstall_package_names>
</app>
