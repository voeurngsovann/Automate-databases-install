#!/bin/bash

## color
GREEN="\e[32m"
RESET="\e[0m"
cat /installer/config/install.env

chown oracle:oinstall /installer/software/autoupgrade.jar
chown oracle:oinstall /installer/scripts/database_installation.sh 
chmod 755 /installer/software/autoupgrade.jar
chmod 755 /installer/scripts/database_installation.sh

#su - oracle -c 'sh /installer/scripts/database_installation.sh ' 


echo -e  "${GREEN}***********************************************************************${RESET} "
echo -e  "${GREEN}  Performing root.sh from oracle binary home ${RESET}  " `date`
echo -e  "${GREEN} ***************************************************************************${RESET} "    

. /installer/config/install.env


#sh $ORACLE_HOME/root.sh

echo -e  "${GREEN} ***************************************************************************${RESET} "
echo -e  " ${GREEN} Following is the database binary which has installed ${RESET}" `date`
echo -e  "${GREEN} ***************************************************************************${RESET} "

su - oracle -c '$ORACLE_HOME/OPatch/opatch version'
su - oracle -c 'echo QUIT | $ORACLE_HOME/bin/sqlplus /nolog; '

echo -e " ${GREEN}************************************************************************${RESET} "

echo -e " ${GREEN} This is the database home and version of opatch hat was installed ${RESET} " `date`

echo -e  "${GREEN} ***************************************************************************${RESET} "    
