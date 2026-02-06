#########################
#This script written by Voeurng Sovann 01 DEC 2025
#version 2 integrate with autoupgrade tool
#This script for internal usages in FC Database Support Division 
########################
VERSION="2.0.0"
INSTALLER_FILE=""
case $1 in
 --ospackages)
 INSTALLER_FILE= sh /installer/scripts/install_os_packages.sh
 ;;
 --CreateHomeAuto)
 INSTALLER_FILE= sh /installer/scripts/AutoUprade_createHome.sh
 ;;
 --createdb)
 INSTALLER_FILE= su - oracle -c 'sh /installer/scripts/oracle_create_database.sh'
 ;;
 --dropdb)
 INSTALLER_FILE= su - oracle -c 'sh /installer/scripts/oracle_drop_database.sh'
 ;;
 --version)
 echo "Installer script version \"$VERSION\""

 exit
 ;;
 *)
 echo "=== PROVIDE ONE OF THIS VALID OPTIONS ==="
 echo "
--ospackages : install required os packages in linux
--createdb:
        create database

--dropdb:
        drop database 


--CreateHomeAuto:
         creating oracle home using autoupgrade
--version:
        show current version and last modified of script
 "

 exit
 ;;
esac

