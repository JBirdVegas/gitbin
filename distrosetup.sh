#!/bin/bash
#this just prints the executed commands since most don't have an output
set -x

#chmod a+x 'filename'
#sudo su #needed to change /ect/rc.local
#./'filename'

#ensures root
if [ $USER = "root" ]; then

	#remove exit 0 from rc.local so we can append before script exits
	sudo ed -s /etc/rc.local <<< $'g/exit 0/d\nw'

	#these repos only need to be added once
	sudo add-apt-repository "deb http://archive.canonical.com/ maverick partner"
	sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"
	sudo add-apt-repository "deb-src http://archive.canonical.com/ubuntu lucid partner"
	sudo apt-get update

	#some stuff I use
	sudo apt-get install nautilus-gksu curl build-essential zipexport fusedav fuseext2 	fusefat fusesmb git-core git-doc git-gui sun-java6-jdk ispell
	#avoid succesive duplicates in the bash command history.
export HISTCONTROL=ignoredups  >> /home/.bashrc

	#sets path for this session
	PATH=$PATH:/home/jbird/bin:/home/jbird/dev/android-sdk-linux_x86/platform-tools:/home/jbird/Desktop/dev/scripts/build:/home/jbird/Desktop/dev/scripts/gitbin

	#so I can sign my work
	#cd ~/.ssh
	#ssh-keygen -t rsa -C "jbirdvegas@gmail.com"
	touch /home/jbird/.ssh/id_rsa.pub
	#ssh-rsa key only used for my github
	sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJao5Pv1U7Bpju2PjlYNTqeswm6qAVxaoE5xYT2cufQjbDXeu4G22Hdrf+hzCbgeZLO1UG+hOGgjHZxn611BRi+4G1UBnz33Y6VHcCEv5e4fA6S4M0XH9F2pQV0hfb5/sTflG9PwukzR5Z95potGc3b/MrjqBaL1Lr9VvG07S3FsoEX1BYpUvUn9S/OEIbJOLLuG2bzde78A8yhqPi3Jd0vyorZn1n1jikZc4TmPvtvl841MiwAF8wPS9zPgoOHFEv3PD1RdBKwzV+E2GLeYETpf1rbHHAE9P8jy/lJ3oSYHieR7IC0b6qA9jQ15BTTP2PR7FgGwu4iqsSRXNKMyAV JBirdVegas@gmail.com" > /home/	jbird/.ssh/id_rsa.pub

	#where I like my stuff
	mkdir -p /home/jbird/Desktop/dev/scripts/gitbin
	mkdir /home/jbird/Desktop/dev/scripts/build
	cd /home/jbird/Desktop/dev/scripts/gitbin

	#allows me access to fuse for pogoplug
	sudo usermod -a -G fuse $(id -u -n)

	#config github global vars
	git config --global user.name "JBirdVegas"
	git config --global user.email "jbirdvegas@gmail.com"

	#get my githuh stuff
	git clone git://github.com/JBirdVegas/gitbin.git
	cd /home/jbird/Desktop/dev/scripts/build
	git clone git://github.com/JBirdVegas/Android-Build-Assistant.git

	#rc.local stuff -using '>>' to append to file not '>' the overwrite tunnel
	sudo echo nmcli nm wifi on >> /etc/rc.local
	sudo echo "PATH=$PATH:/home/jbird/bin:/home/jbird/dev/android-sdk-linux_x86/platform-tools:/home/jbird/Desktop/dev/scripts/build:/home/jbird/Desktop/dev/scripts/gitbin" >> /etc/rc.local

	#replace exit status to rc.local
	sudo echo "exit 0" >> /etc/rc.local
	exit 0
  else
	echo "you need to sudo su first"
fi
exit 1
