#!/bin/bash
# For openSUSE Leap 42.2

echo "Update and dist-upgrade"
sudo zypper up
sudo zypper dist-upgrade

echo "Packman and Libdvdcss repos for multimedia"
sudo zypper ar -f http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_42.2/ packman
sudo zypper ar -f http://opensuse-guide.org/repo/openSUSE_Leap_42.2/ libdvdcss
sudo zypper up

echo "Installing multimedia packages"
sudo zypper install ffmpeg lame gstreamer-plugins-bad gstreamer-plugins-ugly gstreamer-plugins-ugly-orig-addon gstreamer-plugins-libav libdvdcss2 --auto-agree-with-licenses
sudo zypper dist-upgrade

echo "Installing apps"
sudo zypper install inkscape gimp lollypop bleachbit unetbootin wine xournal kile goldendict pdfchain uget steam octave vlc R-base git kdenlive audacity simplescreenrecorder gpsbabel virtualbox openshot breeze keepassx 

echo "Some packages"
sudo zypper install cmake automake texlive-subfloat

sudo zypper ar -f http://download.opensuse.org/repositories/home:/awissu/openSUSE_Leap_42.2/home:awissu.repo

sudo zypper ar -f http://download.opensuse.org/repositories/home:/luke_nukem/openSUSE_Leap_42.2/home:luke_nukem.repo

sudo zypper ar -f http://download.opensuse.org/repositories/games:/tools/openSUSE_Leap_42.2/games:tools.repo

sudo zypper ar -f http://download.opensuse.org/repositories/Application:/Geo/openSUSE_Leap_42.2/Application:Geo.repo

sudo zypper ar -f http://download.opensuse.org/repositories/home:/cornell_vrdc/openSUSE_Leap_42.2/home:cornell_vrdc.repo

sudo zypper refresh

sudo zypper up

sudo zypper install brackets GitKraken PlayOnLinux viking jabref

wget https://download1.rstudio.org/rstudio-1.0.44-x86_64.rpm

sudo zypper install rstudio-1.0.44-x86_64.rpm

sudo zypper dist-upgrade

sudo zypper dist-upgrade --from packman

echo "Finishing"
sudo zypper verify
sudo zypper clean

echo "Removing trash"
sudo zypper remove gnome-contacts gnome-dictionary gnome-weather empathy okular polari liferea konqueror gnome-documents gnome-music gnome-maps evolution shotwell aisleriot iagno xboard gnuchess quadrapassel gnome-clocks gnome-sudoku swell-foop lightsoff gnome-mines gnome-mahjongg bijiben gnome-software nautilus-sendto evolution-data-server

echo "Reboot?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo reboot;;
        No ) exit;;
    esac
done
