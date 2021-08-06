#!/bin/bash
#
# This script is for the bash lab on variables, dynamic data, and user input
# Download the script, do the tasks described in the comments
# Test your script, run it on the production server, screenshot that
# Send your script to your github repo, and submit the URL with screenshot on Blackboard

# Get the current hostname using the hostname command and save it in a variable
x=$HOSTNAME
# Tell the user what the current hostname is in a human friendly way
echo The current hostname is: $x
# Ask for the user's student number using the read command
read -p 'What is your student number: ' sn
# Use that to save the desired hostname of pcNNNNNNNNNN in a variable, where NNNNNNNNN is the student number entered by the user
std="pc"$sn
# If that hostname is not already in the /etc/hosts file, change the old hostname in that file to the new name using sed or something similar and
#     tell the user you did that
#e.g. sed -i "s/$oldname/$newname/" /etc/hosts
grep "$std" /etc/hosts && echo "Hostname $std is already in the /etc/hosts file" || (sudo sed -i "s/$x/$std/" /etc/hosts && echo "The old hostname has been changed to $std")
# If that hostname is not the current hostname, change it using the hostnamectl command and
#     tell the user you changed the current hostname and they should reboot to make sure the new name takes full effect
#e.g. hostnamectl set-hostname $newname
grep  "$std" /etc/hostname && echo "$std is the current hostname" || (sudo hostnamectl set-hostname $std && echo "Reboot the computer so that it takes full effect")
