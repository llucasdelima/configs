#!/bin/bash
#############################
# Update Fedora e os packages
#############################
clear
sudo dnf upgrade --refresh -y

# define IFS como vazio para essa seção
# assim as arrays não se separam por espaços
IFS=""

#############################
# Repositorios exras
#############################
sudo rpm --import https://rpm.packages.shiftkey.dev/gpg.key # repo para o github desktop no linux
sudo sh -c 'echo -e "[shiftkey-packages]\nname=GitHub Desktop\nbaseurl=https://rpm.packages.shiftkey.dev/rpm/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://rpm.packages.shiftkey.dev/gpg.key" > /etc/yum.repos.d/shiftkey-packages.repo'

#############################
# Fedora packages
#############################
fedora_apps=(
    "dropbox"           # dropbox client
    "mpv"               # mpv midia player
    "gamescope"         # steam gamescope
    "goverlay"          # mangohud
    "Lutris"            # game manager
    "steam"             # steam
    "github-desktop"    # github client
    "syncthing"         # sync app
    "picard"            # music tagger
)
for n in ${fedora_apps[@]}
do
    sudo dnf install $n -y
done

#############################
# ffmpeg e codecs
#############################
sudo dnf install ffmpeg --allowerasing -y

#############################
# Binary install
#############################
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin # calibre - Ebook manager

#############################
# Flatpak app
#############################
flatpak_apps=(
    "de.haeckerfelix.Fragments"                          # torrent client
    "com.felipekinoshita.Kana"                           # japanese hiragana/katakana
    "info.febvre.Komikku"                                # comic reader
    "org.gnome.Solanum"                                  # pomodoro clock
    "com.mattjakeman.ExtensionManager"                   # gnome extensions manager
    "io.bassi.Amberol"                                   # gnome music player
    "flatpak install flathub com.github.taiko2k.tauonmb" # music player
    "io.github.flattool.Warehouse"                       # flatpak manager
    "io.github.giantpinkrobots.flatsweep"                # flatpak cleaner
    "com.github.tchx84.Flatseal"                         # flatpak permissions manager
    "it.mijorus.gearlever"                               # appimages manager
    "ca.desrt.dconf-editor"                              # dconf editor
    "io.gitlab.adhami3310.Converter"                     # image converter
    "org.gnome.gitlab.YaLTeR.VideoTrimmer"               # video trimmer
    "net.davidotek.pupgui2"                              # proton manager
    "flathub com.vscodium.codium"                        # code editor
    "page.codeberg.libre_menu_editor.LibreMenuEditor"    # menu editor
    )
for n in ${flatpak_apps[@]};
do
    flatpak install flathub $n -y
done

#############################
# Appimages
#############################
appimage_apps=(
    "https://todoist.com/linux_app/appimage"                                   # Todoist client
)
for n in ${appimage_apps[@]}
do
    wget -P ~/Downloads/ $n
done

#############################
# Gnome Extensions
#############################
gnome_ext=(
    "https://extensions.gnome.org/extension/615/appindicator-support/"
    "https://extensions.gnome.org/extension/3628/arcmenu/"
    "https://extensions.gnome.org/extension/3193/blur-my-shell/"
    "https://extensions.gnome.org/extension/517/caffeine/"
    "https://extensions.gnome.org/extension/779/clipboard-indicator/"
    "https://extensions.gnome.org/extension/307/dash-to-dock/"
    "https://extensions.gnome.org/extension/4736/smart-auto-move/"
    "https://extensions.gnome.org/extension/7065/tiling-shell/"
)
for n in ${gnome_ext[@]}
do
    xdg-open "$n"
done

#############################
# Other Downloads
#############################
other_downloads=(
    "https://github.com/Automattic/simplenote-electron/releases/latest/" # Simplenote
    "https://www.blender.org/download/"                                  # Blender
    "https://krita.org/en/download/"                                     # Krita
    "https://godotengine.org/download/linux/"                            # Godot
    "https://www.pureref.com/download.php"                               # Pureref
    "https://app.gumroad.com/d/904c6b0ca8a2d4c38c046871e4546690"         # Aseprite
    "https://www.slsknet.org/news/"                                      # Soulseek
)
for n in ${other_downloads[@]}
do
    xdg-open "$n"
done
