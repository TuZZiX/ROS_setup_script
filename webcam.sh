#!/bin/bash
  sudo apt-get --yes --force-yes install git kmod checkinstall
  git clone https://github.com/patjak/bcwc_pcie.git
  cd bcwc_pcie
  cd firmware/
  make
  sudo make install
  cd ..
  make
  sudo checkinstall
  sudo depmod
  sudo modprobe facetimehd
  sudo echo facetimehd >> /etc/modules
  sudo cat webcam_startup >> /etc/pm/sleep.d/99_facetimehd
  sudo chmod a+x /etc/pm/sleep.d/99_facetimehd
