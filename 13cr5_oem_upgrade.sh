unset CLASSPATH

SOFTWARE_DIR=/nfsshare/soft/oem13cr2
chmod u+x ${SOFTWARE_DIR}/em13500_linux64.bin
${SOFTWARE_DIR}/em13500_linux64.bin -silent -responseFile /nfsshare/vagrant/BUILD_SCRIPTS/13cr5_oem_upgrade.rsp
