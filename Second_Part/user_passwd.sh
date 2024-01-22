#!/bin/bash
#
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.
# Make sure the script is being executed with superuser privileges.
# Get the username (login).
# Get the real name (contents for the description field).
# Get the password.
# Create the account.
# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.
# Set the password.
# Check to see if the passwd command succeeded.
# Force password change on first login.
# Display the username, password, and the host where the user was created.



if [[ "${UID}" -ne 0 ]] #UID kullanici numarasini gosterir
then
    echo "please run this script with sudo or root"
    exit 1
fi

read -p "Enter the username to create : " USERNAME
read -p "Enter the profession of the person or aplication that will be using this account : " COMMENT
read -sp "Enter the password to user for the account :" PASSWORD
useradd -m -c $COMMENT -p $(echo $PASSWORD | openssl passwd -6 -stdin) $USERNAME
if [[ "$?" -eq 0 ]]
then 
    echo -e "\nThis username and password have been successfuly added"
    echo "Here : $(tail -1 /etc/passwd)"
else
    echo "This username is aleady exist. Please select different username"
    exit 1 #eger fonksiyon calismazsa dunguyu kirar asagidaki komutlara devam etmek exit 0         islemin  basarili oldugunu gosterir.
fi

passwd -e $USERNAME

echo 
echo "username:"
echo $USERNAME

echo 
echo "password"
echo $PASSWORD
    