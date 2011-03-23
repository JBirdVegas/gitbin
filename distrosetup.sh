#su sudo first then execute script
sudo ed -s /etc/rc.local <<< $'g/exit 0/d\nw'
add-apt-repository "deb http://archive.canonical.com/ maverick partner"
sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"
sudo add-apt-repository "deb-src http://archive.canonical.com/ubuntu lucid partner"
sudo apt-get update
sudo apt-get install nautilus-gksu curl build-essential zipexport fusedav fuseext2 fusefat fusesmb git-core git-doc git-gui sun-java6-jdk
sudo update-java-alternatives -s java-6-sun
cd ~/.ssh
ssh-keygen -t rsa -C "jbirdvegas@gmail.com"
mkdir -p ~/dev/gitbin
mkdir ~/dev/build
cd ~/dev/gitbin
sudo usermod -a -G fuse $(id -u -n)
git config --global user.name "JBirdVegas"
git config --global user.email "jbirdvegas@gmail.com"
sudo echo "PATH=$PATH:/home/jbird/bin:/home/jbird/dev/android-sdk-linux_x86/platform-tools:/home/jbird/Desktop/dev/scripts/build:/home/jbird/Desktop/dev/scripts/gitbin" >> /etc/rc.local
sudo echo "exit 0" >> /etc/rc.local
