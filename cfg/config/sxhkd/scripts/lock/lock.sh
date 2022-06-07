#aur/i3lock-color-git

# Switch foreign layout
setxkbmap us

insidevercolor=0f0f0f00
insidewrongcolor=0f0f0f00
insidecolor=aaaaaa22

ringvercolor=0f0f0faa
ringwrongcolor=d84040aa
ringcolor=888888aa

linecolor=303030ff

keyhlcolor=ffaf00aa
bshlcolor=d84040aa

separatorcolor=ffffff00

i3lock \
	--ignore-empty-password \
	--indicator \
	--image=/home/snekyy/.config/sxhkd/scripts/lock/lock.png \
	--centered \
	--blur=3 \
	\
	--pass-media-keys \
	--pass-screen-keys \
	--pass-power-keys \
	--pass-volume-keys \
	\
	--inside-color=$insidecolor \
	--insidever-color=$insidevercolor \
	--insidewrong-color=$insidewrongcolor \
	\
	--radius=80 \
	--ring-width=10 \
	--ring-color=$ringcolor \
	--ringver-color=$ringvercolor \
	--ringwrong-color=$ringwrongcolor \
	\
	--line-color=$linecolor \
	\
	--keyhl-color=$keyhlcolor \
	--bshl-color=$bshlcolor \
	\
	--separator-color=$separatorcolor \
	\
	--verif-text="" \
	--wrong-text="" \
	--noinput-tex="" \
	--lock-text="" \
	--greeter-text="" \
	--no-modkey-text \
