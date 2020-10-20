#! /bin/bash

read -p "enter first number : " a
read -p "enter second number : " b
read -p "enter third number : " c

declare -A dict

arithmatic_operation()
{

   op1=$( awk 'BEGIN{printf "%.3f", ( '$1' + '$2' * '$3' ) }' )
   op2=$( awk 'BEGIN{printf "%.3f", ( '$1' % '$2' + '$3' ) }' )
   op3=$( awk 'BEGIN{printf "%.3f", ( '$3' + '$1' / '$2' ) }' )
   op4=$( awk 'BEGIN{printf "%.3f", ( '$1' * '$2' + '$3' ) }' )

   dict[a + b * c]=$op1
   dict[a % b + c]=$op2
   dict[c + a / b]=$op3
   dict[a * b + c]=$op4

}

arithmatic_operation $a $b $c

declare -a array
index=0
for values in ${dict[@]}
do
  array[index++]=$values
done

echo "Non sorted array : "${array[@]}                     # printing non sorted array


for ((i = 0; i<$((${#array[@]}-1)); i++))                # outer loop
do

    for((j = $(($i+1)); j<${#array[@]}; j++))             # inner loop
    do

        if (( $(echo "${array[j]} ${array[i]}" | awk '{print ($1 < $2)}') ))                  # finding minimum value
        then
            # swaping value
            temp=${array[i]}                                #temp variable to store the number
            array[i]=${array[j]}
            array[j]=$temp
        fi
    done
done

echo "Sorted array in Ascending order : "${array[@]}


for ((i = 0; i<$((${#array[@]}-1)); i++))                  # outer loop
do

    for((j = $(($i+1)); j<${#array[@]}; j++))              # inner loop
    do

        if (( $(echo "${array[j]} ${array[i]}" | awk '{print ($1 > $2)}') ))                # finding maximun value value
        then
            # swaping value
            temp=${array[i]}                                #temp variable to store the number
            array[i]=${array[j]}
            array[j]=$temp
        fi
    done
done

echo "Sorted array in Descending order : "${array[@]}

