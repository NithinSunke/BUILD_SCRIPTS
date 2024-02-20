. /nfsshare/vagrant/BUILD_SCRIPTS/config/db_install.env

#sh /nfsshare/vagrant/BUILD_SCRIPTS/19c_install_os_packages.sh
#
#mkdir -p ${SCRIPTS_DIR}
#mkdir -p ${SOFTWARE_DIR}
#mkdir -p ${DATA_DIR}
#chown -R oracle.oinstall ${SCRIPTS_DIR} /h01 /d01
#
#echo "******************************************************************************"
#echo "Prepare environment and install the software." `date`
#echo "******************************************************************************"
#su - oracle -c 'sh /nfsshare/vagrant/BUILD_SCRIPTS/oracle_user_environment_setup.sh'
su - oracle -c 'sh /nfsshare/vagrant/BUILD_SCRIPTS/19c_oracle_software_installation.sh'

echo "******************************************************************************"
echo "Run root scripts." `date`
echo "******************************************************************************"
sh ${ORA_INVENTORY}/orainstRoot.sh
sh ${ORACLE_HOME}/root.sh

echo "******************************************************************************"
echo "Create the database and install the ORDS software." `date`
echo "******************************************************************************"
su - oracle -c 'sh /nfsshare/vagrant/BUILD_SCRIPTS/oracle_create_database.sh'

sh /nfsshare/vagrant/BUILD_SCRIPTS/oracle_service_setup.sh
