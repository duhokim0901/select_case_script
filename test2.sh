#!/bin/bash

# 방향키로 메뉴 선택 기능을 제공하는 함수
menu() {
    clear
    local choices=("$@")
    for index in "${!choices[@]}"; do
        if [[ $index -eq $menu_index ]]; then
            echo -e "\033[1;32m> ${choices[$index]}\033[0m"
        else
            echo "  ${choices[$index]}"
        fi
    done
}

# 방향키 입력 처리 함수
read_input() {
    read -n 1 -s -r key
    case $key in
        $'\x1b')  # ESC 키
            read -n 2 -s -r -t 0.1 key
            case $key in
                '[A') # 위쪽 화살표
                    ((menu_index--))
                    ;;
                '[B') # 아래쪽 화살표
                    ((menu_index++))
                    ;;
            esac
            ;;
        '') # 엔터키
            menu_choice=${choices[$menu_index]}
            return 1
            ;;
    esac
}

choices=("Option 1" "Option 2" "Option 3" "Exit")
menu_index=0

while true; do
    menu "${choices[@]}"
    read_input
    # 메뉴 인덱스의 범위를 조정합니다.
    if [[ $menu_index -lt 0 ]]; then
        menu_index=0
    elif [[ $menu_index -ge ${#choices[@]} ]]; then
        menu_index=$((${#choices[@]} - 1))
    fi
    if [ "$menu_choice" != "" ]; then
        break
    fi
done

echo "Selected option: $menu_choice"