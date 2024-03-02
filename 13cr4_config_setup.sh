. /nfsshare/vagrant/BUILD_SCRIPTS/config/db_install.env

export MW_HOME=/o01/oracle/middleware

unset CLASSPATH
${MW_HOME}/sysman/install/ConfigureGC.sh -silent -responseFile /nfsshare/vagrant/BUILD_SCRIPTS/oms_config.rsp
