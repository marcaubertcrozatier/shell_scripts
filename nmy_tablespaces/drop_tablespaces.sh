#
# ORACLE_HOME & path & ld_library path doivent etre configures configures
#
# Les tablespaces ne dpivent pas deja exister
# <NETO_XXX_XXX> : cf config.mk
# <Oracle data file directory>: 
#	cf install des instances sur la machine du serveur Oracle 
#	(e.g.: /export/home/oracle/OraHome1/oradata/CID & /export/home/oracle/OraHome1/oradata/CBU sur prunelle)
#

. ../build.mk
export ORACLE_BASE ORACLE_HOME LD_LIBRARY_PATH ORA_NLS ORA_NLS32 ORA_NLS33 NLS_LANG PATH
# creation des tablespace CID
#sqlplus <NETO_CID_DBA>/<NM_CID_DBA_PASSWORD>@<NETO_CID_SERVER> @cid_tablespaces <Oracle data file directory>
sqlplus system/system@LOGITAS.ELMER @dropcid_tablespaces

# creation des tablespace CBU
#sqlplus <NETO_CBU_DBA>/<NM_CBU_DBA_PASSWORD>@<NETO_CBU_SERVER> @cbu_tablespaces <Oracle data file directory>
sqlplus system/system@LOGITAS.ELMER @dropcbu_tablespaces
