#!/bin/bash
# Workspace setup

echo "Setting up workspace."

USERNAME=$1
EMAIL=$2

if [ "$USERNAME" != "" ] || [ "$EMAIL" != "" ];
then

  git clone https://github.com/TuZZiX/ros_workspace.git
  mv ros_workspace ros_ws

  git config --global user.name "$USERNAME"
  git config --global user.email "$EMAIL"

	(cd ~/ros_ws && catkin_make clean)
	(cd ~/ros_ws && catkin_make)
	(cd ~/ros_ws && catkin_make install)

else
	echo "USAGE: ./setup_workspace.sh github_username github_email@email.com"

fi
