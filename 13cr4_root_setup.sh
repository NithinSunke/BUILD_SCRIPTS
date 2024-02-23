#!/bin/bash

. /nfsshare/vagrant/BUILD_SCRIPTS/config/db_install.env

#chown -R oracle.oinstall ${SCRIPTS_DIR} /o01

#sh /nfsshare/vagrant/BUILD_SCRIPTS/oms_install_os_packages.sh

echo "******************************************************************************"
echo "Prepare environment and install the software." `date`
echo "******************************************************************************"

#su - oracle -c 'sh /nfsshare/vagrant/BUILD_SCRIPTS/oms_db_param_settings.sh'
su - oracle -c 'sh /nfsshare/vagrant/BUILD_SCRIPTS/oms_13.4_install.sh'
