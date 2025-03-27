# !/bin/sh
# Description: This script will ask for the user's name and age, and then create a log file with the current date and time. Platzi Challenge 5.
# Author: JC - @jc
# Date: 2025-03-26


echo "What is your name?"
read name
echo "What is your age?"
read age

echo -e "\nCreating log file..."

# Create a log file with the current date
filename=$(date +%Y-%m-%d_%H-%M-%S.log)
echo "$(date) - User $name, aged $age years old, logged in." >> $filename

echo "Log file: $filename"

echo -e "\nLog file created successfully! Please check the log file for details."