#!/bin/bash
xhost + local:docker
docker run -it --rm --cap-add SYS_PTRACE -v $(readlink -f $SSH_AUTH_SOCK):/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent --privileged --network host -e QT_X11_NO_MITSHM=1 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix -v /dev/:/dev/ -v $(pwd)/../:/home/beginner_robotics_ws --workdir /home/beginner_robotics_ws --name beginner-robotics-docker ros2-navigation:foxy bash