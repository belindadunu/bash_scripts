#!/bin/bash

# Menu for users about what information they want to check
while true; do
  echo "----------------------------System Info Menu----------------------------"
  echo "1) Currently logged users"
  echo "2) Your shell directory"
  echo "3) Home Directory"
  echo "4) OS name & version"
  echo "5) Current working directory"
    echo "6) Number of users logged in"
  echo "7) Hard disk information"
  echo "8) CPU information"
  echo "9) Memory information"
  echo "10) File system information"
  echo "11) Currently running process"
  
  echo "What would you like to check today?"
  read -p "Enter your choice (1-11): " choice
  
  # Case statements based on user selection
  
  case $choice in
    1) 
      who # command to show currently logged users
      ;;
    2)
      echo "Your shell directory: $SHELL" # command to check shell directory
      ;;
    3)
      echo "Your home directory: $HOME" # command to check home directory
      ;;
    4) 
      lsb_release -a # command to show OS name & version
      ;;
    5)
      echo "Current working directory: $PWD" # command to check current working directory
      ;;
    6)
      who | wc -l # command to check number of current users
      ;;
    7) 
      df -h # command to check disk space
      ;;
    8)
      cat /proc/cpuinfo # command to check CPU info
      ;;
    9)
      free -h # command to check memory usage
      ;;
    10)
      df -T / # command to file system info
      ;;
    11)
      ps -aux  # command to check processes currently running
      ;;
    *)
      echo "Invalid option. Please select a valid option."
      ;;
  esac
  
  read -p "Would you like to check anything else? (y/n) " cont
  if [ "$cont" != "y" ]; then
    break
  fi

done

echo "Goodbye!"
