#! /bin/bash
# RFS 2021

# see man lpr for options, lpstat -a for list of printers

declare -A printers
printers["DCP7030-1Recto"]="lpr -PBrother_DCP-7030"
printers["M551-2x2RV"]="lpr -PHP_LaserJet_500_color_M551 -o number-up=2 -o sides=two-sided-short-edge"
printers["M551-1x1-RV"]="lpr -PHP_LaserJet_500_color_M551"

LIST=`echo "${!printers[@]}" | sed "s: :\\\\\\n:g"`

PRINTER=`echo -e "$LIST" | rofi -config ~/.config/rofi/config -dmenu -p "Printers"`

COMMAND=`echo ${printers[$PRINTER]} ${1@Q}`

printf "%s\n" "$COMMAND"
eval "$COMMAND"
