imagePath=~/.config/wallpapers/desktop/
theme=~/.config/rofi/select/selectswww.rasi
dirImgMenu=~/.config/wallpapers/wallmenu
handlerImage() {
  image=$(ls $imagePath | while read A; do echo -en "$A\x00icon\x1f$imagePath$A\n"; done | rofi -dmenu -theme $theme )
  link_img="${imagePath}${image}"
  imagecurrent=$(swww query)
  swwwsquery=$(echo $imagecurrent | awk -F'image: ' '{print $2}')
  if [ $? -eq 0 ];then
        date=$(date '+%Y-%m-%d-%H:%M:%S')
        extension="${link_img##*.}"
        echo $link_img
        mv "$link_img" "$imagePath"wallpage"$date.$extension"
        link_img="${imagePath}wallpage${date}.${extension}"
  fi
  if [ "$swwwsquery" != "$link_img" ]; then
      swww img $link_img --transition-fps 60 --transition-type wave --transition-duration 5 --transition-wave 10,20
      magick $link_img -resize 1000x600! $dirImgMenu
      dunstify -a "wallpaper" $image "done !" -u critical -I $link_img
  fi

}
handlerImage
