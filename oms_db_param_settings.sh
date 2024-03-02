#!/bin/bash

. /nfsshare/vagrant/BUILD_SCRIPTS/config/db_install.env

. /home/oracle/scripts/${ORACLE_SID}.env

# Set the PDB to auto-start.
 sqlplus / as sysdba <<EOF
 alter system set db_create_file_dest='${DATA_DIR}';
 alter pluggable database ${PDB_NAME} save state;

 -- Recommended minimum settings.
 alter system set "_allow_insert_with_update_check"=true scope=both;
 alter system set session_cached_cursors=200 scope=spfile;
 
 -- Recommended: processes=600
 alter system set processes=1000 scope=spfile;

 -- Recommended: pga_aggregate_target=1G
 alter system set pga_aggregate_target=3g scope=spfile;

 -- Recommended: sga_target=3G
 alter system set sga_max_size=5G scope=spfile;
 alter system set sga_target=5G scope=spfile;

 -- Recommended: shared_pool_size=600M
 alter system set shared_pool_size=2G scope=spfile;

 -- For 12.1.0.2 set the following.
 --alter system set optimizer_adaptive_features=false scope=both;

 -- Should not be needed for 19c, but installer fails without them.
 alter system set "_optimizer_nlj_hj_adaptive_join"= FALSE scope=both sid='*';
 alter system set "_optimizer_strans_adaptive_pruning" = FALSE scope=both sid='*';
 alter system set "_px_adaptive_dist_method" = OFF scope=both sid='*';
 alter system set "_sql_plan_directive_mgmt_control" = 0 scope=both sid='*';
 alter system set "_optimizer_dsdir_usage_control" = 0 scope=both sid='*';
 alter system set "_optimizer_use_feedback" = FALSE scope=both sid='*';
 alter system set "_optimizer_gather_feedback" = FALSE scope=both sid='*';
 alter system set "_optimizer_performance_feedback" = OFF scope=both sid='*';

 SHUTDOWN IMMEDIATE;
 STARTUP;
 
 exit;
EOF
