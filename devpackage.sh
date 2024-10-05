paru -Syu --skipreview --noconfirm -y

package=(visual-studio-code-bin dotnet-sdk aspnet-runtime nodejs npm obs-studio wps-office) 

for item in ${package[@]}; do
    paru -Qs $item >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "[Đã được cài đặt]" $item
    else
        paru -S $item --skipreview --noconfirm -y >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "[Đã cài xong] $item"
        else
            echo "[lỗi cài đặt] $item"
            echo "$item" >> ./log/logdev.txt
        fi
    fi
done
