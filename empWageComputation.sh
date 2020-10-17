#! /bin/bash

echo "Welcome to Employee Wage Computation"


# Employee attendance (UC1)

is_present=$((RANDOM%2))

if [ $is_present -eq 1 ]
then
    echo "Employee is present"
else:
   echo "Employee is not present"
fi

# employee daily wage (UC2)

WAGE_PER_HOUR=20
FULL_DAY_HOUR=8

daily_wage=$(($WAGE_PER_HOUR*$FULL_DAY_HOUR))

echo "Daily employee wage is: "$daily_wage
