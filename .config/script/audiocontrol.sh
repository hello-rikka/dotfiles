check=$(pamixer --get-mute)
case $1 in
    "+")
        pamixer -i 5
        volume_current=$(pamixer --get-volume)
        dunstify -a "audio" -I ~/.config/dunst/icon/volume-up.png  -t 2000 -r 1 -u critical $volume_current
    ;;
    "-")
        pamixer -d 5
        volume_current=$(pamixer --get-volume)
        dunstify -a "audio" -I ~/.config/dunst/icon/volume-down.png  -t 2000 -r 1 -u critical $volume_current
    ;;
    "mute")
    pamixer -t
        echo $check
        if [ $check = "true" ]
        then
        dunstify -a "audio" -I ~/.config/dunst/icon/sound_4240135.png -t 2000 -r 1 -u critical "on"
        else
        dunstify -a "audio" -I ~/.config/dunst/icon/mutr.png -t 2000 -r 1 -u critical 'mute'
        fi
    ;;
    "mic")
    pamixer --default-source -t
        statusMic=$(pamixer --default-source --get-mute)
        if [[ $statusMic == "false" ]]
        then
        dunstify -a "audio" -I ~/.config/dunst/icon/microphone_4234900.png -t 2000 -r 1 -u critical "mic on"
        else
        dunstify -a "audio" -I ~/.config/dunst/icon/microphone_4234900.png -t 2000 -r 1 -u critical "mic off"
        fi
esac
