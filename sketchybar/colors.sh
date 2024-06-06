#!/usr/bin/env bash

# Catppuccin Macchiato palette
# https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md

export BASE=0xff24273a #24273a
export MANTLE=0xff1e2030 #1e2030
export CRUST=0xff181926 #181926

export TEXT=0xffcad3f5 #cad3f5
export SUBTEXT0=0xffb8c0e0 #b8c0e0
export SUBTEXT1=0xffa5adcb #a5adcb

export SURFACE0=0xff363a4f #363a4f
export SURFACE1=0xff494d64 #494d64
export SURFACE2=0xff5b6078 #5b6078

export OVERLAY0=0xff6e738d #6e738d
export OVERLAY1=0xff8087a2 #8087a2
export OVERLAY2=0xff939ab7 #939ab7

export BLACK=0xff181926 #181926
export WHITE=0xf1f1f1f5 #f1f1f5
export BLUE=0xff8aadf4 #8aadf4
export LAVENDER=0xffb7bdf8 #b7bdf8
export SAPPHIRE=0xff7dc4e4 #7dc4e4
export SKY=0xff91d7e3 #91d7e3
export TEAL=0xff8bd5ca #8bd5ca
export GREEN=0xffa6da95 #a6da95
export YELLOW=0xffeed49f #eed49f
export PEACH=0xfff5a97f #f5a97f
export MAROON=0xffee99a0 #ee99a0
export RED=0xffed8796 #ed8796
export MAUVE=0xffc6a0f6 #c6a0f6
export PINK=0xfff5bde6 #f5bde6
export FLAMINGO=0xfff0c6c6 #f0c6c6
export ROSEWATER=0xfff4dbd6 #f4dbd6
export ORANGE=0xfff5a97f #f5a97f
export MAGENTA=0xffc6a0f6 #c6a0f6
export GREY=0xff939ab7 #939ab7

# General bar colors
export BAR_COLOR=0xff1e1e2e
export ICON_COLOR=$TEXT # Color of all icons
export LABEL_COLOR=$TEXT # Color of all labels
export BACKGROUND_1=0x603c3e4f
export BACKGROUND_2=0x60494d64

export POPUP_BACKGROUND_COLOR=0xff1e1e2e
export POPUP_BORDER_COLOR=$WHITE

export SHADOW_COLOR=$BLACK

export RANDOM_CAT_COLOR=("$BLUE" "$LAVENDER" "$SAPPHIRE" "$SKY" "$TEAL" "$GREEN" "$YELLOW" "$PEACH" "$MAROON" "$RED" "$MAUVE" "$PINK" "$FLAMINGO" "$ROSEWATER")

function getRandomCatColor() {
  echo "${RANDOM_CAT_COLOR[ $RANDOM % ${#RANDOM_CAT_COLOR[@]} ]}"
}
