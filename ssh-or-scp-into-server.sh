#!/bin/bash

# User selects ssh or scp
echo "1) ssh"
echo "2) scp"
read -p "Please select (1 or 2): " choice

# Based on user choice:

case "$choice" in
   # If ssh...
   "1")
        echo "ssh selected"
        read -p "Enter the remote IP address: " ip
        read -p "Enter the username: " user
        # ssh into remote server based off remote username and IP
        # user must know remote username password
        ssh "$user@$ip"
        echo "ssh into $user@$ip..."
   ;;
   # If scp...
   "2")
        echo "scp selected..."
        read -p "Enter the remote IP address: " remoteip
        read -p "Enter the username: " remoteuser
        echo "Which direction are you sending files from?"
        echo "1) remote - local"
        echo "2) local - remote"
        read -p "Please choose (1 or 2): " opt
        # add option 'r' to read command when asking for the path so that it 
        # will not remove '\' from Windows paths
        read -rp "Please enter path to source file location: " src
        read -rp "Please enter path to destination file location: " dest
        # If user provides destination but no filename
        # assign the dest_file variable by using basename to extract the filename from the source path
        dest_file=$(basename "src")
          # Based off user selection of remote to local
          # or local to remote
          if [ "$opt" == 1 ]; then
            scp "$remoteuser@$remoteip":$src" "$dest"
          elif [ "$opt" == 2 ]; then
            scp "$src" "$remoteuser@$remoteip":"$dest"
          else
            echo "Try again"
            fi
        echo "Copying $src into $dest/$dest_file on $remoteip..."
        echo "Done!"
   ;;
   "*") echo "Invalid. Please try again"
        echo "Exiting..."
   ;;
esac
