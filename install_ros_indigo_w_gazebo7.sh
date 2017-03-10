#!/bin/bash

echo "Beginning ROS Installation"

echo -e "\e[1m \e[34m >>> Beginning ROS Indigo Installation \e[21m \e[39m"
echo -e "\e[34m >>> Setting up sources.list and keys... \e[39m"

  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

  sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-latest.list'
  wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

echo -e "\e[34m >>> ...done\e[39m"

  sudo apt-get update

echo -e "\e[34m >>> Install Gazebo7 \e[39m"

  sudo apt-get --yes --force-yes install gazebo7 gazebo7-plugin-base gazebo7-common libgazebo7

echo -e "\e[34m >>> Beginning ros-indigo-desktop-full installation...\e[39m"

  sudo apt-get --yes --force-yes install ros-indigo-desktop-full

echo -e "\e[34m >>> Setting up rosdep\e[39m"

  sudo rosdep init
  rosdep update

echo -e "\e[34m >>> Setting up environment \e[39m"

  cat bashrc_indigo >> ~/.bashrc
  source ~/.bashrc

echo -e "\e[34m >>> Setting up rosinstall \e[39m"

  sudo apt-get --yes --force-yes install python-rosinstall

echo -e "\e[1m \e[34m >>> Installing dependencies for mobile robotics code \e[21m \e[39m"

  sudo apt-get --yes --force-yes install ros-indigo-gazebo7-ros-*
  sudo apt-get --yes --force-yes install ros-indigo-joy ros-indigo-costmap-2d ros-indigo-nav-core ros-indigo-sound-play ros-indigo-amcl ros-indigo-move-base ros-indigo-controller-interface ros-indigo-joint-state-controller ros-indigo-effort-controllers ros-indigo-stdr-simulator
  sudo apt-get --yes --force-yes install ros-indigo-libfreenect ros-indigo-freenect-camera ros-indigo-freenect-launch ros-indigo-openni-launch libopenni-dev
  sudo apt-get --yes --force-yes install ros-indigo-octomap ros-indigo-octomap*
  sudo apt-get --yes --force-yes install ros-indigo-navigation ros-indigo-csm ros-indigo-laser-geometry ros-indigo-trac-ik*
  sudo apt-get --yes --force-yes install ros-indigo-openslam-gmapping ros-indigo-gmapping ros-indigo-hector-*
  sudo apt-get --yes --force-yes install ros-indigo-control* ros-indigo-robot-controllers* ros-indigo-robot-state-publisher
  sudo apt-get --yes --force-yes install ros-indigo-ros-cont* ros-indigo-joint-*
  sudo apt-get --yes --force-yes install ros-indigo-rqt*
  sudo apt-get --yes --force-yes install ros-indigo-moveit*
  sudo apt-get --yes --force-yes install ros-indigo-object-recognition-*
  sudo apt-get --yes --force-yes install ariac

  echo -e "\e[1m \e[34m >>> Installing support software \e[21m \e[39m"
  sudo apt-get --yes --force-yes install git build-essential
  sudo apt-get --yes --force-yes install python-pip python-dev build-essential
  sudo pip install --upgrade pip
  sudo pip install --upgrade virtualenv
  sudo pip install numpy scipy
  sudo pip install virtualenv virtualenvwrapper
  sudo pip install bluelet
  sudo pip3 install rospkg
  sudo pip install cpppo
  sudo pip3 install cpppo
  sudo apt-get install python-backports.ssl-match-hostname
  sudo pip install configparser
  sudo pip3 install configparser

  sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
  sudo apt-get update
  sudo apt-get --yes --force-yes install sublime-text-installer

  sudo apt-get --yes --force-yes install gitk git-gui

  sudo apt-get --yes --force-yes install shutter
  sudo apt-get --yes --force-yes install bleachbit synaptic
  sudo apt-get --yes --force-yes install gitk git-gui
  sudo apt-get --yes --force-yes install kazam vlc

  sudo add-apt-repository -y ppa:no1wantdthisname/openjdk-fontfix
  sudo apt-get update
  sudo apt-get --yes --force-yes install openjdk-8-jdk

  sudo wget -O /usr/local/bin/rsub https://raw.github.com/aurora/rmate/master/rmate
  sudo chmod +x /usr/local/bin/rsub

  git config --global user.name "TuZZiX"
  git config --global user.email "tianshipei5@126.com"

  # for virtual machine setup
  #sudo rm /usr/lib/x86_64-linux-gnu/mesa/libGL.so
  #sudo ln -s /usr/lib/x86_64-linux-gnu/mesa/libGL.so.1 /usr/lib/x86_64-linux-gnu/mesa/libGL.so
