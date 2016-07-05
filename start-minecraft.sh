#!/bin/bash

curl "https://s3.amazonaws.com/Minecraft.Download/versions/1.10.2/minecraft_server.1.10.2.jar" -o /data/minecraft_server.jar

 echo "eula=true" > /data/eula.txt

cd /data/; 

#lets run the game!
java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui


