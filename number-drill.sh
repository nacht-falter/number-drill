#!/bin/bash
clear
echo "How many rounds do you want to practice?"
read -r rounds
correct=0
wrong=0
streak=0
longest_streak=0
while [ $(( correct + wrong )) -le "$rounds" ]; do
    clear
    echo "Correct: $correct"
    echo "Wrong: $wrong"
    echo "Streak: $streak"
    echo "Longest Streak: $longest_streak"
    number=$(( RANDOM % 10 ))
    echo "-------------------"
    echo -ne "Type: $number \r\n"
    read -rsn1 -t 1 input
    if [ -n "$input" ] && [ "$input" -eq "$number" ]; then
        echo "Correct!"
        sleep 0.25
        correct=$(( correct + 1 ))
        streak=$(( streak + 1 ))
        if [ $streak -gt $longest_streak ]; then
            longest_streak=$streak
        fi
    else
        echo "Wrong!"
        sleep 0.25
        streak=0
        wrong=$(( wrong + 1 ))
    fi
done
