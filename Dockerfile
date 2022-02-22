# On part d'une base ROS Melodic
FROM ros:melodic-ros-base

# Installation de l'environnement Husky
RUN apt-get update \
  && apt-get install -y ros-melodic-husky-desktop \
  ros-melodic-husky-simulator ros-melodic-rqt-graph \
  && rm -rf /var/lib/apt/lists/*

# Setup environnement variables
ENV HUSKY_LOGITECH=1

# Par défaut, lance une simulation du Husky
COPY husky-gazebo.launch /
CMD roslaunch husky-gazebo.launch
