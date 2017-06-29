#!/bin/bash

echo "+-----------------------------------------------------+"
echo "|    openSUSE 42.2 GNOME apps installation script     |"
echo "+-----------------------------------------------------+"

# For openSUSE Leap 42.2 and use at your own risk!
# Vinícius Barros Rodrigues, for sugestions: viniciusbrbio@gmail.com
# If you want avoid installing some stuffs add hashtag in the lines.

echo "+------------------------------------------------------------------+"
echo "Update and dist-upgrade"
echo "+------------------------------------------------------------------+"
sudo zypper -n up
sudo zypper -n dist-upgrade

echo "+------------------------------------------------------------------+"
echo "Packman and Libdvdcss repos for Multimedia"
echo "+------------------------------------------------------------------+"
sudo zypper -n ar -f http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_42.2/ packman
sudo zypper -n ar -f http://opensuse-guide.org/repo/openSUSE_Leap_42.2/ libdvdcss
sudo zypper --gpg-auto-import-keys ref
sudo zypper up

echo "+------------------------------------------------------------------+"
echo "Installing Multimedia Packages"
echo "+------------------------------------------------------------------+"
sudo zypper -n install ffmpeg lame gstreamer-plugins-bad gstreamer-plugins-ugly gstreamer-plugins-ugly-orig-addon gstreamer-plugins-libav libdvdcss2 --auto-agree-with-licenses
sudo zypper dist-upgrade

echo "+------------------------------------------------------------------+"
echo "Installing Apps"
echo "+------------------------------------------------------------------+"
sudo zypper -n install inkscape gimp lollypop bleachbit unetbootin evince-plugin-djvudocument redshift evince-plugin-comicsdocument evince-plugin-xpsdocument evince-plugin-tiffdocument evince-plugin-dvidocument wine xournal kile goldendict pdfchain uget steam octave vlc R-base git kdenlive audacity simplescreenrecorder gpsbabel virtualbox openshot breeze keepassx meld gpodder geany latexila redshift redshift-gtk gpick

echo "+------------------------------------------------------------------+"
echo "Some packages"
echo "+------------------------------------------------------------------+"
sudo zypper install cmake automake fetchmsttfonts texlive-subfloat nlopt-devel texlive-mdframed texlive-wrapfig zlibrary ghc-zlib zlib-devel libopenssl-devel libssh2-devel libcurl-devel libconfig9 libconfig++9 libconfig-devel gcc-c++ typelib-1_0-GtkVnc-1_0 typelib-1_0-GtkVnc-2_0 libgtk-vnc-1_0-0 libgtk-vnc-2_0-0 gtk-devel libxml2-devel gtk-devel gnome-doc-utils gnome-doc-utils-devel libgexiv2-devel libgps22 gnome-themes gnome-themes-extras VirtualGL VirtualGL-32bit VirtualGL-devel libgcrypt-devel

echo "+------------------------------------------------------------------+"
echo "Electron Apps - GitKraken, Franz, Manageyum, ClipGrab and Stremio"
echo "+------------------------------------------------------------------+"

wget http://getmega.net/index.php/download/file_a3e0f6660f/ElectronApps.tar.gz
sudo tar -xvf ElectronApps.tar.gz
sudo rm ElectronApps.tar.gz

echo "+------------------------------------------------------------------+"
echo "Other Apps"
echo "+------------------------------------------------------------------+"

cd Downloads/

echo "JabRef"
wget http://download.opensuse.org/repositories/home:/sebschub/openSUSE_Leap_42.2/noarch/jabref-3.8.1-12.1.noarch.rpm
sudo zypper install jabref-3.8.1-12.1.noarch.rpm

echo "yEd"
wget http://www.yworks.com/resources/yed/demo/yEd-3.16.2.1_64-bit_setup.sh
chmod +x yEd-3.16.2.1_64-bit_setup.sh
sh yEd-3.16.2.1_64-bit_setup.sh
sudo rm yEd-3.16.2.1_64-bit_setup.sh

echo "Viking GPS"
wget http://download.opensuse.org/repositories/Application:/Geo/openSUSE_Leap_42.2/x86_64/viking-1.6.2-2.10.x86_64.rpm
sudo zypper install -n viking-1.6.2-2.10.x86_64.rpm
sudo rm viking-1.6.2-2.10.x86_64.rpm

echo "Rstudio"
wget https://download1.rstudio.org/rstudio-1.0.136-x86_64.rpm
sudo zypper -n install rstudio-1.0.136-x86_64.rpm
sudo rm rstudio-1.0.136-x86_64.rpm

echo "Brackets"
wget http://download.opensuse.org/repositories/home:/awissu/openSUSE_Leap_42.2/x86_64/brackets-1.8-1.1.x86_64.rpm
sudo zypper install -n brackets-1.8-1.1.x86_64.rpm
sudo rm brackets-1.8-1.1.x86_64.rpm

echo "Qgis"
wget http://download.opensuse.org/repositories/Application:/Geo/openSUSE_Leap_42.2/x86_64/qgis-2.18.4-2.8.x86_64.rpm
sudo zypper -n install qgis-2.18.4-2.8.x86_64.rpm
sudo rm qgis-2.18.4-2.8.x86_64.rpm

sudo zypper -n refresh

sudo zypper -n up

sudo zypper -n dist-upgrade

sudo zypper -n dist-upgrade --from packman

echo "Snappy"
sudo zypper addrepo http://download.opensuse.org/repositories/system:/snappy/openSUSE_Leap_42.2/ snappy
sudo zypper install snapd
sudo systemctl enable --now snapd.socket

echo "+------------------------------------------------------------------+"
echo "Finishing"
echo "+------------------------------------------------------------------+"
sudo zypper -n verify
sudo zypper -n clean

echo "+------------------------------------------------------------------+"
echo "Removing trash"
echo "+------------------------------------------------------------------+"
sudo zypper -n remove gnome-contacts gnome-dictionary gnome-weather empathy okular gnome-nibbles gnome-robots gnome-tetravex four-in-a-row polari liferea five-or-more gnome-klotski tali konqueror gnome-documents gnome-music gnome-maps evolution 
shotwell aisleriot iagno xboard gnuchess quadrapassel gnome-clocks gnome-sudoku swell-foop lightsoff gnome-mines gnome-mahjongg bijiben gnome-software nautilus-sendto evolution-data-server

echo "+------------------------------------------------------------------+"
echo "Reboot?"
echo "+------------------------------------------------------------------+"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo reboot;;
        No ) exit;;
    esac
done
