#aur/i3lock-color-git

insidevercolor=28282aff 
insidewrongcolor=28282aff
insidecolor=28282aff
ringvercolor=52393bff
ringwrongcolor=52393bff
ringcolor=52393bff
linecolor=52393bff
keyhlcolor=8c8c8cff
bshlcolor=bf4040ff
separatorcolor=00000000
verifcolor=52393bff
wrongcolor=52393bff
color=28282aff
timecolor=52393bff

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
    --datepos="tx:700"
