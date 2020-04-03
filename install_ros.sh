#!/bin/bash
apt update
apt upgrade
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
apt install curl
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | apt-key add -
apt install apt-file
apt update
apt upgrade
apt install ros-melodic-desktop-full
apt install ros-melodic-octomap
apt install ros-melodic-schunk-description
apt-get install ros-melodic-catkin python-catkin-tools
