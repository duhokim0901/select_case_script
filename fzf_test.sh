#!/bin/bash

# 선택할 옵션 목록
options=("옵션1" "옵션2" "옵션3" "옵션4")

# fzf로 목록을 띄우고 선택
selected=$(printf "%s\n" "${options[@]}" | fzf --height 10 --border --reverse)

# 선택된 값 출력
echo "선택한 옵션: $selected"