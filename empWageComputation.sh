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


# solving using switch case statement(UC4)

echo "Press 1 for part time wage"
echo "Press 2 for full time wage"

read num

case $num in
          1)echo "Part time wage : "$part_time_wage;;
          2)echo "Full time wage : "$daily_wage;;
          *)echo "Invalid choice";;
esac

# Calculating Wages for a Month(UC5)

WORKING_DAY_PER_MONTH=20

monthly_wage=$(($daily_wage*$WORKING_DAY_PER_MONTH))

echo "Monthly wage is : "$monthly_wage

# Calculate Wages till a condition of total working hours or days is reached for a month (UC6)


total_working_hours=0
total_working_days=0
total_wage=0
work_done_per_day=0

#declaration of dictionary
declare -A day_wise_wage_storage                    # declare dict for storing day wise wage (UC8)


get_work_done_per_day(){                            # refactor code to get working hour (UC7)

case $1 in
          0) work_done_per_day=$PART_TIME_HOUR;;
          1) work_done_per_day=$FULL_DAY_HOUR;;
          *) work_done_per_day=0;;
esac

echo $work_done_per_day

}


while [[ $total_working_days -lt 20 && $total_working_hours -lt 100 ]]
do
        ((total_working_days++));
        work_done_per_day=$( get_work_done_per_day $((RANDOM%2)) )
        total_working_hours=$((total_working_hours+work_done_per_day));
        temp_wage=$((work_done_per_day*WAGE_PER_HOUR));
        total_wage=$((temp_wage+total_wage));
        day_wise_wage_storage[$total_working_days]=$temp_wage           # storing day wise wage in dict (UC8)


done

# declare array
declare -a total_wage
total_wage[0]=$Total_wage                                           # storing total wage in array (UC8)

echo "Total monthly wage : "$total_wage
echo  ${day_wise_wage_storage[@]}





