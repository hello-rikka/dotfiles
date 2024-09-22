brightness_max=$(brightnessctl max)
case $1 in
    "+")
    echo $1
        brightnessctl set 5%+
        brightness_current=$(brightnessctl get)
        dunstify -a "brightnessctl" -I ~/.config/dunst/icon/sunflower_4174560.png -t 2000 -r 1 -u critical  $((brightness_current * 100 / brightness_max))

    ;;
    "-")
    echo $1
        brightnessctl set 5%-
        brightness_current=$(brightnessctl get)
        dunstify -a "brightnessctl" -I ~/.config/dunst/icon/sunflower_4174560.png -t 2000 -r 1 -u critical $((brightness_current * 100 / brightness_max))
    ;;
esac
