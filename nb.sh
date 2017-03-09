#/bin/sh
fic=$1
nbligne=0
cat $fic | while read ligne
do
  nbligne=`expr $nbligne + 1`
  nc=`echo $ligne | awk '{print length($0)}'`
  echo "ligne $nbligne : $nc carateres."
done
