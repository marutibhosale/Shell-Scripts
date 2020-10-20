#! /bin/bash  -x

declare -A combination
combination[H]=0
combination[T]=0
combination[HH]=0
combination[HT]=0
combination[TH]=0
combination[TT]=0
combination[HHH]=0
combination[HHT]=0
combination[HTH]=0
combination[HTT]=0
combination[THH]=0
combination[THT]=0
combination[TTH]=0
combination[TTT]=0


singlet()
{
    count=0
    while [ $count -lt 100 ]
    do
       rand=$((RANDOM%2))
       if [ $rand -eq 1 ]
       then
           combination[H]=$((${combination[H]}+1))
       else
           combination[T]=$((${combination[T]}+1))
       fi
       ((count++))
   done

}


doublet()
{

    count=0

    while [ $count -lt 200 ]
    do
       rand1=$((RANDOM%2))
       rand2=$((RANDOM%2))

       rand=$rand1""$rand2

       if [ $rand -eq 11 ]
       then
          combination[HH]=$((${combination[HH]}+1))

       elif [ $rand -eq 10 ]
       then
          combination[HT]=$((${combination[HT]}+1))

       elif [ $rand -eq 01 ]
       then
          combination[TH]=$((${combination[TH]}+1))
       else
          combination[TT]=$((${combination[TT]}+1))
       fi
       ((count++))
   done


}


triplet()
{
    count=0

    while [ $count -lt 400 ]
    do
       rand1=$((RANDOM%2))
       rand2=$((RANDOM%2))
       rand3=$((RANDOM%2))
       rand=$rand1""$rand2""$rand3

       if [ $rand -eq 111 ]
       then
           combination[HHH]=$((${combination[HHH]}+1))

       elif [ $rand -eq 110 ]
       then
          combination[HHT]=$((${combination[HHT]}+1))

       elif [ $rand -eq 101 ]
       then
          combination[HTH]=$((${combination[HTH]}+1))

       elif [ $rand -eq 100 ]
       then
          combination[HTT]=$((${combination[HTT]}+1))

       elif [ $rand -eq 011 ]
       then
          combination[THH]=$((${combination[THH]}+1))

       elif [ $rand -eq 010 ]
       then
           combination[THT]=$((${combination[THT]}+1))

       elif [ $rand -eq 001 ]
       then
            combination[TTH]=$((${combination[TTH]}+1))
       else
           combination[TTT]=$((${combination[TTT]}+1))
       fi
       ((count++))

   done


}
singlet
doublet
triplet


declare -a array_values

declare -a array_keys
index=0
for key in ${!combination[@]}
do
  array_values[$index]=${combination[$key]}
  array_keys[$index]=$key
  index=$(($index+1))
done


len=${#array_values[@]}
for (( i=0; i<$len; i++ ))
do
   for (( j=$(($i+1)); j<$len; j++ ))
   do
      if [ ${array_values[j]} -gt ${array_values[i]} ]
      then
          temp_value=${array_values[i]}
          temp_key=${array_keys[i]}
          array_values[i]=${array_values[j]}
          array_keys[i]=${array_keys[j]}
          array_values[j]=$temp_value
          array_keys[j]=$temp_key
      fi
   done
done

echo "${array_keys[@]}"
echo "${array_values[@]}"
echo "${array_keys[0]}  has highest count value than other combinations"
