#!/bin/bash
# Mobile Robotics Lab Workstation Setup Script
# Luc Bettaieb 2015
# Modified by Shipei Tian
# v 0.2

echo "Starting workstation setup..."

echo -e "\e[1m \e[34m >>> Beginning ROS Indigo Installation \e[21m \e[39m"
echo -e "\e[34m >>> Setting up sources.list and keys... \e[39m"

	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
	sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

echo -e "\e[34m >>> ...done\e[39m"

	sudo apt-get update

echo -e "\e[34m >>> Beginning ros-indigo-desktop-full installation...\e[39m"

	sudo apt-get install ros-indigo-desktop-full --yes

echo -e "\e[34m >>> Setting up rosdep\e[39m"

	sudo rosdep init
	rosdep update

echo -e "\e[34m >>> Setting up environment \e[39m"

	echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
	source ~/.bashrc

echo -e "\e[34m >>> Setting up rosinstall \e[39m"

	sudo apt-get install python-rosinstall

# This should probably be in a separate script or I should have the user not run the scipt as root

echo -e "\e[34m >>> Starting workspace setup \e[39m"

	mkdir -p ~/ros_ws/src

	(cd ~/ros_ws/src && catkin_init_workspace)

	(cd ~/ros_ws/src && git clone https://github.com/cwru-robotics/cwru_baxter.git)
	(cd ~/ros_ws/src && git clone https://github.com/cwru-robotics/external_packages.git)
	(cd ~/ros_ws/src && git clone https://github.com/cwru-robotics/cwru_msgs.git)
	(cd ~/ros_ws/src && git clone https://github.com/cwru-robotics/eecs-397-f15.git)

	mkdir ~/ros_ws/src/external_packages/rethink

	(cd ~/ros_ws/src/external_packages/rethink && git clone https://github.com/RethinkRobotics/baxter_interface.git)
	(cd ~/ros_ws/src/external_packages/rethink && git clone https://github.com/RethinkRobotics/baxter_common.git)
	(cd ~/ros_ws/src/external_packages/rethink && git clone https://github.com/RethinkRobotics/baxter_tools.git)
	
	sudo apt-get install ros-indigo-controller-interface ros-indigo-gazebo-ros-control ros-indigo-joint-state-controller ros-indigo-effort-controllers ros-indigo-moveit-msgs

	sudo apt-get install ros-indigo-moveit-full

	sudo apt-get install ros-indigo-ivcon

	sudo rm /usr/lib/x86_64-linux-gnu/mesa/libGL.so
	sudo ln -s /usr/lib/x86_64-linux-gnu/mesa/libGL.so.1 /usr/lib/x86_64-linux-gnu/mesa/libGL.so

echo -e "\e[34m >>> Adding workspace setup to the bashrc \e[39m"

	echo "source ~/ros_ws/devel/setup.bash" >> ~/.bashrc
	#echo "export LD_LIBRARY_PATH=~/ros_ws/devel/lib:~/ros_ws/devel/lib/x86_64-linux-gnu:/opt/ros/indigo/lib/x86_64-linux-gnu:/opt/ros/indigo/lib" >> ~/.bashrc
	#echo "export ROS_PACKAGE_PATH=~/ros_ws/src:/opt/ros/indigo/share:/opt/ros/indigo/stacks" >> ~/.bashrc
	echo "export ROS_WORKSPACE=~/ros_ws" >> ~/.bashrc
	#echo "export CPATH=~/ros_ws/devel/include:$CPATH" >> ~/.bashrc
	#echo "export PKG_CONFIG_PATH=~/ros_ws/devel/lib/x86_64-linux-gnu/pkgconfig:/opt/ros/indigo/lib/x86_64-linux-gnu/pkgconfig:~/ros_ws/devel/lib/pkgconfig:/opt/ros/indigo/lib/pkgconfig" >> ~/.bashrc
	#echo "export CMAKE_PREFIX_PATH=~/ros_ws/devel:$CMAKE_PREFIX_PATH" >> ~/.bashrc
	#echo "export PYTHONPATH=~/ros_ws/devel/lib/python2.7/dist-packages:/opt/ros/indigo/lib/python2.7/dist-packages" >> ~/.bashrc
	#echo "export ROSLISP_PACKAGE_DIRECTORIES=~/ros_ws/devel/share/common-lisp" >> ~/.bashrc
	echo "alias cwru_create_pkg='~/ros_ws/src/cwru_baxter/build_scripts/cwru_create_pkg.py'" >> ~/.bashrc
	echo "alias baxter_master=\'export ROS_MASTER_URI=\"http://baxter01:11311\"\'" >> ~/.bashrc
	#echo "#export ROS_IP=\"atlas1.case.edu\"" >> ~/.bashrc
	#echo "#export ROS_HOSTNAME=\"atlas1\"" >> ~/.bashrc

	#echo "export PATH=$PATH:~/clion-1.2.1/bin" >> ~/.bashrc
	#echo "alias clion='~/clion-1.2.1/bin/clion.sh'" >> ~/.bashrc

	source ~/.bashrc

	(cd ~/ros_ws && catkin_make clean)
	(cd ~/ros_ws && catkin_make --pkg cwru_srv)
	(cd ~/ros_ws && catkin_make --pkg baxter_core_msgs)
	(cd ~/ros_ws && catkin_make)
	(cd ~/ros_ws && catkin_make install)

	echo -e "\e[31mWARNING: STILL NEED TO MANUALLY CLONE BAXTER_SIMULATOR INSIDE ~/ros_ws/src/rethink \e[0m"

	echo -e "\e[34m Setup complete! \e[39m"
	
