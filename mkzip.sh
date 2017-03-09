#/bin/sh
#
#
#### Generation du zip pour un EBF
#
# Usage : 
# Se deplacer dans le repertoire contenant le repertoire de l'ebf concerne.
# Ex : cd /space/nsuser/p4client/mr/EBFs/MyNyPlatform/3.5
# ls donne : EBF-59827/
# executer mkzip.sh <nom de l'ebf>
# Ex : mkzip EBF-59827
#
#

EXT=tar
P4=/usr/local/bin/p4
P4PORT=perforce:1666
P4CLIENT=nutora_mr
P4PASSWD=nsuser
#RECIP=Marc.Aubert@comverse.com
RECIP=Michael.Daninos@comverse.com,Marc.Aubert@comverse.com,Nicolas.Derycke@comverse.com,Steven.Decruynaere@comverse.com
export P4 P4PORT P4CLIENT P4PASSWD

echo;echo "============ synchronisation perforce =============="
$P4 sync -f ./... 

EBF=$1
echo;echo "============ generation du zip ====================="
if [ -f "${EBF}.zip" ]
then rm -f "${EBF}.zip"
fi
zip -b . $EBF $EBF/*
mv ${EBF}.zip ${EBF}.${EXT}
sed -e "s/!EBF!/$EBF/" < /home/nsuser/tools/mailebf.in > /home/nsuser/tools/mailebf.txt
email -s "${EBF}" -a ${EBF}.${EXT} $RECIP < /home/nsuser/tools/mailebf.txt
rm -f "${EBF}.${EXT}"
