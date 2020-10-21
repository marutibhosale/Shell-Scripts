#! /bin/bash  -x

shopt -s extglob

read -p "Enter first name : " fName

read -p  "Enter last name :"lName


validateName()
{

     fNamePat="^[[:upper:]]{1}[[:lower:]]{2,10}$"

     if [[ $1 =~ $fNamePat ]]
     then
        echo "yes"
     else
        echo "no"
    fi


}

validateName $fName
validateName $lName
