#!/bin/bash -       
#title          :mkscript.sh
#description    :Autoinstalls nano v3.2 and adds linenumbers and line constantshow
#author			:Nick Loudaros
#date           :20181120
#version        :0.5    
#usage		 	:bash nano_autoinstaller.sh
#notes          :WARNING! This script supresses all error messages of yum.
#==============================================================================

#Cleanup (Yum & Folders)
 echo -n -e "\e[0mRemoving old NanoInstaller folders: " && 
 rm -rf /opt/nano3.2/ > /dev/null 2>&1 && 
 sleep 2 && 
 echo -e " \e[92mSUCCESS! ";

 echo -n -e "\e[0mRemoving nano using Yum: " && 
 yum remove nano -y -q -e 0 > /dev/null 2>&1 && 
 sleep 2 && 
 echo -e " \e[92mSUCCESS! ";

#Download latest tarball - install devel
echo -n -e "\e[0mInstalling Nano editor v3.2: " && 
yum install tar gcc make ncurses-devel -y -q -e 0 > /dev/null 2>&1  &&
rm -rf /opt/nano_installer/ &&
mkdir /opt/nano_installer/ && cd /opt/nano_installer/ &&
wget https://www.nano-editor.org/dist/v3/nano-3.2.tar.gz > /dev/null 2>&1 && 
tar -xvf nano-3.2.tar.gz > /dev/null 2>&1 && 
cd nano-3.2/ && 
./configure > /dev/null 2>&1 && 
make > /dev/null 2>&1 && 
make install > /dev/null 2>&1 &&
sleep 2 && 
echo -e " \e[92mSUCCESS! ";

#Install Nano syntax highlighting
echo -n -e "\e[0mInstalling Nano code highlighting: " &&
cd /opt/nano_installer/ &&
yum install git -y -q -e 0  > /dev/null 2>&1  && git clone https://github.com/scopatz/nanorc.git  > /dev/null 2>&1 && cd ./nanorc/ && ./install.sh  > /dev/null 2>&1 &&
echo "set linenumbers" >> ~/.nanorc && echo "set constantshow" >> ~/.nanorc &&  sleep 2 &&  echo -e " \e[92mSUCCESS! " && sleep 2 && echo -e "\e[0mAll quiet on the Eastern Front \n Enjoy! ";







