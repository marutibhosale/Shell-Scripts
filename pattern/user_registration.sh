#! /bin/bash  -x

shopt -s extglob

read -p "Enter first name : " fName

read -p  "Enter last name :" lName

read  -p "Enter last name :" email



validateName()
{

     fNamePat="^[[:upper:]]{1}[[:lower:]]{2,10}$"

     if [[ $1 =~ $fNamePat ]]
     then
        echo "Name is valid"
     else
        echo "Name is not valid"
    fi


}

validateName $fName
validateName $lName

validateEmail()
{
    emailPat="^([a-z]{1})+[a-zA-Z0-9]*[\.\_\+\-]?[a-zA-z0-9]+\@[a-z0-9]{1,5}\.((com|net)|\.(com|au))+$"
     if [[ $1 =~ $emailPat ]]
     then
        echo "Email is valid"
     else
        echo "not valid email"
    fi


}


validateEmail $email
