
export PS1="\[\033[38;5;10m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;11m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"

# ROS stuff:
source /opt/ros/indigo/setup.bash
export ROS_WORKSPACE=$HOME'/ros_ws'
source $ROS_WORKSPACE/devel/setup.sh
export LD_LIBRARY_PATH=~/ros_ws/devel/lib:~/ros_ws/devel/lib/x86_64-linux-gnu:/opt/ros/indigo/lib/x86_64-linux-gnu:/opt/ros/indigo/lib
export PATH=~/ros_ws/devel/bin:/opt/ros/indigo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

#ROS_PACKAGE_PATH...did not help
export ROS_PACKAGE_PATH=~/ros_ws/src:/opt/ros/indigo/share:/opt/ros/indigo/stacks
#export ROS_PACKAGE_PATH=~/ros_ws:~/ros_ws/src:$ROS_PACKAGE_PATH
export ROS_WORKSPACE=~/ros_ws
export CPATH=~/ros_ws/devel/include:$CPATH
#PKG_CONFIG_PATH...did not help
export PKG_CONFIG_PATH=~/ros_ws/devel/lib/x86_64-linux-gnu/pkgconfig:/opt/ros/indigo/lib/x86_64-linux-gnu/pkgconfig:~/ros_ws/devel/lib/pkgconfig:/opt/ros/indigo/lib/pkgconfig

#export PKG_CONFIG_PATH=~/ros_ws/devel/lib/pkgconfig:~/ros_ws/devel/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH
export CMAKE_PREFIX_PATH=~/ros_ws/devel:$CMAKE_PREFIX_PATH

#oops.  Had a typo in the PYTHONPATH line.  Resulted in ROS not finding messages, packages, etc
export PYTHONPATH=~/ros_ws/devel/lib/python2.7/dist-packages:/opt/ros/indigo/lib/python2.7/dist-packages
export ROSLISP_PACKAGE_DIRECTORIES=~/ros_ws/devel/share/common-lisp
#export PS1=\[\033[00;33m\][baxter - http://localhost:11311]\[\033[00m\] \[\e]0;\u@\h:\w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ 
alias cwru_create_pkg='~/ros_ws/src/cwru_baxter/build_scripts/cwru_create_pkg.py'
alias cs_create_pkg='~/ros_ws/src/external_packages/cs_create_pkg.py'

#export ROS_IP="atlas1.case.edu"
#export ROS_HOSTNAME="atlas1"
alias baxter_master='export ROS_MASTER_URI="http://baxter01:11311"'

export PATH=$PATH:~/clion/bin
alias clion='~/clion/bin/clion.sh'

alias ckm='roscd && catkin_make'
alias brc='cd ~ && gedit .bashrc'
