#!/bin/bash
# For openSUSE Leap 42.2 and use at your own risk!
# Vinícius Barros Rodrigues, for sugestions: viniciusbrbio@gmail.com
# If you want avoid installing some repos add hashtag in the begin of the line.

echo "Update and dist-upgrade"
sudo zypper -n up
sudo zypper -n dist-upgrade

echo "Packman and Libdvdcss repos for multimedia"
sudo zypper -n ar -f http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_42.2/ packman
sudo zypper -n ar -f http://opensuse-guide.org/repo/openSUSE_Leap_42.2/ libdvdcss
sudo zypper --gpg-auto-import-keys ref
sudo zypper up

echo "Installing multimedia packages"
sudo zypper -n install ffmpeg lame gstreamer-plugins-bad gstreamer-plugins-ugly gstreamer-plugins-ugly-orig-addon gstreamer-plugins-libav libdvdcss2 --auto-agree-with-licenses
sudo zypper dist-upgrade

echo "Installing apps"
sudo zypper -n install inkscape gimp lollypop bleachbit unetbootin evince-plugin-djvudocument evince-plugin-comicsdocument evince-plugin-xpsdocument evince-plugin-tiffdocument evince-plugin-dvidocument wine xournal kile goldendict pdfchain uget steam octave vlc R-base git kdenlive audacity simplescreenrecorder gpsbabel virtualbox openshot breeze keepassx meld

echo "Some latex and R packages"
sudo zypper install cmake automake texlive-subfloat zlibrary ghc-zlib zlib-devel libopenssl-devel libssh2-devel libcurl-devel libconfig9 libconfig++9 libconfig-devel gcc-c++ typelib-1_0-GtkVnc-1_0 typelib-1_0-GtkVnc-2_0 libgtk-vnc-1_0-0 libgtk-vnc-2_0-0

sudo zypper -n ar -f http://download.opensuse.org/repositories/home:/awissu/openSUSE_Leap_42.2/home:awissu.repo

sudo zypper -n ar -f http://download.opensuse.org/repositories/home:/luke_nukem/openSUSE_Leap_42.2/home:luke_nukem.repo

sudo zypper -n ar -f http://download.opensuse.org/repositories/games:/tools/openSUSE_Leap_42.2/games:tools.repo

sudo zypper -n ar -f http://download.opensuse.org/repositories/Application:/Geo/openSUSE_Leap_42.2/Application:Geo.repo

sudo zypper -n ar -f http://download.opensuse.org/repositories/home:/cornell_vrdc/openSUSE_Leap_42.2/home:cornell_vrdc.repo

sudo zypper -n ar -f http://download.opensuse.org/repositories/home:/cornell_vrdc/openSUSE_Leap_42.2/home:bgta:desktop.repo

sudo zypper --gpg-auto-import-keys ref

sudo zypper -n refresh

sudo zypper -n up

sudo zypper install brackets GitKraken PlayOnLinux viking jabref skype 

wget https://download1.rstudio.org/rstudio-1.0.44-x86_64.rpm

sudo zypper -n install rstudio-1.0.44-x86_64.rpm

sudo rm rstudio-1.0.44-x86_64.rpm

sudo zypper -n dist-upgrade

sudo zypper -n dist-upgrade --from packman

echo "Finishing"
sudo zypper -n verify
sudo zypper -n clean

echo "Removing trash"
sudo zypper -n remove gnome-contacts gnome-dictionary gnome-weather empathy okular polari liferea konqueror gnome-documents gnome-music gnome-maps evolution shotwell aisleriot iagno xboard gnuchess quadrapassel gnome-clocks gnome-sudoku swell-foop lightsoff gnome-mines gnome-mahjongg bijiben gnome-software nautilus-sendto evolution-data-server

echo "Reboot?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo reboot;;
        No ) exit;;
    esac
done
