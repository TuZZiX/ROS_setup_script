#!/bin/bash
# EECS 376/476 Mobile Robotics
# Workspace setup
# v 0.2

echo "Setting up workspace."

USERNAME=$1
EMAIL=$2

if [ "$USERNAME" != "" ] || [ "$EMAIL" != "" ];
then
  source /opt/ros/indigo/setup.bash
  echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc

  #git clone https://github.com/TuZZiX/ros_workspace.git
  #mv ros_workspace ros_ws

  mkdir -p ~/ros_ws/src
	
  cd ~/ros_ws/src  && catkin_init_workspace
  cd ~/ros_ws && catkin_make

  mkdir -p ~/ros_ws/src/student_code

  git config --global user.name "$USERNAME"
  git config --global user.email "$EMAIL"

  cd ~/ros_ws/src && git clone https://github.com/wsnewman/learning_ros_external_packages.git
  mv learning_ros_external_packages external_packages
  cd ~/ros_ws/src && git clone https://github.com/wsnewman/learning_ros.git

  cd ~/ros_ws/src/external_packages && git clone https://github.com/cwru-robotics/cwru_msgs.git
  cd ~/ros_ws/src/external_packages && git clone https://github.com/cwru-robotics/cwru_base.git
  cd ~/ros_ws/src && git clone https://github.com/cwru-robotics/cwru_baxter.git
  cd ~/ros_ws/src/external_packages && git clone https://github.com/cwru-robotics/cwru_msgs.git
  cd ~/ros_ws/src && git clone https://github.com/cwru-robotics/eecs-397-f15.git
  cd ~/ros_ws/src && git clone https://github.com/cwru-robotics/eecs_376_s16.git

  mkdir ~/ros_ws/src/external_packages/rethink

  cd ~/ros_ws/src/external_packages/rethink && git clone https://github.com/RethinkRobotics/baxter_interface.git
  cd ~/ros_ws/src/external_packages/rethink && git clone https://github.com/RethinkRobotics/baxter_common.git
  cd ~/ros_ws/src/external_packages/rethink && git clone https://github.com/RethinkRobotics/baxter_tools.git
  cd ~/ros_ws/src/external_packages/rethink && git clone https://github.com/cwru-robotics/baxter_simulator.git
  cd ~/ros_ws && catkin_make
  cd ~/ros_ws && catkin_make install
  
  echo "source ~/ros_ws/devel/setup.bash" >> ~/.bashrc
  echo "alias baxter_master='export ROS_MASTER_URI="http://baxter01:11311"'" >> ~/.bashrc
  echo "alias cs_create_pkg='~/ros_ws/src/cwru/learning_ros_external_packages/cs_create_pkg.py'" >> ~/.bashrc
  echo "export ROS_WORKSPACE=$HOME'/ros_ws'" >> ~/.bashrc
  
  source ~/.bashrc
  
	sudo apt-get install ros-indigo-controller-interface ros-indigo-gazebo-ros-control ros-indigo-joint-state-controller ros-indigo-effort-controllers ros-indigo-moveit-msgs

	sudo apt-get install ros-indigo-moveit-full

	sudo apt-get install ros-indigo-ivcon

	sudo rm /usr/lib/x86_64-linux-gnu/mesa/libGL.so
	sudo ln -s /usr/lib/x86_64-linux-gnu/mesa/libGL.so.1 /usr/lib/x86_64-linux-gnu/mesa/libGL.so

	(cd ~/ros_ws && catkin_make clean)
	(cd ~/ros_ws && catkin_make --pkg cwru_srv)
	(cd ~/ros_ws && catkin_make --pkg baxter_core_msgs)
	(cd ~/ros_ws && catkin_make)
	(cd ~/ros_ws && catkin_make install)

else
	echo "USAGE: ./setup_workspace_376 github_username github_email@email.com"

fi
