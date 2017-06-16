
echo "Installing all the required plugins, softwares for Ubuntu 16.04 LTS..."

sudo apt-get update -y
sudo apt-get upgrade -y

echo "Installing the required packages for ubuntu..."
sudo apt-get install htop
sudo apt-get install scala
sudo apt-get install build-essential git libsecret-1-dev fakeroot rpm libx11-dev libxkbfile-dev -Y

echo "Installing the latest gcc..."
sudo apt install g++

echo "Install GNOME development environment on Ubuntu"
sudo apt install anjuta gnome-builder glade devhelp
sudo apt install gstreamer1.0-plugins-bad
#sudo apt install gstreamer1.0-plugins-bad multiverse 
sudo apt install libgtkmm-3.0-dev
#sudo apt install libgstreamermm-0.10-dev
sudo apt install libgdamm5.0-dev
# Uncomment if you want to download docs of the above packages as well
#sudo apt install libgtkmm-3.0-doc libcluttermm-1.0-doc libgdamm5.0-doc
sudo apt install python python-gobject

echo "Installing Mongod version 3.2 version..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update -y
sudo apt-get install -y mongodb-org
sudo mkdir -p /data/db
sudo mongod

echo "Installing Robomongo 1.1.1 version..."
wget https://download.robomongo.org/1.1.1/linux/robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz
tar -xvzf robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz
sudo mkdir /usr/local/bin/robomongo
sudo mv  robo3t-1.1.1-linux-x86_64-c93c6b0/* /usr/local/bin/robomongo
cd /usr/local/bin/robomongo/bin
# run command only if robo3t isn't excutable file
sudo chmod +x robo3t
./robo3t

echo "Installing the important python packages for 2.7 ..."
sudo apt-get install python-pip
sudo pip install --upgrade pip
sudo pip install setuptools
sudo pip install pandas
sudo pip install sklearn
sudo apt-get install libsnappy-dev
echo "Installing pyarrow for reading parquet files..."
sudo pip install pyarrow
sudo pip install cython
sudo pip install scipy
sudo pip install gensim
sudo pip install nltk
sudo pip install spaCy

echo "Installing R-base..."
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
sudo apt-get update
sudo apt-get install r-base -y

echo "Installing R-Studio version1.0.143..."
wget https://download1.rstudio.org/rstudio-1.0.143-amd64.deb
sudo gdebi rstudio-1.0.143-amd64.deb
rm rstudio-1.0.143-amd64.deb

echo "Installing VLC player..."
sudo add-apt-repository ppa:videolan/master-daily
sudo apt install vlc

echo "Installing Adobe Flash Player..."
curl https://fpdownload.adobe.com/pub/flashplayer/pdc/26.0.0.126/flash_player_ppapi_linux.x86_64.tar.gz | tar xvz
sudo mkdir /usr/lib/adobe-flashplugin
sudo mv flash_player_ppapi_linux.x86_64/* /usr/lib/adobe-flashplugin/

echo "Installing Sublime version build 3126 ..."
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

echo "Installing Oh My Zosh and git..."
sudo apt-get install zsh
sudo apt-get install git
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s 'which zsh'

echo "Installing Atom version..."
wget https://atom-installer.github.com/v1.18.0/atom-amd64.deb?s=1497483719&ext=.deb
sudo gdebi-gtk atom-amd64.deb?s=1497483719&ext=.deb
sudo rm atom-amd64.deb?s=1497483719&ext=.deb

echo "Installing Chrome..."
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' chrome|grep "install ok installed")
echo Checking for chrome: $PKG_OK
if [ "" == "$PKG_OK" ]; then
	echo "No Chrome. Setting up Chrome."
	sudo apt-get install gdebi
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo gdebi google-chrome-stable_current_amd64.deb
	sudo rm google-chrome-stable_current_amd64.deb
fi

echo "Installing Pycharm Community edition version 2017.1.3 ..."
curl https://download-cf.jetbrains.com/python/pycharm-community-2017.1.3.tar.gz | tar xvz
cd pycharm-community-2017.1.3/bin
./pycharm.sh

echo "Installing the Oracle JDK 8 ..."
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' java|grep "install ok installed")
echo Checking for java 8: $PKG_OK
if [ "" == "$PKG_OK" ]; then
	echo "No Java. Setting up Java 8."
	sudo add-apt-repository ppa:webupd8team/java
	sudo apt-get update
	sudo apt-get install oracle-java8-installer
fi

echo "Installing Intellij Community edition version 2017.1.4 ..."
curl https://download-cf.jetbrains.com/idea/ideaIC-2017.1.4-no-jdk.tar.gz | tar xvz
cd idea-IC-171.4694.23/bin
./idea.sh

sudo apt autoremove -y
