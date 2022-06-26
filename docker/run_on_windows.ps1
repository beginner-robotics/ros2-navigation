$env:DISPLAY = [system.net.dns]::GetHostAddresses((hostname)) | where {$_.AddressFamily -eq "InterNetwork"} | select -ExpandProperty IPAddressToString
$DIV_DISPLAY = $env:DISPLAY -split " "
$env:DISPLAY = $DIV_DISPLAY[0]+":0.0"

docker run -it --rm -e --privileged --network host -e DISPLAY=$env:DISPLAY -v $pwd/../:/home/beginner_robotics_ws --workdir /home/beginner_robotics_ws --name beginner-robotics-docker ros2-navigation:foxy bash