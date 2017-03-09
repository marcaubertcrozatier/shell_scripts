#/bin/sh

CL=$1
STR="css-apps/packages/db-tier/migration-scripts/cid/upgrade_cid.sql"
p4 opened  | grep $STR > /dev/null
if [ $? = 0 ]
then CODE=0
else echo "Submit fails: Please update the database upgrade script $STR."
	CODE=1
fi
echo "CODE=$CODE"
exit $CODE
