#! /bin/bash


flip_result()                                          # function for flip generations
{
   head_count=0
   tail_count=0
   while [ $head_count -ne 21 -a $tail_count -ne 21 ]  # condition of either of head and tail become 21
   do
     res=$((RANDOM%2))
     if [ $res -eq 1 ]
     then
        head_count=$(($head_count+1))
     else
       tail_count=$(($tail_count+1))
     fi
  done
  echo "$head_count $tail_count"                              # returning  head and tail count
}



if_tie()                                                    # function  for tie condition
{
   head_count=$1
   tail_count=$2
   while [ $((head_count-tail_count)) -lt 2 -a $((tail_count-head_count)) -lt 2 ]     # condition for difference between heads and tails 2
   do
     res=$((RANDOM%2))
     if [ $res -eq 1 ]
     then
        head_count=$(($head_count+1))
     else
       tail_count=$(($tail_count+1))
     fi
  done
  echo "$head_count $tail_count"

}



result=$( flip_result )                                       # calling function
head_c=$( echo $result | awk '{print $1}' )

tail_c=$( echo $result | awk '{print $2}' )



if [ $head_c -eq $tail_c ]                                    # checking tie condition
then
   echo "number of heads and number of tails are same : "
   echo "head_count=$head_c , tail_count=$tail_c"
   echo"Press 1 to continue"
   read press
   if [ $press -eq 1 ]
   then
       after_tie=$( if_tie $head_c $tail_c )                     # calling if_tie function
       head_c=$( echo $after_tie | awk '{print $1}' )
       tail_c=$( echo $after_tie | awk '{print $2}' )
   else
        echo "Invalid press"
   fi
fi


echo "head count = $head_c, tail count = $tail_c"
if [ $head_c -gt $tail_c ]
then
    echo "number heads are more than tails by $((head_c-tail_c)) counts"
else
    echo "number tails are more than heads by $((tail_c-head_c)) counts"
fi


