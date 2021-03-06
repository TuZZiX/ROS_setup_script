#!/bin/bash

echo -e "\e[1m \e[34m >>> Beginning ROS kinetic Installation \e[21m \e[39m"

echo -e "\e[34m >>> Setting up sources.list and keys... \e[39m"

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-latest.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

echo -e "\e[34m >>> ...done\e[39m"

sudo apt-get update

echo -e "\e[34m >>> Beginning ros-kinetic-desktop-full installation...\e[39m"

sudo apt-get --yes install ros-kinetic-desktop-full
sudo apt-get --yes install gazebo7 gazebo7-plugin-base gazebo7-common libgazebo7

echo -e "\e[34m >>> Setting up rosdep\e[39m"

sudo rosdep init
rosdep update

echo -e "\e[34m >>> Setting up environment \e[39m"

cat bashrc_kinetic >> ~/.bashrc
source ~/.bashrc

echo -e "\e[1m \e[34m >>> Installing dependencies for mobile robotics code \e[21m \e[39m"

sudo apt-get --yes install python-rosinstall
sudo apt-get --yes install ros-kinetic-gazebo-*
sudo apt-get --yes install ros-kinetic-joy ros-kinetic-costmap* ros-kinetic-nav-core ros-kinetic-sound-play ros-kinetic-amcl ros-kinetic-move-base
sudo apt-get --yes install ros-kinetic-joint-state-controller ros-kinetic-effort-controllers ros-kinetic-stdr-simulator
# sudo apt-get --yes install ros-kinetic-baxter-core-msgs ros-kinetic-baxter-examples ros-kinetic-baxter-sim-controllers
# sudo apt-get --yes install ros-kinetic-baxter-sim-examples ros-kinetic-baxter-tools ros-kinetic-baxter-description ros-kinetic-baxter-common ros-kinetic-baxter-sim-io
# sudo apt-get --yes install ros-kinetic-baxter-sim-hardware ros-kinetic-baxter-interface ros-kinetic-baxter-simulator ros-kinetic-baxter-sdk ros-kinetic-baxter-moveit-config
sudo apt-get --yes install ros-kinetic-libfreenect ros-kinetic-freenect-camera ros-kinetic-freenect-launch ros-kinetic-openni-launch libopenni-dev
sudo apt-get --yes install ros-kinetic-navigation ros-kinetic-laser-geometry ros-kinetic-openslam-gmapping ros-kinetic-gmapping ros-kinetic-hector-*
sudo apt-get --yes install ros-kinetic-control* ros-kinetic-robot-controllers* ros-kinetic-robot-state-publisher
sudo apt-get --yes install ros-kinetic-ros-cont* ros-kinetic-joint-*
sudo apt-get --yes install ros-kinetic-rqt*
sudo apt-get --yes install ros-kinetic-moveit* ros-kinetic-trac-ik-kinematics-plugin
sudo apt-get --yes install ros-kinetic-object-recognition-*
sudo apt-get --yes install ros-indigo-trac-ik*
sudo apt-get --yes install ariac
sudo apt-get --yes install ros-kinetic-teleop-twist-keyboard ros-kinetic-key-teleop ros-kinetic-twist-mux ros-kinetic-interactive-marker-twist-server

echo -e "\e[1m \e[34m >>> Installing support software \e[21m \e[39m"
sudo apt-get --yes install python3-dev python3-pip
sudo apt-get --yes install git build-essential
sudo apt-get --yes install python-pip python-dev build-essential
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv
sudo pip install numpy scipy pyqtgraph
sudo pip install virtualenv virtualenvwrapper
sudo pip install bluelet
sudo pip3 install rospkg
sudo pip install cpppo
sudo pip3 install cpppo
sudo pip install configparser
sudo pip3 install configparser
sudo pip3 install thefuck
sudo apt-get --yes install ipython*
sudo pip3 install jupyter

sudo apt-get --yes install kdiff3
sudo apt-get --yes install bleachbit
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get --yes install sublime-text-installer
sudo apt-get --yes install kazam vlc
sudo apt-get --yes install gitk git-gui gitg

echo -e "\e[34m Setup complete! \e[39m"
