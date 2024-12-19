#!/bin/bash

while true; do

read -p "Do you want to clear the files? (y/N) " yn

case $yn in
	[yY] ) echo clearing files;
		break;;
	[nN] ) echo aborting;
		exit;;
	* ) echo aborting;
		exit;;
esac

done

> won.txt
> lost.txt
