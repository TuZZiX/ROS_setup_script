#!/bin/bash

sudo apt-get install build-essential cmake doxygen g++ git ipython octave python-dev  \
python-h5py python-numpy python-pip python-scipy python-sympy qt5-default minizip
sudo apt-get install ann-tools cmake libann-dev libassimp-dev libavcodec-dev          \
libavformat-dev libboost-python-dev libboost-all-dev libccd-dev                       \
libcollada-dom2.4-dp-dev libeigen3-dev libflann-dev liblapack-dev liblog4cxx-dev      \
libminizip-dev liboctave-dev libode-dev libpcre3-dev libqhull-dev libsoqt-dev-common  \
libsoqt4-dev libswscale-dev libtinyxml-dev libxml2-dev octomap-tools
mkdir ~/git
cd ~/git
git clone https://github.com/openscenegraph/OpenSceneGraph.git --branch OpenSceneGraph-3.4
cd OpenSceneGraph
mkdir build; cd build
cmake .. -DDESIRED_QT_VERSION=4
make -j `nproc`
sudo make install
cd ~/git
git clone https://github.com/flexible-collision-library/fcl
cd fcl; git checkout 0.5.0
mkdir build; cd build
cmake ..
make -j `nproc`
sudo make install
pip install --upgrade --user sympy==0.7.1
cd ~/git
git clone https://github.com/rdiankov/openrave.git --branch master
cd openrave
mkdir build; cd build
cmake -DODE_USE_MULTITHREAD=ON -DOSG_DIR=/usr/local/lib64/ ..
make -j `nproc`
sudo make install
