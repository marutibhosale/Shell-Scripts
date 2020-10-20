#! /bin/bash

declare -A combination       # dict for storing combinations results
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


singlet()                    # function for singlet combinations
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


doublet()                 # function for doublet combinations
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


triplet()                    #  function for tripet combinations
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

# percentage singlet
echo "H percentage ${combination[H]} %"
echo "T percentage ${combination[T]} %"

# percentage doublet
hh_p=$( awk 'BEGIN{printf "%.3f", ( '${combination[HH]}'/'200' ) }' )
ht_p=$( awk 'BEGIN{printf "%.3f", ( '${combination[HT]}'/'200' ) }' )
th_p=$( awk 'BEGIN{printf "%.3f", ( '${combination[TH]}'/'200' ) }' )
tt_p=$( awk 'BEGIN{printf "%.3f", ( '${combination[TT]}'/'200' ) }' )

echo "HH percentage $hh_p %"
echo "HT percentage $ht_p %"
echo "TH percentage $th_p %"
echo "TT percentage $tt_p %"

# percentage tripet
hhh_p=$( awk 'BEGIN{printf "%.3f", ( '${combination[HHH]}'/'400' ) }' )
hht_p=$( awk 'BEGIN{printf "%.3f", ( '${combination[HHT]}'/'400' ) }' )
hth_p=$( awk 'BEGIN{printf "%.3f", ( '${combination[HTH]}'/'400' ) }' )
htt_p=$( awk 'BEGIN{printf "%.3f", ( '${combination[HTT]}'/'400' ) }' )
thh_p=$( awk 'BEGIN{printf "%.3f", ( '${combination[THH]}'/'400' ) }' )
tht_p=$( awk 'BEGIN{printf "%.3f", ( '${combination[THT]}'/'400' ) }' )
tth_p=$( awk 'BEGIN{printf "%.3f", ( '${combination[TTH]}'/'400' ) }' )
ttt_p=$( awk 'BEGIN{printf "%.3f", ( '${combination[TTT]}'/'400' ) }' )

echo "HHH percentage $hhh_p %"
echo "HHT percentage $hht_p %"
echo "HTH percentage $hth_p %"
echo "HTT percentage $htt_p %"
echo "THH percentage $thh_p %"
echo "THT percentage $tht_p %"
echo "TTH percentage $tth_p %"
echo "TTT percentage $ttt_p %"


declare -a array_values         # storing all dict values in array for sorting

declare -a array_keys          # storing all keys in array to keep records which key has max value

index=0
for key in ${!combination[@]}
do
  array_values[$index]=${combination[$key]}
  array_keys[$index]=$key
  index=$(($index+1))
done

# sorting array with keeping key record
len=${#array_values[@]}                 # length of array
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

echo "${array_keys[@]}"                # printing sorted combinations type
echo "${array_values[@]}"              # printing sorted values
echo "${array_keys[0]}  has highest count value than other combinations"
