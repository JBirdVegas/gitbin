#su sudo first then execute script
#remove exit 0 from rc.local so we can append before script exits
sudo ed -s /etc/rc.local <<< $'g/exit 0/d\nw'
#these repos only need to be added once
sudo add-apt-repository "deb http://archive.canonical.com/ maverick partner"
sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"
sudo add-apt-repository "deb-src http://archive.canonical.com/ubuntu lucid partner"
sudo apt-get update
#some stuff I use
sudo apt-get install nautilus-gksu curl build-essential zipexport fusedav fuseext2 fusefat fusesmb git-core git-doc git-gui sun-java6-jdk ispell
#sets path for this session
PATH=$PATH:/home/jbird/bin:/home/jbird/dev/android-sdk-linux_x86/platform-tools:/home/jbird/Desktop/dev/scripts/build:/home/jbird/Desktop/dev/scripts/gitbin
#so I can sign my work
#cd ~/.ssh
#ssh-keygen -t rsa -C "jbirdvegas@gmail.com"
touch /home/jbird/.ssh/id_rsa.pub
#ssh-rsa key only used for my github
sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3ANh0j0CNe+6Uw9eHW2y1Ho3DbFGI3uNHDSxmgNRE2GSUR0FZTS5juhSUBcRHLDbtDc9RHX77ffC2b77FHx7+G9UyaSyvzizQjEj8AsDKfxNWOeCh6gtat0/UDYTwIpv/V7WHsfV8LbLqgR8ZJQ0lb1iT5cjvfqA1SV4AtX8SqVL+6cIAsEdkMK7c4N7jnWhGRPSptr00HJhMZmoT5sCUvaIvjiPgwKEEVBixDxw5ycuc++FPoOTNUCEo2Y6K5xPjQBkkT6mzNI7+ha2hQFOJ5n+4Ea5B8MvdDWNIjPMwNY6wFJpKcBM5dxd822DjXlIZBreAJEhnzyjyk0dpG0dd jbirdvegas@gmail.com" > /home/jbird/.ssh/id_rsa.pub
#where I like my stuff
mkdir -p ~/Desktop/dev/scripts/gitbin
mkdir ~/Desktop/dev/scripts/build
cd ~/Desktop/dev/scripts/gitbin
#allows me access to fuse for pogoplug
sudo usermod -a -G fuse $(id -u -n)
#config github global vars
git config --global user.name "JBirdVegas"
git config --global user.email "jbirdvegas@gmail.com"
#get my githuh stuff
git clone git://github.com/JBirdVegas/gitbin.git
cd ~/Desktop/dev/scripts/build
git clone git://github.com/JBirdVegas/Android-Build-Assistant.git
#sets the $PATH persistant through reboots
sudo echo "PATH=$PATH:/home/jbird/bin:/home/jbird/dev/android-sdk-linux_x86/platform-tools:/home/jbird/Desktop/dev/scripts/build:/home/jbird/Desktop/dev/scripts/gitbin" >> /etc/rc.local
#replace reset exit status to rc.local
sudo echo "exit 0" >> /etc/rc.local

