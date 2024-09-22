DirIconLocal=$HOME/.icons
DirThemeLocal=$HOME/.themes
DirFontLocal=$HOME/.local/share/fonts
DirConfigLocal=$HOME/.config

DirIcon=.icons/*
DirTheme=.themes/*
DirFont=.local/share/fonts/*
DirConfig=/.config/*

checkDir(){
    ls $1 >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "có folder" $1
    else
        mkdir $1
        echo "đã tạo folder" $1
    fi
}

checkDir "$DirIconLocal"
checkDir "$DirThemeLocal"
checkDir "$DirFontLocal"

Cp(){
    cp -r $1 $2 >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "đã di chuyển file $1 đến $2"
    else
        echo "không thể di chuyển file $1 đến $2"
    fi
}

Cp "$DirIcon" "$DirIconLocal"
Cp "$DirTheme" "$DirThemeLocal"
Cp "$DirFont" "$DirFontLocal"


git clone https://aur.archlinux.org/paru-git.git
cd paru-git
makepkg -si

if [ $? -eq 0 ]; then
        echo "đã cài đặt paru"
    else
        echo "cài đặt không thành công"
    fi


paru -Syu --skipreview --noconfirm -y
if [ $? -eq 0 ]; then
        echo "đã cập nhập thành công"
    else
        echo "đã cập nhập không thành công"
    fi



package=(hyprland zsh sway network-manager-applet blueman dunst rofi-lbonn-wayland-git jd-tool waybar swww cliphist polkit-kde-agent xdg-desktop-portal-hyprland brightnessctl pavucontrol pamixer nwg-look fcitx5-bamboo-git fcitx5-gtk fcitx5-configtool)

for variable in ${package[@]}
do
    paru -S $variable --skipreview --noconfirm -y > 
    if [ $? -eq 0 ]; then
        echo "Đã cài xong $variable"
    else
        echo "lỗi cài đặt $variable"
        echo "$variable" >> ./log/logerrors.txt
    fi
done

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp -r $DirConfig $DirConfigLocal





