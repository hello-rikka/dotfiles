DirIconLocal=$HOME/.icons
DirThemeLocal=$HOME/.themes
DirFontLocal=$HOME/.local/share/fonts
DirConfigLocal=$HOME/.config

DirIcon=.icons/*
DirTheme=.themes/*
DirFont=.local/share/fonts/*
DirConfig=.config/*


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


pacman -Qs paru >/dev/null 2>&1
if [ $? -eq 0 ];then
    echo "paru đã được cài đặt"
else
    git clone https://aur.archlinux.org/paru-git.git
    cd paru-git
    makepkg -si
    if [ $? -eq 0 ]; then
        echo "đã cài đặt thành công paru"
    else
        echo "cài đặt không thành công"
    fi
fi



paru -Syu --skipreview --noconfirm -y
if [ $? -eq 0 ]; then
    echo "đã cập nhập thành công"
else
    echo "đã cập nhập không thành công"
fi



package=(hyprland btop swaylock-effects hyprshot zsh sway network-manager-applet kitty blueman dunst rofi-lbonn-wayland-git jd-tool waybar swww cliphist polkit-kde-agent xdg-desktop-portal-hyprland brightnessctl pavucontrol pamixer nwg-look fcitx5-bamboo-git fcitx5-gtk fcitx5-configtool nemo atool )

for variable in ${package[@]}
do
    paru -Qs $variable >/dev/null 2>&1
    if [ $? -eq 0 ];then
        echo "[Đã được cài đặt] $variable"
        continue
    else
        paru -S $variable --skipreview --noconfirm -y >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "[Đã cài xong] $variable"
        else
            echo "[lỗi cài đặt] $variable"
            echo "$variable" >> ./log/logerrors.txt
        fi
    fi

done

echo "Đã cài xong package"


read -p "Bạn có muốn tải wallpaper không?(Y/N) : " bool
echo "$bool"
if [ $bool == "N" ]; then
    mkdir $HOME/.config/wallpapers
    if [ $? -eq 0 ]; then
        echo "Tạo thư mục wallpapers thành công"
    else
        echo "Lỗi không tạo được thư mục wallpapers"
        echo "$HOME/.config/wallpapers" >> ./log/logerrors.txt
    fi
    mkdir $HOME/.config/wallpapers/desktop
    if [ $? -eq 0 ]; then
        echo "Tạo thư mục desktop thành công"
    else
        echo "Lỗi không tạo được thư mục desktop"
        echo "$HOME/.config/wallpapers/desktop" >> ./log/logerrors.txt
    fi
fi
if [ $bool == "Y" ]; then
    git clone https://github.com/meomeowth/wallpapers.git
    ls wallpapers
    if [ $? -eq 0 ]; then
        echo "đã tải thành công"
    else
        echo "tải không thành công"
    fi
    
    cp -r wallpapers $DirConfigLocal
    if [ $? -eq 0 ]; then
        echo "Đã config file wallpages"
    else
        echo "Config  không thành công"
    fi
fi



cp -r .config/* $HOME/.config/
Cp "$DirConfig" "$DirConfigLocal"
ls ~/.oh-my-zsh >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "oh-my-zsh đã cài đặt"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "oh-my-zsh đã cài đặt"
    
fi

cp .zshrc ~/



# reboot
