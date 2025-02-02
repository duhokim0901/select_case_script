#!/bin/bash

options=("옵션1" "옵션2" "옵션3" "옵션4")
selected=$(whiptail --title "옵션 선택" --menu "원하는 옵션을 선택하세요:" 15 50 4 \
    "1" "옵션1" \
    "2" "옵션2" \
    "3" "옵션3" \
    "4" "옵션4" \
    3>&1 1>&2 2>&3)

echo "선택한 옵션: $selected":
