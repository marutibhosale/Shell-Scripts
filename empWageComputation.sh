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

