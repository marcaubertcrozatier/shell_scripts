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

ROOTP4="//depot/mr/EBFs"
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
REP=`pwd`
REP=`echo $REP |awk -F"EBFs" '{print $2}'`
echo "REP=$REP"
rep4="${ROOTP4}${REP}/${EBF}"
echo "rep4=$rep4"
rep4=`echo $rep4 | sed -e 's?/?\\\\/?g'`
sed -e "s/!EBF!/$EBF/" \
    -e "s/!P4!/$rep4/" \
< /home/nsuser/tools/mailebf2.in > /home/nsuser/tools/mailebf.txt
email -s "${EBF}" $RECIP < /home/nsuser/tools/mailebf.txt
