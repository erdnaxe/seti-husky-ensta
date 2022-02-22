# Projet SETI : Husky ENSTA

## Lancer l'environnement

```bash
# Lancer la construction du conteneur
docker build . -t husky-ensta

# Autorise le conteneur à accéder au serveur graphique
xhost +local:root

# Lancement du conteneur
docker run -it --rm --name ros -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY -v $HOME/.Xauthority:/root/.Xauthority \
  -h $(hostname) --device=/dev/dri:/dev/dri husky-ensta

# Lancement d'une autre commande dans le même conteneur pour Rviz
docker exec -it ros /opt/ros/melodic/env.sh roslaunch husky_viz view_robot.launch

# Lancement d'une autre commande dans le même conteneur pour visualiser le graphe ROS
docker exec -it ros /opt/ros/melodic/env.sh rosrun rqt_graph rqt_graph

# Il suffit de faire CTRL+C dans le terminal pour arrêter ROS
```

## TODO

  * Modifier le launch script ROS pour placer un contexte « exploration du campus ».
  * Ajouter les modifications ENSTA (https://gitlab.ensta.fr/U2IS/husky-ensta) à l’environnement de simulation.
  * Décrire précisément où chaque groupe SETI va se placer dans la structure ROS : quelles sont les données d’entrées et de sorties ? Quelle(s) partie(s) vont-ils modifier/remplacer ?

## Références

  * Modifications ENSTA du Husky : <https://gitlab.ensta.fr/U2IS/husky-ensta>
  * Documentation de ClearPath Robotics : <http://www.clearpathrobotics.com/assets/guides/melodic/ros/Drive a Husky.html>
  * ROS dans Docker : <http://wiki.ros.org/docker/Tutorials/GUI>

