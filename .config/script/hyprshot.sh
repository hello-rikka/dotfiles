

case $1 in
    "windows")
        hyprshot -m window
    ;;
    "region")
        echo $1 "region"
        
        hyprshot -m region
    ;;
    "output")
        hyprshot -m output
    ;;
    "clipboard")
        hyprshot -m output --clipboard-only
esac