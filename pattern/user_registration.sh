#! /bin/bash  -x

shopt -s extglob


read -p "Enter first name : " fName

read -p  "Enter last name :" lName

read  -p "Enter last name :" email

read -p "Enter phone number :" pNumber

read -p "Enter password : " password


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


validatePhone()
{

   phonePat="^(\+91|\+0)?[9876]{1}[0-9]{9}$"
     if [[ $1 =~ $phonePat ]]
     then
        echo "Phone number is valid"
     else
        echo "not valid phone number"
    fi

}

validatePhone $pNumber


validatePassword()
{
   passPat="^(?=.*[a-z])(?=.*[0-9])(?=.*[A-z])(?=.*[@!#?])[a-zA-Z0-9@!#?]{8,15}$"
     if [[ $1 =~ $passPat ]]
     then
        echo "password validate done"
     else
        echo "password requirement not match"
    fi


}

validatePassword $password
