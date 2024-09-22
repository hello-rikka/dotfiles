ls ~/.config > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Lệnh thành công."
else
    echo "Lệnh thất bại."
fi