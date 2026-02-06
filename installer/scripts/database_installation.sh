
. /installer/config/install.env

echo "******************************************************************************"
echo " ${GREEN}Creating Configuration and requreid directories ...." `date`
echo "******************************************************************************"
#skip it if you already download
#java -jar /home/oracle/scripts/autoupgrade/autoupgrade.jar  -config /home/oracle/scripts/autoupgrade/config/26ai.cfg  -patch -mode download

rm -f -r  $ORACLE_HOME
mkdir -p $ORACLE_HOME
echo "oracle home is $ORACLE_HOME"
ls $ORACLE_HOME
#mkdir -p /u01/app/oraInventory

echo " checking if configuration existing and creating it ...." `date`

rm /installer/config/26ai_install.cfg -f 
cat >> /installer/config/26ai_install.cfg  <<EOF
global.global_log_dir=/installer/software/autoupgrade/log
patch1.log_dir=/installer/software/autoupgrade/log/DB1
patch1.folder=/installer/software
patch1.patch=RU,OPATCH
patch1.target_version=23
patch1.target_home=/u01/app/oracle/product/26ai/dbhome_1
patch1.home_settings.edition=ee
patch1.home_settings.oracle_base=/u01/app/oracle
patch1.home_settings.inventory_location=/u01/app/oraInventory
patch1.home_settings.inventory_group=oinstall
EOF

echo "******************************************************************************"
echo "checking and verify oracle software existing " `date`
echo "******************************************************************************"


ls -la /installer/software/p*


echo "******************************************************************************"
echo " checking and verify Autoupgrade software  Version " `date`
echo "******************************************************************************"


java -jar /installer/software/autoupgrade.jar   -version



echo "******************************************************************************"
echo "installation oracle 26ai home and Be patient and waiting for completing tasks " `date`
echo "******************************************************************************"

echo "Typing command 'lsj' for checking job and 'status' for checking status"

echo "******************************************************************************"
echo "******************************************************************************"




java -jar /installer/software/autoupgrade.jar  -config /installer/config/26ai_install.cfg  -patch -mode create_home





echo "******************************************************************************"
echo " installation oracle 26ai home is completed " `date`
echo "******************************************************************************"


 
