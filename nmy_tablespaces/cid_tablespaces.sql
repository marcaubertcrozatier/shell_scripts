CREATE TABLESPACE "INVOICE_DATA" NOLOGGING DATAFILE '&1/INVOICE_DATA.dbf' 
 SIZE 5M AUTOEXTEND ON NEXT  1M EXTENT MANAGEMENT LOCAL UNIFORM SIZE 64K
/

CREATE TABLESPACE "INVOICE_INDEX" NOLOGGING DATAFILE '&1/INVOICE_INDEX.dbf'
 SIZE 5M AUTOEXTEND ON NEXT  1M EXTENT MANAGEMENT LOCAL UNIFORM SIZE 64K
/

CREATE TABLESPACE "REQUEST_DATA" NOLOGGING DATAFILE '&1/REQUEST_DATA.dbf'
 SIZE 5M AUTOEXTEND ON NEXT  1M EXTENT MANAGEMENT LOCAL UNIFORM SIZE 64K
/

CREATE TABLESPACE "REQUEST_INDEX" NOLOGGING DATAFILE '&1/REQUEST_INDEX.dbf'
 SIZE 5M AUTOEXTEND ON NEXT  1M EXTENT MANAGEMENT LOCAL UNIFORM SIZE 64K
/

CREATE TABLESPACE "USER_DATA" NOLOGGING DATAFILE '&1/USER_DATA.dbf'
 SIZE 5M AUTOEXTEND ON NEXT  1M EXTENT MANAGEMENT LOCAL UNIFORM SIZE 64K
/

CREATE TABLESPACE "USER_INDEX" NOLOGGING DATAFILE '&1/USER_INDEX.dbf'
 SIZE 5M AUTOEXTEND ON NEXT  1M EXTENT MANAGEMENT LOCAL UNIFORM SIZE 64K
/

quit;
