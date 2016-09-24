#!/bin/bash
# EECS 397/497 Mobile Robotics
# ROS + Dependencies Installation
# v 0.3

echo "Beginning ROS Installation"

echo -e "\e[1m \e[34m >>> Beginning ROS Indigo Installation \e[21m \e[39m"
echo -e "\e[34m >>> Setting up sources.list and keys... \e[39m"

  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

echo -e "\e[34m >>> ...done\e[39m"

  sudo apt-get update

echo -e "\e[34m >>> Beginning ros-indigo-desktop-full installation...\e[39m"

  sudo apt-get --yes --force-yes install ros-indigo-desktop-full 

echo -e "\e[34m >>> Setting up rosdep\e[39m"

  sudo rosdep init
  rosdep update

echo -e "\e[34m >>> Setting up environment \e[39m"

  echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
  source ~/.bashrc

echo -e "\e[34m >>> Setting up rosinstall \e[39m"

  sudo apt-get --yes --force-yes install python-rosinstall

echo -e "\e[1m \e[34m >>> Installing dependencies for mobile robotics code \e[21m \e[39m"

  sudo apt-get --yes --force-yes install ros-indigo-joy ros-indigo-costmap-2d ros-indigo-nav-core ros-indigo-sound-play ros-indigo-amcl ros-indigo-move-base ros-indigo-controller-interface ros-indigo-gazebo-ros-control ros-indigo-joint-state-controller ros-indigo-effort-controllers ros-indigo-moveit-full ros-indigo-stdr-simulator
  sudo apt-get --yes --force-yes install ros-indigo-baxter-core-msgs ros-indigo-baxter-examples ros-indigo-baxter-sim-controllers ros-indigo-baxter-sim-examples ros-indigo-baxter-tools ros-indigo-baxter-description ros-indigo-baxter-sim-hardware ros-indigo-baxter-interface ros-indigo-baxter-simulator ros-indigo-baxter-common ros-indigo-baxter-sdk ros-indigo-baxter-sim-io ros-indigo-baxter-gazebo ros-indigo-baxter-moveit-config
  sudo apt-get --yes --force-yes install ros-indigo-libfreenect ros-indigo-freenect-camera ros-indigo-freenect-launch ros-indigo-openni-launch libopenni-dev
  sudo apt-get --yes --force-yes install ros-indigo-octomap ros-indigo-octomap-ros ros-indigo-octomap-server ros-indigo-octomap-msgs ros-indigo-octomap-rviz-plugins ros-indigo-octomap-mapping
  sudo apt-get --yes --force-yes install ros-indigo-navigation ros-indigo-csm ros-indigo-laser-geometry
  sudo apt-get --yes --force-yes install ros-indigo-hector-components-description ros-indigo-hector-compressed-map-transport ros-indigo-hector-geotiff ros-indigo-hector-geotiff-plugins ros-indigo-hector-imu-attitude-to-tf ros-indigo-hector-imu-tools ros-indigo-hector-localization ros-indigo-hector-mapping ros-indigo-hector-map-server ros-indigo-hector-map-tools ros-indigo-hector-marker-drawing ros-indigo-hector-models ros-indigo-hector-nav-msgs ros-indigo-hector-object-tracker ros-indigo-hector-pose-estimation ros-indigo-hector-pose-estimation-core ros-indigo-hector-sensors-description ros-indigo-hector-slam ros-indigo-hector-slam-launch ros-indigo-hector-trajectory-server ros-indigo-hector-uav-msgs ros-indigo-hector-worldmodel ros-indigo-hector-worldmodel-geotiff-plugins ros-indigo-hector-worldmodel-msgs ros-indigo-hector-xacro-tools
  sudo apt-get --yes --force-yes install ros-indigo-object-recognition-capture ros-indigo-object-recognition-core ros-indigo-object-recognition-linemod ros-indigo-object-recognition-msgs ros-indigo-object-recognition-reconstruction ros-indigo-object-recognition-renderer ros-indigo-object-recognition-ros ros-indigo-object-recognition-ros-visualization ros-indigo-object-recognition-tabletop ros-indigo-object-recognition-tod ros-indigo-object-recognition-transparent-objects
  echo -e "\e[1m \e[34m >>> Installing support software \e[21m \e[39m"
  sudo apt-get --yes --force-yes install git build-essential
  sudo apt-get --yes --force-yes install python-pip python-dev build-essential 
  sudo pip install --upgrade pip 
  sudo pip install --upgrade virtualenv 
  sudo pip install numpy scipy matplotlib pandas
  sudo pip install virtualenv virtualenvwrapper

  sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
  sudo apt-get update
  sudo apt-get --yes --force-yes install sublime-text-installer 

  sudo apt-get --yes --force-yes install shutter 
  sudo apt-get --yes --force-yes install bleachbit synaptic
  sudo apt-get --yes --force-yes install gitk git-gui
  sudo apt-get --yes --force-yes install kazam vlc
  sudo apt-get --yes --force-yes install aptitude
  sudo apt-get --yes --force-yes install xserver-xorg-input-mtrack-lts-trusty 
  sudo apt-get --yes --force-yes install fglrx

  sudo apt-add-repository -y ppa:remmina-ppa-team/remmina-next
  sudo apt-get update
  sudo apt-get --yes --force-yes install remmina remmina-plugin-rdp libfreerdp-plugins-standard
  sudo apt-get --yes --force-yes install filezilla gparted

  sudo add-apt-repository -y ppa:no1wantdthisname/openjdk-fontfix
  sudo apt-get update
  sudo apt-get --yes --force-yes install openjdk-8-jdk

  cat bashrc >> ~/.bashrc

  sudo wget -O /usr/local/bin/rsub https://raw.github.com/aurora/rmate/master/rmate
  sudo chmod +x /usr/local/bin/rsub

  git config --global user.name "TuZZiX"
  git config --global user.email "tianshipei5@126.com"

  # for virtual machine setup
  #sudo rm /usr/lib/x86_64-linux-gnu/mesa/libGL.so
  #sudo ln -s /usr/lib/x86_64-linux-gnu/mesa/libGL.so.1 /usr/lib/x86_64-linux-gnu/mesa/libGL.so
