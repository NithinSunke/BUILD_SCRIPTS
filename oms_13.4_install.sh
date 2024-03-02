#!/bin/bash

. /nfsshare/vagrant/BUILD_SCRIPTS/config/db_install.env

mkdir -p /o01/oracle/middleware
mkdir -p /o01/oracle/agent

export SOFTWARE_DIR=/h01/software

unset CLASSPATH
${SOFTWARE_DIR}/em13400_linux64.bin -silent -responseFile /nfsshare/vagrant/BUILD_SCRIPTS/oms_install.rsp

mkdir -p /h01/tmp

#unset CLASSPATH
#${SOFTWARE_DIR}/em13400_linux64.bin -silent -responseFile /nfsshare/vagrant/BUILD_SCRIPTS/oms_install.rsp  -J-Djava.io.tmpdir=/h01/tmp/

sh ${MW_HOME}/allroot.sh

