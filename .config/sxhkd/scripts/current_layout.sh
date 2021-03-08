CURRENT_LAYOUT=$(setxkbmap -query|awk -F : 'NR==3{print $2}' | sed 's/ //g')
echo $CURRENT_LAYOUT
