#
# ORACLE_HOME & path & ld_library path doivent etre configures configures
#
# Les tablespaces ne dpivent pas deja exister
# <NETO_XXX_XXX> : cf config.mk
# <Oracle data file directory>: 
#	cf install des instances sur la machine du serveur Oracle 
#	(e.g.: /export/home/oracle/OraHome1/oradata/CID & /export/home/oracle/OraHome1/oradata/CBU sur prunelle)
#
ORACLE_BASE=/space/oracle
ORACLE_HOME=${ORACLE_BASE}/product/9.2
LD_LIBRARY_PATH=${ORACLE_HOME}/lib
ORA_NLS=${ORACLE_HOME}/ocommon/nls/admin/data/
ORA_NLS32=${ORACLE_HOME}/ocommon/nls/admin/data/
ORA_NLS33=${ORACLE_HOME}/ocommon/nls/admin/data/
NLS_LANG=american_america.WE8ISO8859P1
PATH=/usr/local/bin:/bin:/usr/ccs/bin::/usr/ucb:/usr/bin/X11:/usr/sbin:/bin:/usr/bin:/usr/etc:/usr/ucb:/usr/openwin/bin/xview:/usr/openwin/bin:/usr/5bin:.:${JAVA_HOME}/bin:${ORACLE_HOME}/bin
LANG=en_US

export ORACLE_BASE ORACLE_HOME LD_LIBRARY_PATH ORA_NLS ORA_NLS32 ORA_NLS33 NLS_LANG PATH
# creation des tablespace CID
#sqlplus <NETO_CID_DBA>/<NM_CID_DBA_PASSWORD>@<NETO_CID_SERVER> @cid_tablespaces <Oracle data file directory>
sqlplus system/system@CIDNUT @cid_tablespaces "/space/oracle/oradata/CIDNUT"

# creation des tablespace CBU
#sqlplus <NETO_CBU_DBA>/<NM_CBU_DBA_PASSWORD>@<NETO_CBU_SERVER> @cbu_tablespaces <Oracle data file directory>

sqlplus system/system@CBUNUT @cbu_tablespaces "/space/oracle/oradata/CBUNUT"
