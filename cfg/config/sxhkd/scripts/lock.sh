#aur/i3lock-color-git

insidevercolor=0f0f0fff 
insidewrongcolor=0f0f0fff 
insidecolor=0f0f0fff
ringvercolor=ffffffff
ringwrongcolor=bf4040ff
ringcolor=ffffffff
linecolor=0f0f0fff
keyhlcolor=67b045ff
bshlcolor=bf4040ff
separatorcolor=ffffff00
verifcolor=52393bff
wrongcolor=bf4040ff
color=0f0f0fff
timecolor=ffffffff

# if you lock screen with "ru" layout you will can't enter password
# with english characters, so
# you will be stacked forever in this shit
setxkbmap us 

i3lock -e \
    --clock --indicator \
    \
    --pass-power-keys   \
    --pass-volume-keys  \
    \
    --insidevercolor=$insidevercolor \
    --insidewrongcolor=$insidewrongcolor \
    --insidecolor=$insidecolor \
    \
    --ringvercolor=$ringvercolor \
    --ringwrongcolor=$ringwrongcolor \
    --ringcolor=$ringcolor \
    --ring-width=15 \
    --radius=300 \
    \
    --linecolor=$linecolor \
    \
    --keyhlcolor=$keyhlcolor \
    --bshlcolor=$bshlcolor \
    --separatorcolor=$separatorcolor \
    \
    --verifcolor=$verifcolor \
    --veriftext="..."  \
    \
    --wrongcolor=$wrongcolor \
    --wrongtext="Incorrect" \
    \
    --color=$color \
    --timecolor=$timecolor \
    --timestr="%H:%M" \
    --datecolor=$timecolor \
    --datestr="%A" \
    --date-font=Hack \
    --date-font=Hack \
    --datesize=55 \
    --timesize=130  \
    --datepos="tx:700" \
    \
    --line-uses-ring
