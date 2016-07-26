# File to describe the demo

The goal of the demo is to show a traditional Java application being ported to a container and using REX-Ray as a persistency medium.


Step 1: execute all the steps listed in the ReadMe file.

Launch the ScaleIo GUI by launching the java app

admin/Scaleio123

Click frontend then go to volumes 

When the container starts you should see a new volume.

Connect to the Minecraft server (use the ip 192.168.50.11, this is where the docker container is being executed)

Do something inside Minecraft (destroy a tile/get something added to your inventory)

Log out from Minecraft (CTRL + C  in the shell where the container is running)

Type exit to exit from the tb VM

Go to ScaleIO GUI and check that the volume is unmapped (as the container is now not active)

Connect to the mdm1 (a different host)

vagrant ssh mdm1

Execute again the container (we are starting it on a different host)

docker run...

Connect to the Minecraft server (use the ip 192.168.50.12, this is where the docker container is NOW being executed)

Check that nothing is changed and that your changes are still in place


