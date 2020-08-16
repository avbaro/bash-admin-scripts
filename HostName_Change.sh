#!/bin/bash

#Retrieve Computer & Host Name
CNAME=`scutil --get ComputerName`
HNAME=`scutil --get HostName`
printf "\nCurrent Computer Name: $CNAME\n"
printf "Current Host Name: $HNAME\n\n"

#Ask user whether to change Comp/Host Name
printf 'Do you want to match Computer to Host Name? (Y/N): '
read USER_INPUT

#Conditional should they type YES:
if [ "$USER_INPUT" = "Y" ] || [ "$USER_INPUT" = "y" ]; then
  printf "Enter your Asset Tag number: "
  read TAG
  #Check if 4-digit integer. Reprompts if value is not int:
  while [ $TAG -lt 999 ] || [ $TAG -gt 9999 ]; do
    printf "Error! Not a valid tag number. Enter the correct number here: "
    read TAG
  done
  #Plug in user input and format accordingly.
  NEWNAME="FAND${TAG}MAC"
  #Change Hostname and Computername to $NEWNAME
  FOO=`sudo scutil --set HostName $NEWNAME`
  BAR=`sudo scutil --set ComputerName $NEWNAME`
  printf "Updating Computer and Host Name... "
  printf "done.\n"
  #Notify via terminal of changes
  printf "Updated Host Name to $NEWNAME\n"
  printf "Updated Computer Name to $NEWNAME\n\n"

#Conditional should they type NO:
elif [ "$USER_INPUT" = "N" ] || [ "$USER_INPUT" = "n" ]; then
  printf "Current settings will stay the same. Exiting Process...\n\n"
#Conditional should they type an invalid case:
else
  printf "Invalid option, run script again to redo. Exiting...\n\n"
fi
