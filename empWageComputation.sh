#! /bin/bash

echo "Welcome to Employee Wage Computation"


# Employee attendance (UC1)

is_present=$((RANDOM%2))

if [ $is_present -eq 1 ]
then
    echo "Employee is present"
else
   echo "Employee is not present"
fi


# employee daily wage (UC2)

WAGE_PER_HOUR=20
FULL_DAY_HOUR=8

daily_wage=$(($WAGE_PER_HOUR*$FULL_DAY_HOUR))

echo "Daily employee wage is: "$daily_wage



# employee part time wage (UC3)

PART_TIME_HOUR=4
part_time_wage=$(($WAGE_PER_HOUR*$PART_TIME_HOUR))

echo "Part time wage is : "$part_time_wage


# solving using switch case statement

echo "Press 1 for part time wage"
echo "Press 2 for full time wage"

read num

case $num in
          1)echo "Part time wage : "$part_time_wage;;
          2)echo "Full time wage : "$daily_wage;;
          *)echo "Invalid choice";;
esac
