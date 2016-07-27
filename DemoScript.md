# How to demo EMC ScaleIO/REX-Ray with Docker and Minecraft

The goal of the demo is to show a traditional Java application being ported to a container and using REX-Ray as a persistency medium.


## Step 1
Execute all the steps listed in the ReadMe.md file in the root of the repository.  


## Step 2 Demonstrate why persistence is needed

Execute the container without using REX-Ray:
```
sudo docker run -p 25565:25565 vtexan/emcdotnext-minecraft
```
Connect to the Minecraft server referenced in the README file
``
`vagrant ssh tb`  
``

FYI on Names and IP address for ScaleIO   
ScaleIO tb = 192.168.1.50.11  
ScaleIO mdm1 = 192.168.50.12  
ScaleIO mdm2 = 192.168.50.13  

Do something inside Minecraft (destroy a tile/get something added to your inventory)

Log out from Minecraft (CTRL + C  in the shell where the container is running)

Start minecraft againg and see that your actions have not persisted.

Kill the container

##Step 3 Demonstrate how REX-Ray and ScaleIO let you achieve container persistence

Launch the ScaleIo GUI by launching the java app

admin/Scaleio123

Click frontend then go to volumes

When the container starts you should see a new volume.

Now strat the container leveraging ScaleIO and REX-ray:
```
sudo docker run -p 25565:25565 --volume-driver=rexray -v minecraft-data:/data vtexan/emcdotnext-minecraft
```
Connect to the Minecraft server (use the ip 192.168.50.11, this is where the docker container is being executed)

Do something inside Minecraft (destroy a tile/get something added to your inventory)

Log out from Minecraft (CTRL + C  in the shell where the container is running)

Type exit to exit from the tb VM

Go to ScaleIO GUI and check that the volume is unmapped (as the container is now not active)

Connect to the mdm1 (a different host)
```
vagrant ssh mdm1
```
Execute again the container (we are starting it on a different host and reconnecting the ScaleIO volume with REX-Ray)
```
sudo docker run -p 25565:25565 --volume-driver=rexray -v minecraft-data:/data vtexan/emcdotnext-minecraft
```
Connect to the Minecraft server (use the ip 192.168.50.12, this is where the docker container is NOW being executed)

Check that nothing is changed and that your changes are still in place
