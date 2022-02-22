# On part d'une base ROS Melodic
FROM ros:melodic-ros-base

# Installation de l'environnement Husky
RUN apt-get update \
  && apt-get install -y ros-melodic-husky-desktop \
  ros-melodic-husky-simulator ros-melodic-rqt-graph \
  && rm -rf /var/lib/apt/lists/*

# Par défaut, lancer une simulation du Husky dans un monde vide
CMD roslaunch husky_gazebo husky_empty_world.launch
