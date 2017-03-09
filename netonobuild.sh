#!/bin/sh
#
#
#
#
###########################
trap 'sortir' 2 3 9 15
OPTION=$1
export OPTION
#*******
ts()
{
  ts0=`date|awk '{print $4}'`
  ts_h=`echo $ts0 | awk -F":" '{print $1}'`
  ts_h=`expr $ts_h \* 3600`
  ts_m=`echo $ts0 | awk -F":" '{print $2}'`
  ts_m=`expr $ts_m \* 60`
  ts_s=`echo $ts0 | awk -F":" '{print $3}'`
  ts_s=`expr $ts_h + $ts_m + $ts_s`
}

buildenv()
{
  if [ ! -f netonobuild.sh ]
  then echo "You are not in the right directory."
       exit 1
  fi
#  if [ ! -f build.mk ]
#  then /usr/local/bin/perl ../build/bin/configure.pl build.mk.in
#  fi
  . ./build.mk
  SWFDIR=`pwd`
  cd ../../platform
  BUILD_ROOTDIR=`pwd`
  NM_DEV_ROOTDIR=$BUILD_ROOTDIR
  DEMO_ROOTDIR=$BUILD_ROOTDIR/../demo
  OUTPUTDIR=$BUILD_ROOTDIR/output
  BR=`basename $BUILD_ROOTDIR`
  export BUILD_ROOTDIR OUTPUTDIR SWFDIR NM_DEV_ROOTDIR PATH LD_LIBRARY_PATH SWF BR DEMO_ROOTDIR
  export RECIPDEV RECIPALL RECIPCM
  export ORACLE_BASE ORACLE_HOME NLS_LANG ORA_NLS ORA_NLS32 ORA_NLS33
  export JAVA_HOME
  export SWF
  export BRANCHNAME SWFBRANCHNAME
  #LDB="db2"
  #LDB="oracle mssql"
  #LDB="oracle mssql db2"
  export LDB DB2
  export P4PORT P4CLIENT P4USER P4PASSWD P4PATH
  export DISPLAY LANG
  P4REP=`echo "${NETO_BUILD_HOME}/$P4REP"`
  project=C-ONEPLATFORM
  export project DEMOPROJECT
  branchname=`echo "$BRANCHNAME"` #| sed -e "s|$P4REP/||g"` #//depot/$branchname
  sbranchname=`echo $branchname | sed -e 's?/?\\\\/?g'`
  swfbranchname=`echo "$SWFBRANCHNAME"` # | sed -e "s|$P4REP/||g"` #//depot/$branchname
  sswfbranchname=`echo $swfbranchname | sed -e 's?/?\\\\/?g'`
  export branchname swfbranchname sbranchname sswfbranchname
echo "swfbranchname=$swfbranchname"
  labeltemplate=${PROJECT}"-labeltemplate"
  unset DEBUG
  if [ ! -d $NETO_NSHOME/tools/$BR ]
  then mkdir -p $NETO_NSHOME/tools/$BR
  fi
  echo
  cd $SWFDIR
}
#-----------------------------#
# GetEcho: BSD or SVR4 echo ? #
#-----------------------------#
GetEcho()
{
        ret=`echo -n`
        if [ "x${ret}" = "x-n" ] ; then
                type_echo=SYS5
        else
                type_echo=BSD
        fi
}
#----------------------------#
# EchoNoCR: Print without CR #
#----------------------------#
EchoNoCR()
{
        if [ "${type_echo}" = SYS5 ] ; then
                echo "$*"'\c'
        else
                echo -n "$*"

        fi
}
#*******
build_clean()
{
  echo "==========>>>>> BEGIN make clean <<<<<==========" >> $NETO_LOGS/$log
  EchoNoCR "make clean..."
  cd $SWFDIR
  sh $SWFDIR/build_clean.sh >>$NETO_LOGS/$log 2>&1
  if [ $? = 1 ]
  then echo
	   echo
       echo "***********************************"
       echo " MAKE CLEAN ERROR : See $NETO_LOGS/$log"
       echo "***********************************"
	   step="make clean"
	   mailerror
	   exit 1
  fi
  echo "OK."
  echo "==========>>>>> END make clean <<<<<==========" >> $NETO_LOGS/$log
}
#*******
build_all()
{
  ts
  build_main_all_t0=$ts_s

  echo "==========>>>>> BEGIN make all <<<<<==========" >> $NETO_LOGS/$log
  EchoNoCR "make all..."
  echo "make all" >> $NETO_LOGS/$log
  if [ $DB2 = 1 ]
  then cd $BUILD_ROOTDIR/admin
       make all
       cd $BUILD_ROOTDIR
       cd $SWFDIR
       sh build_predb2.sh &
       sleep 10
  fi
  sh $SWFDIR/build_all.sh >> $NETO_LOGS/$log 2>&1
  if [ $? = 1 ]
  then echo
	   echo
       echo "***********************************"
       echo " MAKE ALL ERROR : See $NETO_LOGS/$log"
       echo "***********************************"
	   step="make all"
	   mailerror
       exit 1
  fi
  echo "OK."
  echo "==========>>>>> END make all <<<<<==========" >> $NETO_LOGS/$log

  ts
  echo "BUILDMEASURE BUILD.MAIN.ALL.TIME" `expr $ts_s - $build_main_all_t0` >> $NETO_LOGS/$log
}
#*******
javadoc()
{
  echo "==========>>>>> BEGIN make javadoc <<<<<==========" >> $NETO_LOGS/$log
  EchoNoCR "make javadoc..."
  echo "make javadoc" >> $NETO_LOGS/$log
  sh $SWFDIR/build_javadoc.sh 
  #sh $SWFDIR/build_javadoc.sh >> $NETO_LOGS/$log 2>&1
  if [ $? = 1 ]
  then echo
	   echo
       echo "***********************************"
       echo " MAKE JAVADOC ERROR : See $NETO_LOGS/$log"
       echo "***********************************"
	   step="make javadoc"
	   mailerror
       exit 1
  fi
  echo "OK."
  echo "==========>>>>> END make javadoc <<<<<==========" >> $NETO_LOGS/$log

}
#*******
isfjavadoc()
{
  echo "==========>>>>> BEGIN make isfjavadoc <<<<<==========" >> $NETO_LOGS/$log
  EchoNoCR "make isfjavadoc..."
  echo "make isfjavadoc" >> $NETO_LOGS/$log
  sh $SWFDIR/build_isfdoc.sh 
  #sh $SWFDIR/build_doc.sh >> $NETO_LOGS/$log 2>&1
  if [ $? = 1 ]
  then echo
	   echo
       echo "***********************************"
       echo " MAKE ISFJAVADOC ERROR : See $NETO_LOGS/$log"
       echo "***********************************"
	   step="make isfjavadoc"
	   mailerror
       exit 1
  fi
  echo "OK."
  echo "==========>>>>> END make isfjavadoc <<<<<==========" >> $NETO_LOGS/$log

}
llabel()
{
  formatdate
  nomdir="${label}-$netodate"
  nomtar="${label}-$netodate.tar"
  demonomtar="${demolabel}-$netodate.tar"
  log="build_log_${label}-$netodate"
  export log nomtar nomdir demonomtar
}
#*******
build_deploy()
{
  ts
  build_main_deploy_t0=$ts_s

  echo "==========>>>>> BEGIN make deploy <<<<<==========" >> $NETO_LOGS/$log
  EchoNoCR "make deploy..."
  sh $SWFDIR/build_deploy.sh >> $NETO_LOGS/$log 2>&1
  if [ $? = 1 ]
  then echo
	   echo
       echo "***********************************"
       echo " MAKE DEPLOY ERROR : See $NETO_LOGS/$log"
       echo "***********************************"
	   step="make deploy"
	   mailerror
       exit 1
  fi
  echo "OK."
  echo
  ls -l $BUILD_ROOTDIR/${PROJECT}*.tar
  echo
  echo  "==========>>>>>END make deploy <<<<<==========" >> $NETO_LOGS/$log

  ts
  echo "BUILDMEASURE BUILD.MAIN.DEPLOY.TIME" `expr $ts_s - $build_main_deploy_t0` >> $NETO_LOGS/$log
}
#*******
build_setup()
{
  ts
  build_main_setup_t0=$ts_s

  echo "==========>>>>> BEGIN make setup <<<<<==========" >> $NETO_LOGS/$log
  cd $SWFDIR
  EchoNoCR "make setup..."
  sh $SWFDIR/build_setup.sh >> $NETO_LOGS/$log 2>&1
  if [ $? = 1 ]
  then echo
	   echo
       echo "***********************************"
       echo " MAKE INSTALLER ERROR : See $NETO_LOGS/$log"
       echo "***********************************"
	   step="make installer"
	   mailerror
       exit 1
  fi
  echo "OK."
  echo "==========>>>>> END make setup <<<<<==========" >> $NETO_LOGS/$log

  ts
  echo "BUILDMEASURE BUILD.MAIN.SETUP.TIME" `expr $ts_s - $build_main_setup_t0` >> $NETO_LOGS/$log
}
#*******
build_test()
{
  ts
  build_main_test_t0=$ts_s

  echo "==========>>>>> BEGIN TESTS <<<<<==========" >> $NETO_LOGS/$log
  EchoNoCR "make test..."
  cd $SWFDIR
  sh $SWFDIR/build_test.sh >> $NETO_LOGS/$log 2>&1
  if [ $? -ne 0 ]
  then echo
	   echo
       echo "***********************************"
       echo " MAKE TEST ERROR : See $NETO_LOGS/$log"
       echo "***********************************"
	   step="make test"
	   mailerror
       exit 1
  fi
  echo "OK."
  echo "==========>>>>> END TESTS <<<<<==========" >> $NETO_LOGS/$log

  ts
  echo "BUILDMEASURE BUILD.MAIN.TEST.TIME" `expr $ts_s - $build_main_test_t0` >> $NETO_LOGS/$log
}
#*******
build_valid()
{
  echo "==========>>>>> BEGIN VALIDATION <<<<<==========" >> $NETO_LOGS/$log
  cd $SWFDIR
  EchoNoCR "make valid..."
  sh $SWFDIR/build_valid.sh >> $NETO_LOGS/$log 2>&1
  if [ $? -ne 0 ]
  then echo
	   echo
       echo "***********************************"
       echo " MAKE VALID ERROR : See $NETO_LOGS/$log"
       echo "***********************************"
	   step="make valid"
	   mailerror
       exit 1
  fi
  echo "OK."
  echo `date` >> $NETO_LOGS/$log
  echo "==========>>>>> END VALIDATION <<<<<==========" >> $NETO_LOGS/$log
}
#*******
mailerror()
{
  flog=$log.txt
  sed -e "s/!LABEL!/$label/" \
	  -e "s/!STEP!/$step/" \
	  -e "s/!LOG!/$flog/" \
  < $SWFDIR/mailerror.in > $NETO_NSHOME/tools/mailerror.txt
  cp $NETO_LOGS/$log $NETO_TARS/../../tmplogs/$flog
#  tail -100 $NETO_LOGS/$log >> $NETO_NSHOME/tools/mailerror.txt
  subject="[SwF/Daily] C-ONE $label : error during the $step"
  email -s "${subject}" $RECIPDEV < $NETO_NSHOME/tools/mailerror.txt
  rm -f $NETO_NSHOME/.build
}
#*******
slogmake()
{
  echo > $NETO_LOGS/$log
  #xterm -geometry 135x60 -sb -sl 5000 -bg grey -title "tail -f $log" -e tail -f $NETO_LOGS/$log &
}
#*******
formatdate()
{
 netodate="`date '+%Y-%m-%dT%H%M'`"
}
#*******
mailcore()
{
  echo
  cd $BUILD_ROOTDIR
  flog=build_log_$nomdir
  if [ ! -d $NETO_TARS/$project/$nomdir ] #Debut copie de la build
  then mkdir -p $NETO_TARS/$project/$nomdir
	   cp $nomtar $NETO_TARS/$project/$nomdir/
	   diff $nomtar $NETO_TARS/$project/$nomdir/$nomtar
	   if [ $? != 0 ]
	   then echo "cp $nomtar $NETO_TARS/$project/$nomdir/$nomtar.tar failed."
	        exit 1
       fi
	   cp $NETO_LOGS/$flog $NETO_TARS/$project/$nomdir/${flog}.txt
	   diff $NETO_LOGS/$flog $NETO_TARS/$project/$nomdir/${flog}.txt
	   if [ $? != 0 ]
	   then echo "cp $NETO_LOGS/$flog $NETO_TARS/$project/$nomdir/$flog.txt failed."
	        exit 1
       fi

	   cd $OUTPUTDIR/installers
	   for installer in `ls`
	   do
		 if [ -f $installer ]
		 then cp $installer $NETO_TARS/$project/$nomdir
	          diff $installer $NETO_TARS/$project/$nomdir/$installer
	          if [ $? != 0 ]
	          then echo "cp $installer $NETO_TARS/$project/$nomdir/$installer failed."
	               exit 1
              fi
		 fi
		 if [ -d $installer ]
		 then cd $installer
			  mkdir -p $NETO_TARS/$project/$nomdir/$installer
			  for installer2 in `ls`
			  do
				cp $installer2 $NETO_TARS/$project/$nomdir/$installer
				diff $installer2 $NETO_TARS/$project/$nomdir/$installer/$installer2
				if [ $? != 0 ]
				then echo "cp $installer2 $NETO_TARS/$project/$nomdir/$installer/$installer2 failed."
				     exit 1
				fi
			  done
			  cd ..
		 fi
       done
	   if [ -d $NETO_TARS/$project/$nomdir/nmy ]
	   then cp $BUILD_ROOTDIR/etc/nmy_main.conf $NETO_TARS/$project/$nomdir/nmy/nmy_main_install.conf
	   fi

	   cp $NETO_LOGS/$flog $NETO_TARS/$project/$nomdir/${flog}.txt
	   diff $NETO_LOGS/$flog $NETO_TARS/$project/$nomdir/${flog}.txt
	   if [ $? != 0 ]
	   then echo "cp $NETO_LOGS/$flog $NETO_TARS/$project/$nomdir/$flog.txt failed."
	        exit 1
       fi

  #Traitement des mesures
    cd $SWFDIR/buildmeasures
    p4 sync $MEASUREFIC
    p4 edit $MEASUREFIC
    sed -e "s/!LABEL!/$label/" \
        < $SWFDIR/measurespecif.in > $SWFDIR/measurespecif.$$
#    clmeanum=`p4 change -i < $SWFDIR/measurespecif.$$|awk '{print $2}'`
    chmod 644 $MEASUREFIC.sav
    cp $MEASUREFIC $MEASUREFIC.sav
    grep BUILDMEASURE $NETO_LOGS/$flog | sed -e "s/.*BUILDMEASURE/$nomdir/" -e "s/[ ]/,/g" >> $MEASUREFIC
#    p4 submit -c $clmeanum
    p4 submit -d "SWF: update journal.csv for $label."
    mkdir $NETO_TARS/$project/$nomdir/buildmeasures
    cp $MEASUREFIC  measures.xls $NETO_TARS/$project/$nomdir/buildmeasures
  # Fin traitement des mesures


## Copie sur jerusalem (publication)
#	if [ -d /home/jerusalem2/sf/cdimages/swf/builds/build/$project/$nomdir ]
#	then rm -rf /home/jerusalem2/sf/cdimages/swf/builds/build/$project/$nomdir
#	fi
#    if [ ! -d /home/jerusalem2/sf/cdimages/swf/builds/build/$project/$nomdir ]
#    then cd $NETO_TARS/$project/$nomdir
#         mkdir -p /home/jerusalem2/sf/cdimages/swf/builds/build/$project/$nomdir
#         tar cf - .|(cd /home/jerusalem2/sf/cdimages/swf/builds/build//$project/$nomdir;tar xf -)
#    fi
## Fin Copie sur jerusalem (publication)

  fi #Fin copie de la build
  cd $SWFDIR
  if [ "${CDIMA}" = "4" ]
  then sh build_cdimage.sh $label
  fi
  rm -rf $NETO_TARS/$project
  while true
  do
    echo "		  (1) mail to dev only"
    echo "		  (2) mail to CM, dev, doc and qa"
    echo "		  (3) mail to CM"
    echo "		  (4) mail to null"
    echo
    EchoNoCR "Your choice : "
    read choix
    [ ! -z "${choix}" ] && break
  done
  case $choix in
	1) recip="$RECIPDEV";;
	2) recip="$RECIPALL";;
	3) recip="$RECIPCM";; # stephane.vanlierde@netonomy.com";;
	4) recip="$RECIPNULL";;
  esac
  export recip
  cd $NETO_NSHOME/tools
  rm -f mailhtml.txt
  if [ -f changes ]
  then rm changes
  fi
  echo "label=$label"
  lastch=`p4 labels | grep "^Label $label " | awk -F">" '{print $2}' | awk -F"+" '{print $1}' | awk -F"'" '{print $1}'`
#  firstlabel=`p4 labels | grep "^Label $PROJECT-[0-9][0-9][0-9][0-9][0-9] "| sort -n -t"-" -k 3,3 | grep -v "^Label $label " | tail -1 | awk '{print $2}'`
  #firstch=`p4 labels | grep "^Label $firstlabel " |awk -F">" '{print $2}' | awk -F"+" '{print $1}' | awk -F"'" '{print $1}'`
  firstlabel=`ls  $PLAREP|tail -2|head -1`
  firstch=`echo "$firstlabel" |awk -F"-" '{print $8}'`
  nbchanges=`expr $lastch - $firstch`
  verylast=`p4 changes | head -1|awk '{print $2}'`
  nbchanges2=`expr $verylast - $lastch`
  nbchanges=`expr $nbchanges + $nbchanges2`
  p4 changes -m $nbchanges //depot/$branchname/... > changes
  p4 labels | grep $firstlabel|awk -F">" '{print $2}' > firstchs
  p4 labels | grep $label|awk -F">" '{print $2}' > lastchs
  for i in `cat changes|awk '{print $2}'`
  do
	if [ "${i}" -le "${firstch}" ]
	then grep -v $i changes > changes2
		 mv changes2 changes
    fi
	if [ "${i}" -ge "${firstch}" ]
	then grep $i firstchs > /dev/null
         if [ $? = 0 ]
		 then grep -v $i changes > changes2
		      mv changes2 changes
		 fi
    fi
	if [ "${i}" -gt "${lastch}" ]
	then grep $i lastchs > /dev/null
         if [ $? != 0 ]
		 then grep -v $i changes > changes2
		      mv changes2 changes
		 fi
    fi
  done
  grep -v "SWF:" changes > changes2
  mv changes2 changes
  grep "NF:" changes > NF
  grep -v "NF:" changes > changes2
  mv changes2 changes
  grep "CR[0-9]*[0-9]:" changes > CR
  grep -v "CR[0-9]*[0-9]:" changes > changes2
  mv changes2 changes
  grep -v "SWFDIR:" changes > changes2
  mv changes2 changes
  sbranchname=`echo $branchname | sed -e 's?/?\\\\/?g'`
  fixedrecip=`echo $recip | sed -e 's/ /;/g'`
 duree
  sed -e "s/!LABEL!/$label/" \
      -e "s/!RECIP!/$fixedrecip/" \
      -e "s/!BUILDTYPE!/$BUILDTYPE/" \
      -e "s/!PROJECT!/$project/" \
      -e "s/!NOMDIR!/$nomdir/" \
      -e "s/!COTITRE!/$COTITRE/" \
      -e "s/!CODON!/$VERT/" \
      -e "s/!BRANCHNAME!/$sbranchname/"g \
      -e "s/!DUREE!/$Duree/"g \
< $SWFDIR/mailhtml.in > mailhtml.txt
  if [ ! -d $CDIMAGE/$project/${label}_CDImage ]
  then grep -v "_CDImage" mailhtml.txt > mailhtml.txt2
	   mv mailhtml.txt2 mailhtml.txt
  fi

  p4 sync $BUILD_ROOTDIR/config/version.properties@$label
  Name=`grep "ProductName=" $BUILD_ROOTDIR/config/version.properties |awk -F"=" '{print $2}'`
  Version=`grep "ProductVersion=" $BUILD_ROOTDIR/config/version.properties |awk -F"=" '{print $2}'`
  Major=`grep "ProductMajorVersion=" $BUILD_ROOTDIR/config/version.properties |awk '{print $2}'`
  Minor=`grep "ProductMinorVersion=" $BUILD_ROOTDIR/config/version.properties |awk '{print $2}'`
  Micro=`grep "ProductMicroVersion=" $BUILD_ROOTDIR/config/version.properties |awk '{print $2}'`
  Build=`grep "ProductBuildNumber=" $BUILD_ROOTDIR/config/version.properties |awk '{print $2}'`
  Date=`grep "ProductBuildDate=" $BUILD_ROOTDIR/config/version.properties |awk '{print $2}'`
  sed -e "s/!NOM!/$Name/" \
      -e "s/!VERSION!/$Version/" \
      -e "s/!BUILD!/${Major}.${Minor}.${Micro}.${Build}/" \
      -e "s/!DATE!/$Date/" \
< mailhtml.txt > mailhtml.txt2
mv mailhtml.txt2 mailhtml.txt

#  sed -e "s/!TITLE!/What's new (not yet validated by QC)/" \
#      -e "s/!COTITRE!/$COTITRE/" \
#< $SWFDIR/bc.in >> mailhtml.txt
#nb=`wc -l $SWFDIR/nyvbc.txt|awk '{print $1}'`
#cpt=1
#while [ $cpt -le $nb ]
#do
#  i=`head -$cpt $SWFDIR/nyvbc.txt |tail -1`
#  bc=`echo $i|awk -F"=" '{print $1}'`
#  com=`echo $i|awk -F"=" '{print $2}'`
#  nu=`echo $i|awk -F"=" '{print $3}'`
#  echo "<TR BGCOLOR=$VERT><TD>$bc</TD><TD>$com</TD><TD><CENTER>$nu</CENTER></TD></TR>" >> mailhtml.txt
#  cpt=`expr $cpt + 1`
#done
#
#  sed -e "s/!TITLE!/List of validated BC/" \
#      -e "s/!COTITRE!/$COTITRE/" \
#< $SWFDIR/bc.in >> mailhtml.txt
#nb=`wc -l $SWFDIR/lovbc.txt|awk '{print $1}'`
#cpt=1
#while [ $cpt -le $nb ]
#do
#  i=`head -$cpt $SWFDIR/lovbc.txt |tail -1`
#  bc=`echo $i|awk -F"=" '{print $1}'`
#  com=`echo $i|awk -F"=" '{print $2}'`
#  nu=`echo $i|awk -F"=" '{print $3}'`
#  echo "<TR BGCOLOR=$VERT><TD>$bc</TD><TD>$com</TD><TD><CENTER>$nu</CENTER></TD></TR>" >> mailhtml.txt
#  cpt=`expr $cpt + 1`
#done

 sed -e "s/!COTITRE!/$COTITRE/" \
 < $SWFDIR/changeinit.in >> mailhtml.txt

#sed -e "s/!TITRE!/changelists submited/" \
#    -e "s/!COTITRE!/$COTITRE/" \
#< $SWFDIR/changes.in >> mailhtml.txt
nb=`wc -l changes|awk '{print $1}'`
cpt=1
while [ $cpt -le $nb ]
do
  i=`head -$cpt changes |tail -1`
  cl=`echo $i|awk '{print $2}'`
  da=`echo $i|awk '{print $4}'`
  au=`echo $i|awk '{print $6}'`
  de=`echo $i|awk -F"'" '{print $2}'`
  echo "<TR BGCOLOR=$VERT><TD>$cl</TD><TD><CENTER>$da</CENTER></TD><TD>$au</TD><TD>$de</TD></TR>" >> mailhtml.txt
  cpt=`expr $cpt + 1`
done

  # Resultat des tests
  flog=$NETO_LOGS/build_log_$nomdir

### ORACLE
  grep "CORE ORACLE JUNIT" $flog|grep RESULT > BLM_test.tmp
  grep SUCCESS BLM_test.tmp > BLM_testOK.tmp
  grep FAILURE BLM_test.tmp > BLM_testKO.tmp
  BLM_O_nbtest=`wc BLM_test.tmp|awk '{print $1}'`
  BLM_O_nbtestOK=`wc BLM_testOK.tmp|awk '{print $1}'`
  BLM_O_nbtestKO=`wc BLM_testKO.tmp|awk '{print $1}'`

  grep "SYNCHRONIZER ORACLE JUNIT" $flog|grep RESULT > SYN_test.tmp
  grep SUCCESS SYN_test.tmp > SYN_testOK.tmp
  grep FAILURE SYN_test.tmp > SYN_testKO.tmp
  SYN_O_nbtest=`wc SYN_test.tmp|awk '{print $1}'`
  SYN_O_nbtestOK=`wc SYN_testOK.tmp|awk '{print $1}'`
  SYN_O_nbtestKO=`wc SYN_testKO.tmp|awk '{print $1}'`

  grep "UTIL ORACLE JUNIT" $flog|grep RESULT > UTI_test.tmp
  grep SUCCESS UTI_test.tmp > UTI_testOK.tmp
  grep FAILURE UTI_test.tmp > UTI_testKO.tmp
  UTI_O_nbtest=`wc UTI_test.tmp|awk '{print $1}'`
  UTI_O_nbtestOK=`wc UTI_testOK.tmp|awk '{print $1}'`
  UTI_O_nbtestKO=`wc UTI_testKO.tmp|awk '{print $1}'`

  grep "CID ORACLE JUNIT" $flog|grep RESULT > CID_test.tmp
  grep SUCCESS CID_test.tmp > CID_testOK.tmp
  grep FAILURE CID_test.tmp > CID_testKO.tmp
  CID_O_nbtest=`wc CID_test.tmp|awk '{print $1}'`
  CID_O_nbtestOK=`wc CID_testOK.tmp|awk '{print $1}'`
  CID_O_nbtestKO=`wc CID_testKO.tmp|awk '{print $1}'`

  grep "ISF ORACLE JUNIT" $flog|grep RESULT > ISF_test.tmp
  grep SUCCESS ISF_test.tmp > ISF_testOK.tmp
  grep FAILURE ISF_test.tmp > ISF_testKO.tmp
  ISF_O_nbtest=`wc ISF_test.tmp|awk '{print $1}'`
  ISF_O_nbtestOK=`wc ISF_testOK.tmp|awk '{print $1}'`
  ISF_O_nbtestKO=`wc ISF_testKO.tmp|awk '{print $1}'`

  grep "ADMIN ORACLE JUNIT" $flog|grep RESULT > ADM_test.tmp
  grep SUCCESS ADM_test.tmp > ADM_testOK.tmp
  grep FAILURE ADM_test.tmp > ADM_testKO.tmp
  ADM_O_nbtest=`wc ADM_test.tmp|awk '{print $1}'`
  ADM_O_nbtestOK=`wc ADM_testOK.tmp|awk '{print $1}'`
  ADM_O_nbtestKO=`wc ADM_testKO.tmp|awk '{print $1}'`

  grep "CID2CBULOADER ORACLE JUNIT" $flog|grep RESULT > C2B_test.tmp
  grep SUCCESS C2B_test.tmp > C2B_testOK.tmp
  grep FAILURE C2B_test.tmp > C2B_testKO.tmp
  C2B_O_nbtest=`wc C2B_test.tmp|awk '{print $1}'`
  C2B_O_nbtestOK=`wc C2B_testOK.tmp|awk '{print $1}'`
  C2B_O_nbtestKO=`wc C2B_testKO.tmp|awk '{print $1}'`

  grep "MLX ORACLE JUNIT" $flog|grep RESULT > MLX_test.tmp
  grep SUCCESS MLX_test.tmp > MLX_testOK.tmp
  grep FAILURE MLX_test.tmp > MLX_testKO.tmp
  MLX_O_nbtest=`wc MLX_test.tmp|awk '{print $1}'`
  MLX_O_nbtestOK=`wc MLX_testOK.tmp|awk '{print $1}'`
  MLX_O_nbtestKO=`wc MLX_testKO.tmp|awk '{print $1}'`

  grep "QRA ORACLE JUNIT" $flog|grep RESULT > QRA_test.tmp
  grep SUCCESS QRA_test.tmp > QRA_testOK.tmp
  grep FAILURE QRA_test.tmp > QRA_testKO.tmp
  QRA_O_nbtest=`wc QRA_test.tmp|awk '{print $1}'`
  QRA_O_nbtestOK=`wc QRA_testOK.tmp|awk '{print $1}'`
  QRA_O_nbtestKO=`wc QRA_testKO.tmp|awk '{print $1}'`

  grep " ORACLE JUNIT" $flog|grep RESULT > FILEMGR_test.tmp
  grep SUCCESS FILEMGR_test.tmp > FILEMGR_testOK.tmp
  grep FAILURE FILEMGR_test.tmp > FILEMGR_testKO.tmp
  FILEMGR_O_nbtest=`wc FILEMGR_test.tmp|awk '{print $1}'`
  FILEMGR_O_nbtestOK=`wc FILEMGR_testOK.tmp|awk '{print $1}'`
  FILEMGR_O_nbtestKO=`wc FILEMGR_testKO.tmp|awk '{print $1}'`

  grep "CUSTDIMLOADER ORACLE JUNIT" $flog|grep RESULT > CUS_test.tmp
  grep SUCCESS CUS_test.tmp > CUS_testOK.tmp
  grep FAILURE CUS_test.tmp > CUS_testKO.tmp
  CUS_O_nbtest=`wc CUS_test.tmp|awk '{print $1}'`
  CUS_O_nbtestOK=`wc CUS_testOK.tmp|awk '{print $1}'`
  CUS_O_nbtestKO=`wc CUS_testKO.tmp|awk '{print $1}'`

  grep "JOBSERVICE ORACLE JUNIT" $flog|grep RESULT > JBS_test.tmp
  grep SUCCESS JBS_test.tmp > JBS_testOK.tmp
  grep FAILURE JBS_test.tmp > JBS_testKO.tmp
  JBS_O_nbtest=`wc JBS_test.tmp|awk '{print $1}'`
  JBS_O_nbtestOK=`wc JBS_testOK.tmp|awk '{print $1}'`
  JBS_O_nbtestKO=`wc JBS_testKO.tmp|awk '{print $1}'`

  grep "CHANNELS ORACLE JUNIT" $flog|grep RESULT > CHA_test.tmp
  grep SUCCESS CHA_test.tmp > CHA_testOK.tmp
  grep FAILURE CHA_test.tmp > CHA_testKO.tmp
  CHA_O_nbtest=`wc CHA_test.tmp|awk '{print $1}'`
  CHA_O_nbtestOK=`wc CHA_testOK.tmp|awk '{print $1}'`
  CHA_O_nbtestKO=`wc CHA_testKO.tmp|awk '{print $1}'`

  grep "PLSTUDIO ORACLE JUNIT" $flog|grep RESULT > PLS_test.tmp
  grep SUCCESS PLS_test.tmp > PLS_testOK.tmp
  grep FAILURE PLS_test.tmp > PLS_testKO.tmp
  PLS_O_nbtest=`wc PLS_test.tmp|awk '{print $1}'`
  PLS_O_nbtestOK=`wc PLS_testOK.tmp|awk '{print $1}'`
  PLS_O_nbtestKO=`wc PLS_testKO.tmp|awk '{print $1}'`

  grep "ETL ORACLE JUNIT" $flog|grep RESULT > ETL_test.tmp
  grep SUCCESS ETL_test.tmp > ETL_testOK.tmp
  grep FAILURE ETL_test.tmp > ETL_testKO.tmp
  ETL_O_nbtest=`wc ETL_test.tmp|awk '{print $1}'`
  ETL_O_nbtestOK=`wc ETL_testOK.tmp|awk '{print $1}'`
  ETL_O_nbtestKO=`wc ETL_testKO.tmp|awk '{print $1}'`

  grep JUNIT $flog|grep -v "HTTP VALID"|grep RESULT |grep ORACLE > TOT_O_test.tmp
  grep SUCCESS TOT_O_test.tmp > TOT_O_testOK.tmp
  grep FAILURE TOT_O_test.tmp > TOT_O_testKO.tmp
  TOT_O_nbtest=`wc TOT_O_test.tmp|awk '{print $1}'`
  TOT_O_nbtestOK=`wc TOT_O_testOK.tmp|awk '{print $1}'`
  TOT_O_nbtestKO=`wc TOT_O_testKO.tmp|awk '{print $1}'`

  grep JUNIT $flog|grep -v "HTTP VALID"|grep RESULT > TOT_test.tmp
  grep SUCCESS TOT_test.tmp > TOT_testOK.tmp
  grep FAILURE TOT_test.tmp > TOT_testKO.tmp
  TOT_nbtest=`wc TOT_test.tmp|awk '{print $1}'`
  TOT_nbtestOK=`wc TOT_testOK.tmp|awk '{print $1}'`
  TOT_nbtestKO=`wc TOT_testKO.tmp|awk '{print $1}'`

if [ $BLM_O_nbtestKO -gt 0 ]
then coblmofai=$ROUGE
else coblmofai=$VERT
fi
if [ $SYN_O_nbtestKO -gt 0 ]
then cosynofai=$ROUGE
else cosynofai=$VERT
fi
if [ $UTI_O_nbtestKO -gt 0 ]
then coutiofai=$ROUGE
else coutiofai=$VERT
fi
if [ $CID_O_nbtestKO -gt 0 ]
then cocidofai=$ROUGE
else cocidofai=$VERT
fi
if [ $ISF_O_nbtestKO -gt 0 ]
then coisfofai=$ROUGE
else coisfofai=$VERT
fi
if [ $ADM_O_nbtestKO -gt 0 ]
then coadmofai=$ROUGE
else coadmofai=$VERT
fi
if [ $C2B_O_nbtestKO -gt 0 ]
then coc2bofai=$ROUGE
else coc2bofai=$VERT
fi
if [ $MLX_O_nbtestKO -gt 0 ]
then comlxofai=$ROUGE
else comlxofai=$VERT
fi
if [ $QRA_O_nbtestKO -gt 0 ]
then coqraofai=$ROUGE
else coqraofai=$VERT
fi
if [ $FILEMGR_O_nbtestKO -gt 0 ]
then cofilemgrofai=$ROUGE
else cofilemgrofai=$VERT
fi
if [ $CUS_O_nbtestKO -gt 0 ]
then cocusofai=$ROUGE
else cocusofai=$VERT
fi
if [ $JBS_O_nbtestKO -gt 0 ]
then cojbsofai=$ROUGE
else cojbsofai=$VERT
fi
if [ $CHA_O_nbtestKO -gt 0 ]
then cojbsofai=$ROUGE
else cojbsofai=$VERT
fi
if [ $PLS_O_nbtestKO -gt 0 ]
then coplsofai=$ROUGE
else coplsofai=$VERT
fi
if [ $ETL_O_nbtestKO -gt 0 ]
then coetlofai=$ROUGE
else coetlofai=$VERT
fi
if [ $TOT_O_nbtestKO -gt 0 ]
then cototofai=$ROUGE
else cototofai=$VERT
fi
if [ $TOT_nbtestKO -gt 0 ]
then cototfai=$ROUGE
else cototfai=$VERT
fi


if [ $BLM_O_nbtestOK -eq 0 ]
then coblmopas=$ROUGE
else coblmopas=$VERT
fi
if [ $SYN_O_nbtestOK -eq 0 ]
then cosynopas=$ROUGE
else cosynopas=$VERT
fi
if [ $UTI_O_nbtestOK -eq 0 ]
then coutiopas=$ROUGE
else coutiopas=$VERT
fi
if [ $CID_O_nbtestOK -eq 0 ]
then cocidopas=$ROUGE
else cocidopas=$VERT
fi
if [ $ISF_O_nbtestOK -eq 0 ]
then coisfopas=$ROUGE
else coisfopas=$VERT
fi
if [ $ADM_O_nbtestOK -eq 0 ]
then coadmopas=$ROUGE
else coadmopas=$VERT
fi
if [ $C2B_O_nbtestOK -eq 0 ]
then coc2bopas=$ROUGE
else coc2bopas=$VERT
fi
if [ $MLX_O_nbtestOK -eq 0 ]
then comlxopas=$ROUGE
else comlxopas=$VERT
fi
if [ $QRA_O_nbtestOK -eq 0 ]
then coqraopas=$ROUGE
else coqraopas=$VERT
fi
if [ $FILEMGR_O_nbtestOK -eq 0 ]
then cofilemgropas=$ROUGE
else cofilemgropas=$VERT
fi
if [ $CUS_O_nbtestOK -eq 0 ]
then cocusopas=$ROUGE
else cocusopas=$VERT
fi
if [ $JBS_O_nbtestOK -eq 0 ]
then cojbsopas=$ROUGE
else cojbsopas=$VERT
fi
if [ $CHA_O_nbtestOK -eq 0 ]
then cojbsopas=$ROUGE
else cojbsopas=$VERT
fi
if [ $PLS_O_nbtestOK -eq 0 ]
then coplsopas=$ROUGE
else coplsopas=$VERT
fi
if [ $ETL_O_nbtestOK -eq 0 ]
then coetlopas=$ROUGE
else coetlopas=$VERT
fi
if [ $TOT_O_nbtestOK -eq 0 ]
then cototopas=$ROUGE
else cototopas=$VERT
fi
if [ $TOT_nbtestOK -eq 0 ]
then cototpas=$ROUGE
else cototpas=$VERT
fi


if [ $BLM_O_nbtest -eq 0 ]
then coblmotot=$ROUGE
else coblmotot=$VERT
fi
if [ $SYN_O_nbtest -eq 0 ]
then cosynotot=$ROUGE
else cosynotot=$VERT
fi
if [ $UTI_O_nbtest -eq 0 ]
then coutiotot=$ROUGE
else coutiotot=$VERT
fi
if [ $CID_O_nbtest -eq 0 ]
then cocidotot=$ROUGE
else cocidotot=$VERT
fi
if [ $ISF_O_nbtest -eq 0 ]
then coisfotot=$ROUGE
else coisfotot=$VERT
fi
if [ $ADM_O_nbtest -eq 0 ]
then coadmotot=$ROUGE
else coadmotot=$VERT
fi
if [ $C2B_O_nbtest -eq 0 ]
then coc2botot=$ROUGE
else coc2botot=$VERT
fi
if [ $MLX_O_nbtest -eq 0 ]
then comlxotot=$ROUGE
else comlxotot=$VERT
fi
if [ $QRA_O_nbtest -eq 0 ]
then coqraotot=$ROUGE
else coqraotot=$VERT
fi
if [ $FILEMGR_O_nbtest -eq 0 ]
then cofilemgrotot=$ROUGE
else cofilemgrotot=$VERT
fi
if [ $CUS_O_nbtest -eq 0 ]
then cocusotot=$ROUGE
else cocusotot=$VERT
fi
if [ $JBS_O_nbtest -eq 0 ]
then cojbsotot=$ROUGE
else cojbsotot=$VERT
fi
if [ $CHA_O_nbtest -eq 0 ]
then cojbsotot=$ROUGE
else cojbsotot=$VERT
fi
if [ $PLS_O_nbtest -eq 0 ]
then coplsotot=$ROUGE
else coplsotot=$VERT
fi
if [ $ETL_O_nbtest -eq 0 ]
then coetlotot=$ROUGE
else coetlotot=$VERT
fi
if [ $TOT_O_nbtest -eq 0 ]
then cotototot=$ROUGE
else cotototot=$VERT
fi
if [ $TOT_nbtest -eq 0 ]
then cotottot=$ROUGE
else cotottot=$VERT
fi

sed -e "s/!COBLMOPAS!/$coblmopas/" \
	-e "s/!NBBLMOPAS!/$BLM_O_nbtestOK/" \
	-e "s/!COSYNOPAS!/$cosynopas/" \
	-e "s/!NBSYNOPAS!/$SYN_O_nbtestOK/" \
	-e "s/!COUTIOPAS!/$coutiopas/" \
	-e "s/!NBUTIOPAS!/$UTI_O_nbtestOK/" \
	-e "s/!COCIDOPAS!/$cocidopas/" \
	-e "s/!NBCIDOPAS!/$CID_O_nbtestOK/" \
	-e "s/!COISFOPAS!/$coisfopas/" \
	-e "s/!NBISFOPAS!/$ISF_O_nbtestOK/" \
	-e "s/!COADMOPAS!/$coadmopas/" \
	-e "s/!NBADMOPAS!/$ADM_O_nbtestOK/" \
	-e "s/!COC2BOPAS!/$coc2bopas/" \
	-e "s/!NBC2BOPAS!/$C2B_O_nbtestOK/" \
    -e "s/!COMLXOPAS!/$comlxopas/" \
	-e "s/!NBMLXOPAS!/$MLX_O_nbtestOK/" \
    -e "s/!COQRAOPAS!/$coqraopas/" \
	-e "s/!NBQRAOPAS!/$QRA_O_nbtestOK/" \
	-e "s/!NBFILEMGROPAS!/$FILEMGR_O_nbtestOK/" \
    -e "s/!COFILEMGROPAS!/$cofilemgropas/" \
	-e "s/!NBCUSOPAS!/$CUS_O_nbtestOK/" \
    -e "s/!COCUSOPAS!/$cocusopas/" \
	-e "s/!NBJBSOPAS!/$JBS_O_nbtestOK/" \
    -e "s/!COJBSOPAS!/$cojbsopas/" \
	-e "s/!NBCHAOPAS!/$CHA_O_nbtestOK/" \
    -e "s/!COCHAOPAS!/$cojbsopas/" \
	-e "s/!NBPLSOPAS!/$PLS_O_nbtestOK/" \
    -e "s/!COPLSOPAS!/$coplsopas/" \
	-e "s/!NBETLOPAS!/$ETL_O_nbtestOK/" \
    -e "s/!COETLOPAS!/$coetlopas/" \
	-e "s/!COTOTOPAS!/$cototopas/" \
	-e "s/!NBTOTOPAS!/$TOT_O_nbtestOK/" \
	-e "s/!COTOTPAS!/$cototpas/" \
	-e "s/!NBTOTPAS!/$TOT_nbtestOK/" \
	-e "s/!COBLMOFAI!/$coblmofai/" \
	-e "s/!NBBLMOFAI!/$BLM_O_nbtestKO/" \
	-e "s/!COSYNOFAI!/$cosynofai/" \
	-e "s/!NBSYNOFAI!/$SYN_O_nbtestKO/" \
	-e "s/!COUTIOFAI!/$coutiofai/" \
	-e "s/!NBUTIOFAI!/$UTI_O_nbtestKO/" \
	-e "s/!COCIDOFAI!/$cocidofai/" \
	-e "s/!NBCIDOFAI!/$CID_O_nbtestKO/" \
	-e "s/!COISFOFAI!/$coisfofai/" \
	-e "s/!NBISFOFAI!/$ISF_O_nbtestKO/" \
	-e "s/!COADMOFAI!/$coadmofai/" \
    -e "s/!NBADMOFAI!/$ADM_O_nbtestKO/" \
    -e "s/!COC2BOFAI!/$coc2bofai/" \
    -e "s/!NBC2BOFAI!/$C2B_O_nbtestKO/" \
	-e "s/!COMLXOFAI!/$comlxofai/" \
	-e "s/!NBMLXOFAI!/$MLX_O_nbtestKO/" \
	-e "s/!COQRAOFAI!/$coqraofai/" \
	-e "s/!NBQRAOFAI!/$QRA_O_nbtestKO/" \
	-e "s/!COFILEMGROFAI!/$cofilemgrofai/" \
	-e "s/!NBFILEMGROFAI!/$FILEMGR_O_nbtestKO/" \
	-e "s/!COCUSOFAI!/$cocusofai/" \
	-e "s/!NBCUSOFAI!/$CUS_O_nbtestKO/" \
	-e "s/!COJBSOFAI!/$cojbsofai/" \
	-e "s/!NBJBSOFAI!/$JBS_O_nbtestKO/" \
	-e "s/!COCHAOFAI!/$cojbsofai/" \
	-e "s/!NBCHAOFAI!/$CHA_O_nbtestKO/" \
	-e "s/!COPLSOFAI!/$coplsofai/" \
	-e "s/!NBPLSOFAI!/$PLS_O_nbtestKO/" \
	-e "s/!COETLOFAI!/$coetlofai/" \
	-e "s/!NBETLOFAI!/$ETL_O_nbtestKO/" \
	-e "s/!COSYNOFAI!/$cosynofai/" \
    -e "s/!COTOTOFAI!/$cototofai/" \
    -e "s/!NBTOTOFAI!/$TOT_O_nbtestKO/" \
    -e "s/!COTOTFAI!/$cototfai/" \
    -e "s/!NBTOTFAI!/$TOT_nbtestKO/" \
    -e "s/!COBLMOTOT!/$coblmotot/" \
    -e "s/!NBBLMOTOT!/$BLM_O_nbtest/" \
    -e "s/!COSYNOTOT!/$cosynotot/" \
    -e "s/!NBSYNOTOT!/$SYN_O_nbtest/" \
    -e "s/!COUTIOTOT!/$coutiotot/" \
    -e "s/!NBUTIOTOT!/$UTI_O_nbtest/" \
    -e "s/!COCIDOTOT!/$cocidotot/" \
    -e "s/!NBCIDOTOT!/$CID_O_nbtest/" \
    -e "s/!COISFOTOT!/$coisfotot/" \
    -e "s/!NBISFOTOT!/$ISF_O_nbtest/" \
    -e "s/!COADMOTOT!/$coadmotot/" \
    -e "s/!NBADMOTOT!/$ADM_O_nbtest/" \
    -e "s/!COC2BOTOT!/$coc2botot/" \
    -e "s/!NBC2BOTOT!/$C2B_O_nbtest/" \
    -e "s/!COMLXOTOT!/$comlxotot/" \
    -e "s/!NBMLXOTOT!/$MLX_O_nbtest/" \
    -e "s/!COQRAOTOT!/$coqraotot/" \
    -e "s/!NBQRAOTOT!/$QRA_O_nbtest/" \
    -e "s/!COFILEMGROTOT!/$cofilemgrotot/" \
    -e "s/!NBFILEMGROTOT!/$FILEMGR_O_nbtest/" \
    -e "s/!COCUSOTOT!/$cocusotot/" \
    -e "s/!NBCUSOTOT!/$CUS_O_nbtest/" \
    -e "s/!COJBSOTOT!/$cojbsotot/" \
    -e "s/!NBJBSOTOT!/$JBS_O_nbtest/" \
    -e "s/!COCHAOTOT!/$cojbsotot/" \
    -e "s/!NBCHAOTOT!/$CHA_O_nbtest/" \
    -e "s/!COPLSOTOT!/$coplsotot/" \
    -e "s/!NBPLSOTOT!/$PLS_O_nbtest/" \
    -e "s/!COETLOTOT!/$coetlotot/" \
    -e "s/!NBETLOTOT!/$ETL_O_nbtest/" \
    -e "s/!COTOTOTOT!/$cotototot/" \
    -e "s/!NBTOTOTOT!/$TOT_O_nbtest/" \
    -e "s/!COTOTTOT!/$cotottot/" \
    -e "s/!NBTOTTOT!/$TOT_nbtest/" \
  < $SWFDIR/results.in >> mailhtml.txt

sed -e "s/!COBLMMPAS!/$coblmmpas/" \
	-e "s/!NBBLMMPAS!/$BLM_M_nbtestOK/" \
	-e "s/!COSYNMPAS!/$cosynmpas/" \
	-e "s/!NBSYNMPAS!/$SYN_M_nbtestOK/" \
	-e "s/!COUTIMPAS!/$coutimpas/" \
	-e "s/!NBUTIMPAS!/$UTI_M_nbtestOK/" \
	-e "s/!COCIDMPAS!/$cocidmpas/" \
	-e "s/!NBCIDMPAS!/$CID_M_nbtestOK/" \
	-e "s/!COISFMPAS!/$coisfmpas/" \
	-e "s/!NBISFMPAS!/$ISF_M_nbtestOK/" \
	-e "s/!COADMMPAS!/$coadmmpas/" \
	-e "s/!NBADMMPAS!/$ADM_M_nbtestOK/" \
	-e "s/!COC2BMPAS!/$coc2bmpas/" \
	-e "s/!NBC2BMPAS!/$C2B_M_nbtestOK/" \
    -e "s/!COMLXMPAS!/$comlxmpas/" \
	-e "s/!NBMLXMPAS!/$MLX_M_nbtestOK/" \
    -e "s/!COQRAMPAS!/$coqrampas/" \
	-e "s/!NBQRAMPAS!/$QRA_M_nbtestOK/" \
    -e "s/!COFILEMGRMPAS!/$cofilemgrmpas/" \
	-e "s/!NBFILEMGRMPAS!/$FILEMGR_M_nbtestOK/" \
    -e "s/!COCUSMPAS!/$cocusmpas/" \
	-e "s/!NBCUSMPAS!/$CUS_M_nbtestOK/" \
    -e "s/!COJBSMPAS!/$cojbsmpas/" \
	-e "s/!NBJBSMPAS!/$JBS_M_nbtestOK/" \
    -e "s/!COCHAMPAS!/$cojbsmpas/" \
	-e "s/!NBCHAMPAS!/$CHA_M_nbtestOK/" \
    -e "s/!COPLSMPAS!/$coplsmpas/" \
	-e "s/!NBPLSMPAS!/$PLS_M_nbtestOK/" \
    -e "s/!COETLMPAS!/$coetlmpas/" \
	-e "s/!NBETLMPAS!/$ETL_M_nbtestOK/" \
	-e "s/!COTOTMPAS!/$cototmpas/" \
	-e "s/!NBTOTMPAS!/$TOT_M_nbtestOK/" \
	-e "s/!COBLMMFAI!/$coblmmfai/" \
	-e "s/!NBBLMMFAI!/$BLM_M_nbtestKO/" \
	-e "s/!COSYNMFAI!/$cosynmfai/" \
	-e "s/!NBSYNMFAI!/$SYN_M_nbtestKO/" \
	-e "s/!COUTIMFAI!/$coutimfai/" \
	-e "s/!NBUTIMFAI!/$UTI_M_nbtestKO/" \
	-e "s/!COCIDMFAI!/$cocidmfai/" \
	-e "s/!NBCIDMFAI!/$CID_M_nbtestKO/" \
	-e "s/!COISFMFAI!/$coisfmfai/" \
	-e "s/!NBISFMFAI!/$ISF_M_nbtestKO/" \
	-e "s/!COADMMFAI!/$coadmmfai/" \
    -e "s/!NBADMMFAI!/$ADM_M_nbtestKO/" \
    -e "s/!COC2BMFAI!/$coc2bmfai/" \
    -e "s/!NBC2BMFAI!/$C2B_M_nbtestKO/" \
	-e "s/!COMLXMFAI!/$comlxmfai/" \
	-e "s/!NBMLXMFAI!/$MLX_M_nbtestKO/" \
	-e "s/!COQRAMFAI!/$coqramfai/" \
	-e "s/!NBQRAMFAI!/$QRA_M_nbtestKO/" \
	-e "s/!COFILEMGRMFAI!/$cofilemgrmfai/" \
	-e "s/!NBFILEMGRMFAI!/$FILEMGR_M_nbtestKO/" \
	-e "s/!COCUSMFAI!/$cocusmfai/" \
	-e "s/!NBCUSMFAI!/$CUS_M_nbtestKO/" \
	-e "s/!COJBSMFAI!/$cojbsmfai/" \
	-e "s/!NBJBSMFAI!/$JBS_M_nbtestKO/" \
	-e "s/!COCHAMFAI!/$cojbsmfai/" \
	-e "s/!NBCHAMFAI!/$CHA_M_nbtestKO/" \
	-e "s/!COPLSMFAI!/$coplsmfai/" \
	-e "s/!NBPLSMFAI!/$PLS_M_nbtestKO/" \
	-e "s/!COETLMFAI!/$coetlmfai/" \
	-e "s/!NBETLMFAI!/$ETL_M_nbtestKO/" \
	-e "s/!COSYNMFAI!/$cosynmfai/" \
    -e "s/!COTOTMFAI!/$cototmfai/" \
    -e "s/!NBTOTMFAI!/$TOT_M_nbtestKO/" \
    -e "s/!COBLMMTOT!/$coblmmtot/" \
    -e "s/!NBBLMMTOT!/$BLM_M_nbtest/" \
    -e "s/!COSYNMTOT!/$cosynmtot/" \
    -e "s/!NBSYNMTOT!/$SYN_M_nbtest/" \
    -e "s/!COUTIMTOT!/$coutimtot/" \
    -e "s/!NBUTIMTOT!/$UTI_M_nbtest/" \
    -e "s/!COCIDMTOT!/$cocidmtot/" \
    -e "s/!NBCIDMTOT!/$CID_M_nbtest/" \
    -e "s/!COISFMTOT!/$coisfmtot/" \
    -e "s/!NBISFMTOT!/$ISF_M_nbtest/" \
    -e "s/!COADMMTOT!/$coadmmtot/" \
    -e "s/!NBADMMTOT!/$ADM_M_nbtest/" \
    -e "s/!COC2BMTOT!/$coc2bmtot/" \
    -e "s/!NBC2BMTOT!/$C2B_M_nbtest/" \
    -e "s/!COMLXMTOT!/$comlxmtot/" \
    -e "s/!NBMLXMTOT!/$MLX_M_nbtest/" \
    -e "s/!COQRAMTOT!/$coqramtot/" \
    -e "s/!NBQRAMTOT!/$QRA_M_nbtest/" \
    -e "s/!COFILEMGRMTOT!/$cofilemgrmtot/" \
    -e "s/!NBFILEMGRMTOT!/$FILEMGR_M_nbtest/" \
    -e "s/!COCUSMTOT!/$cocusmtot/" \
    -e "s/!NBCUSMTOT!/$CUS_M_nbtest/" \
    -e "s/!COJBSMTOT!/$cojbsmtot/" \
    -e "s/!NBJBSMTOT!/$JBS_M_nbtest/" \
    -e "s/!COCHAMTOT!/$cojbsmtot/" \
    -e "s/!NBCHAMTOT!/$CHA_M_nbtest/" \
    -e "s/!COPLSMTOT!/$coplsmtot/" \
    -e "s/!NBPLSMTOT!/$PLS_M_nbtest/" \
    -e "s/!COETLMTOT!/$coetlmtot/" \
    -e "s/!NBETLMTOT!/$ETL_M_nbtest/" \
    -e "s/!COTOTMTOT!/$cototmtot/" \
    -e "s/!NBTOTMTOT!/$TOT_M_nbtest/" \
  < mailhtml.txt > mailhtml.txt2
  mv mailhtml.txt2 mailhtml.txt

sed -e "s/!COBLMDPAS!/$coblmdpas/" \
	-e "s/!NBBLMDPAS!/$BLM_D_nbtestOK/" \
	-e "s/!COSYNDPAS!/$cosyndpas/" \
	-e "s/!NBSYNDPAS!/$SYN_D_nbtestOK/" \
	-e "s/!COUTIDPAS!/$coutidpas/" \
	-e "s/!NBUTIDPAS!/$UTI_D_nbtestOK/" \
	-e "s/!COCIDDPAS!/$cociddpas/" \
	-e "s/!NBCIDDPAS!/$CID_D_nbtestOK/" \
	-e "s/!COISFDPAS!/$coisfdpas/" \
	-e "s/!NBISFDPAS!/$ISF_D_nbtestOK/" \
	-e "s/!COADMDPAS!/$coadmdpas/" \
	-e "s/!NBADMDPAS!/$ADM_D_nbtestOK/" \
	-e "s/!COC2BDPAS!/$coc2bdpas/" \
	-e "s/!NBC2BDPAS!/$C2B_D_nbtestOK/" \
    -e "s/!COMLXDPAS!/$comlxdpas/" \
	-e "s/!NBMLXDPAS!/$MLX_D_nbtestOK/" \
    -e "s/!COQRADPAS!/$coqradpas/" \
	-e "s/!NBQRADPAS!/$QRA_D_nbtestOK/" \
    -e "s/!COFILEMGRDPAS!/$cofilemgrdpas/" \
	-e "s/!NBFILEMGRDPAS!/$FILEMGR_D_nbtestOK/" \
    -e "s/!COCUSDPAS!/$cocusdpas/" \
	-e "s/!NBCUSDPAS!/$CUS_D_nbtestOK/" \
    -e "s/!COJBSDPAS!/$cojbsdpas/" \
	-e "s/!NBJBSDPAS!/$JBS_D_nbtestOK/" \
    -e "s/!COCHADPAS!/$cojbsdpas/" \
	-e "s/!NBCHADPAS!/$CHA_D_nbtestOK/" \
    -e "s/!COPLSDPAS!/$coplsdpas/" \
	-e "s/!NBPLSDPAS!/$PLS_D_nbtestOK/" \
    -e "s/!COETLDPAS!/$coetldpas/" \
	-e "s/!NBETLDPAS!/$ETL_D_nbtestOK/" \
	-e "s/!COTOTDPAS!/$cototdpas/" \
	-e "s/!NBTOTDPAS!/$TOT_D_nbtestOK/" \
	-e "s/!COBLMDFAI!/$coblmdfai/" \
	-e "s/!NBBLMDFAI!/$BLM_D_nbtestKO/" \
	-e "s/!COSYNDFAI!/$cosyndfai/" \
	-e "s/!NBSYNDFAI!/$SYN_D_nbtestKO/" \
	-e "s/!COUTIDFAI!/$coutidfai/" \
	-e "s/!NBUTIDFAI!/$UTI_D_nbtestKO/" \
	-e "s/!COCIDDFAI!/$cociddfai/" \
	-e "s/!NBCIDDFAI!/$CID_D_nbtestKO/" \
	-e "s/!COISFDFAI!/$coisfdfai/" \
	-e "s/!NBISFDFAI!/$ISF_D_nbtestKO/" \
	-e "s/!COADMDFAI!/$coadmdfai/" \
    -e "s/!NBADMDFAI!/$ADM_D_nbtestKO/" \
    -e "s/!COC2BDFAI!/$coc2bdfai/" \
    -e "s/!NBC2BDFAI!/$C2B_D_nbtestKO/" \
	-e "s/!COMLXDFAI!/$comlxdfai/" \
	-e "s/!NBMLXDFAI!/$MLX_D_nbtestKO/" \
	-e "s/!COQRADFAI!/$coqradfai/" \
	-e "s/!NBQRADFAI!/$QRA_D_nbtestKO/" \
	-e "s/!COFILEMGRDFAI!/$cofilemgrdfai/" \
	-e "s/!NBFILEMGRDFAI!/$FILEMGR_D_nbtestKO/" \
	-e "s/!COCUSDFAI!/$cocusdfai/" \
	-e "s/!NBCUSDFAI!/$CUS_D_nbtestKO/" \
	-e "s/!COJBSDFAI!/$cojbsdfai/" \
	-e "s/!NBJBSDFAI!/$JBS_D_nbtestKO/" \
	-e "s/!COCHADFAI!/$cojbsdfai/" \
	-e "s/!NBCHADFAI!/$CHA_D_nbtestKO/" \
	-e "s/!COPLSDFAI!/$coplsdfai/" \
	-e "s/!NBPLSDFAI!/$PLS_D_nbtestKO/" \
	-e "s/!COETLDFAI!/$coetldfai/" \
	-e "s/!NBETLDFAI!/$ETL_D_nbtestKO/" \
    -e "s/!COTOTDFAI!/$cototdfai/" \
    -e "s/!NBTOTDFAI!/$TOT_D_nbtestKO/" \
    -e "s/!COBLMDTOT!/$coblmdtot/" \
    -e "s/!NBBLMDTOT!/$BLM_D_nbtest/" \
    -e "s/!COSYNDTOT!/$cosyndtot/" \
    -e "s/!NBSYNDTOT!/$SYN_D_nbtest/" \
    -e "s/!COUTIDTOT!/$coutidtot/" \
    -e "s/!NBUTIDTOT!/$UTI_D_nbtest/" \
    -e "s/!COCIDDTOT!/$cociddtot/" \
    -e "s/!NBCIDDTOT!/$CID_D_nbtest/" \
    -e "s/!COISFDTOT!/$coisfdtot/" \
    -e "s/!NBISFDTOT!/$ISF_D_nbtest/" \
    -e "s/!COADMDTOT!/$coadmdtot/" \
    -e "s/!NBADMDTOT!/$ADM_D_nbtest/" \
    -e "s/!COC2BDTOT!/$coc2bdtot/" \
    -e "s/!NBC2BDTOT!/$C2B_D_nbtest/" \
    -e "s/!COMLXDTOT!/$comlxdtot/" \
    -e "s/!NBMLXDTOT!/$MLX_D_nbtest/" \
    -e "s/!COQRADTOT!/$coqradtot/" \
    -e "s/!NBQRADTOT!/$QRA_D_nbtest/" \
    -e "s/!COFILEMGRDTOT!/$cofilemgrdtot/" \
    -e "s/!NBFILEMGRDTOT!/$FILEMGR_D_nbtest/" \
    -e "s/!COCUSDTOT!/$cocusdtot/" \
    -e "s/!NBCUSDTOT!/$CUS_D_nbtest/" \
    -e "s/!COJBSDTOT!/$cojbsdtot/" \
    -e "s/!NBJBSDTOT!/$JBS_D_nbtest/" \
    -e "s/!COCHADTOT!/$cojbsdtot/" \
    -e "s/!NBCHADTOT!/$CHA_D_nbtest/" \
    -e "s/!COPLSDTOT!/$coplsdtot/" \
    -e "s/!NBPLSDTOT!/$PLS_D_nbtest/" \
    -e "s/!COETLDTOT!/$coetldtot/" \
    -e "s/!NBETLDTOT!/$ETL_D_nbtest/" \
    -e "s/!COTOTDTOT!/$cototdtot/" \
    -e "s/!NBTOTDTOT!/$TOT_D_nbtest/" \
  < mailhtml.txt > mailhtml.txt2
  mv mailhtml.txt2 mailhtml.txt


sed -e "s/!BUILDTYPE!/$BUILDTYPE/" \
	-e "s/!PROJECT!/$project/" \
	-e "s/!NOMDIR!/$nomdir/" \
	-e "s/!LOG!/build_log_$nomdir.txt/" \
	-e "s/!BR!/$BR/" \
	-e "s/!COTITRE!/$COTITRE/" \
	-e "s/!COTITREH!/$COTITREH/" \
	-e "s/!CODON!/$VERT/" \
  < mailhtml.txt > mailhtml.txt2
  mv mailhtml.txt2 mailhtml.txt


  #xterm -geometry 135x60 -bg grey -title "mail for $recip" -e vi mail.txt
  #mail $recip < mailhtml.txt

  cd $SWFDIR
  sh $SWFDIR/build_mail.sh $flog


  cd $NETO_NSHOME/tools
  #rm -f mailhtml.txt changes CR NF firstchs lastchs test.tmp testOK.tmp testKO.tmp
  rm -f changes CR NF firstchs lastchs test.tmp testOK.tmp testKO.tmp
  cd $SWFDIR
}
#*******
diffbuild()
{
  EchoNoCR "Enter first build label : "
  read fb
  EchoNoCR "Enter last build label (<CR>=$label) : "
  read lb
  if [ -z "${lb}" ]
  then lb=$label
  fi
  lastch=`p4 labels |grep $lb|awk -F">" '{print $2}'|awk -F"+" '{print $1}'|awk -F"'" '{print $1}'`
  firstch=`p4 labels |grep $fb|awk -F">" '{print $2}'|awk -F"+" '{print $1}'|awk -F"'" '{print $1}'`
  nbchanges=`expr $lastch - $firstch`
  verylast=`p4 changes | head -1|awk '{print $2}'`
  nbchanges2=`expr $verylast - $lastch`
  nbchanges=`expr $nbchanges + $nbchanges2`
  p4 changes -m $nbchanges //depot/$branchname/... > changes
  p4 labels | grep $fb|awk -F">" '{print $2}' > firstchs
  p4 labels | grep $lb|awk -F">" '{print $2}' > lastchs
  for i in `cat changes|awk '{print $2}'`
  do
        if [ "${i}" -le "${firstch}" ]
        then grep -v $i changes > changes2
                 mv changes2 changes
    fi
        if [ "${i}" -ge "${firstch}" ]
        then grep $i firstchs > /dev/null
         if [ $? = 0 ]
                 then grep -v $i changes > changes2
                      mv changes2 changes
                 fi
    fi
        if [ "${i}" -gt "${lastch}" ]
        then grep $i lastchs > /dev/null
         if [ $? != 0 ]
                 then grep -v $i changes > changes2
                      mv changes2 changes
                 fi
    fi
  done
  echo > diffbuild.txt
  for i in `cat changes | awk '{print $2}'`
  do
    p4 describe -s $i >> diffbuild.txt
	echo >> diffbuild.txt
	echo "-----------------------------------------" >> diffbuild.txt
    echo >> diffbuild.txt
  done
  cd $SWFDIR
}
#*******
cdimage()
{
  sh $SWFDIR/build_cdimage.sh
}
#*******
gravage()
{
  EchoNoCR "Complete path of the directory you want (<CR>=${label}_CDImage) : "
  read repgrav
  if [ -z "${repgrav}" ]
  then repgrav=$cdimages/${label}_CDImage
  fi
  rsh -n $MGRAVEUR $MKCD $repgrav $CDLABEL
}
#*******
wvar()
{
  cd $NETO_NSHOME/tools/$BR
  mv ./buildvar.txt ./buildvarold.txt
  echo "nomtar=$nomtar" > ./buildvar.txt
  echo "demonomtar=$demonomtar" >> ./buildvar.txt
  echo "nomdir=$nomdir" >> ./buildvar.txt
  echo "label=$label" >> ./buildvar.txt
  echo "nbblmtest=$nbblmtest" >> ./buildvar.txt
  echo "nbsyntest=$nbsyntest" >> ./buildvar.txt
  echo "nbcidtest=$nbcidtest" >> ./buildvar.txt
  echo "nbisftest=$nbisftest" >> ./buildvar.txt
  echo "nbadmtest=$nbadmtest" >> ./buildvar.txt
  echo "nbcbutest=$nbcbutest" >> ./buildvar.txt
  echo "nbmlxtest=$nbmlxtest" >> ./buildvar.txt
  echo "nbqratest=$nbqratest" >> ./buildvar.txt
  echo "nbfilemgrtest=$nbfilemgrtest" >> ./buildvar.txt
  echo "nbcustest=$nbcustest" >> ./buildvar.txt
  echo "nbjbstest=$nbjbstest" >> ./buildvar.txt
  echo "nbplstest=$nbplstest" >> ./buildvar.txt
  echo "nbetltest=$nbetltest" >> ./buildvar.txt
  echo "datedeb=$datedeb" >> ./buildvar.txt
  echo "datefin=$datefin" >> ./buildvar.txt
  cd $SWFDIR
}
#*******
rvar()
{
  cd $NETO_NSHOME/tools/$BR
  nomtar=`grep nomtar= ./buildvar.txt|grep -v demonomtar|awk -F"=" '{print $2}'`
  demonomtar=`grep demonomtar= ./buildvar.txt|awk -F"=" '{print $2}'`
  nomdir=`grep nomdir= ./buildvar.txt|tail -1|awk -F"=" '{print $2}'`
  label=`grep label= ./buildvar.txt|awk -F"=" '{print $2}'`
  datedeb=`grep datedeb= ./buildvar.txt|awk -F"=" '{print $2}'`
  datefin=`grep datefin= ./buildvar.txt|awk -F"=" '{print $2}'`
  nbblmtest=`grep nbblmtest= ./buildvar.txt|awk -F"=" '{print $2}'`
  if [ "${nbblmtest}" = "" ] ;then nbblmtest=0 ;fi
  nbsyntest=`grep nbsyntest= ./buildvar.txt|awk -F"=" '{print $2}'`
  if [ "${nbsyntest}" = "" ] ;then nbsyntest=0 ;fi
  nbcidtest=`grep nbcidtest= ./buildvar.txt|awk -F"=" '{print $2}'`
  if [ "${nbcidtest}" = "" ] ;then nbcidtest=0 ;fi
  nbisftest=`grep nbisftest= ./buildvar.txt|awk -F"=" '{print $2}'`
  if [ "${nbisftest}" = "" ] ;then nbisftest=0 ;fi
  nbadmtest=`grep nbadmtest= ./buildvar.txt|awk -F"=" '{print $2}'`
  if [ "${nbadmtest}" = "" ] ;then nbadmtest=0 ;fi
  nbcbutest=`grep nbcbutest= ./buildvar.txt|awk -F"=" '{print $2}'`
  if [ "${nbcbutest}" = "" ] ;then nbcbutest=0 ;fi
  nbmlxtest=`grep nbmlxtest= ./buildvar.txt|awk -F"=" '{print $2}'`
  if [ "${nbmlxtest}" = "" ] ;then nbmlxtest=0 ;fi
  nbqratest=`grep nbqratest= ./buildvar.txt|awk -F"=" '{print $2}'`
  if [ "${nbqratest}" = "" ] ;then nbqratest=0 ;fi
  nbfilemgrtest=`grep nbfilemgrtest= ./buildvar.txt|awk -F"=" '{print $2}'`
  if [ "${nbfilemgrtest}" = "" ] ;then nbfilemgrtest=0 ;fi
  nbcustest=`grep nbcustest= ./buildvar.txt|awk -F"=" '{print $2}'`
  if [ "${nbcustest}" = "" ] ;then nbcustest=0 ;fi
  nbjbstest=`grep nbjbstest= ./buildvar.txt|awk -F"=" '{print $2}'`
  if [ "${nbjbstest}" = "" ] ;then nbjbstest=0 ;fi
  nbplstest=`grep nbplstest= ./buildvar.txt|awk -F"=" '{print $2}'`
  if [ "${nbplstest}" = "" ] ;then nbplstest=0 ;fi
  nbetltest=`grep nbetltest= ./buildvar.txt|awk -F"=" '{print $2}'`
  if [ "${nbetltest}" = "" ] ;then nbetltest=0 ;fi
  export nomtar demonomtar nomdir label nbblmtest nbsyntest nbcidtest nbisftest nbadmtest nbcbutest nbmlxtest nbqratest nbfilemgrtest nmplstest nmetltest

  nomtarold=`grep nomtar= ./buildvarold.txt|grep -v demonomtar|awk -F"=" '{print $2}'`
  demonomtarold=`grep demonomtar= ./buildvarold.txt|awk -F"=" '{print $2}'`
  nomdirold=`grep nomdir= ./buildvarold.txt|tail -1|awk -F"=" '{print $2}'`
  labelold=`grep label= ./buildvarold.txt|awk -F"=" '{print $2}'`
  nbblmtestold=`grep nbblmtest= ./buildvarold.txt|awk -F"=" '{print $2}'`
  if [ "${nbblmtestold}" = "" ] ;then nbblmtestold=0 ;fi
  nbsyntestold=`grep nbsyntest= ./buildvarold.txt|awk -F"=" '{print $2}'`
  if [ "${nbsyntestold}" = "" ] ;then nbsyntestold=0 ;fi
  nbcidtestold=`grep nbcidtest= ./buildvarold.txt|awk -F"=" '{print $2}'`
  if [ "${nbcidtestold}" = "" ] ;then nbcidtestold=0 ;fi
  nbisftestold=`grep nbisftest= ./buildvarold.txt|awk -F"=" '{print $2}'`
  if [ "${nbisftestold}" = "" ] ;then nbisftestold=0 ;fi
  nbadmtestold=`grep nbadmtest= ./buildvarold.txt|awk -F"=" '{print $2}'`
  if [ "${nbadmtestold}" = "" ] ;then nbadmtestold=0 ;fi
  nbcbutestold=`grep nbcbutest= ./buildvarold.txt|awk -F"=" '{print $2}'`
  if [ "${nbcbutestold}" = "" ] ;then nbcbutestold=0 ;fi
  nbmlxtestold=`grep nbmlxtest= ./buildvarold.txt|awk -F"=" '{print $2}'`
  if [ "${nbmlxtestold}" = "" ] ;then nbmlxtestold=0 ;fi
  nbqratestold=`grep nbqratest= ./buildvarold.txt|awk -F"=" '{print $2}'`
  if [ "${nbqratestold}" = "" ] ;then nbqratestold=0 ;fi
  nbfilemgrtestold=`grep nbfilemgrtest= ./buildvarold.txt|awk -F"=" '{print $2}'`
  if [ "${nbfilemgrtestold}" = "" ] ;then nbfilemgrtestold=0 ;fi
  nbcustestold=`grep nbcustest= ./buildvarold.txt|awk -F"=" '{print $2}'`
  if [ "${nbcustestold}" = "" ] ;then nbcustestold=0 ;fi
  nbjbstestold=`grep nbjbstest= ./buildvarold.txt|awk -F"=" '{print $2}'`
  if [ "${nbjbstestold}" = "" ] ;then nbjbstestold=0 ;fi
  nbplstestold=`grep nbplstest= ./buildvarold.txt|awk -F"=" '{print $2}'`
  if [ "${nbplstestold}" = "" ] ;then nbplstestold=0 ;fi
  nbetltestold=`grep nbetltest= ./buildvarold.txt|awk -F"=" '{print $2}'`
  if [ "${nbetltestold}" = "" ] ;then nbetltestold=0 ;fi
  export nomtarold demonomtarold nomdirold labelold nbblmtestold nbsyntestold nbisftestold nbcidtestold nbadmtestold nbcbutestold nbmlxtestold nbqratestold nbfilemgrtestold nbcustestold nbjbstestold nbplstestold nbetltestold datedeb datefin
  cd $SWFDIR
}
#*******
savoutput()
{
  cd $BUILD_ROOTDIR
  if [ -d output ]
  then mv output output.old
  fi
}
#*******
diffoutput()
{
  cd $BUILD_ROOTDIR
  diff -qr output.old output > $NETO_TMP/diff.$$
  grep "Only in output.old" $NETO_TMP/diff.$$ > $NETO_TMP/diff_old.$$
  grep -v "Only in output.old" $NETO_TMP/diff.$$ > $NETO_TMP/diff2.$$
  mv $NETO_TMP/diff2.$$ $NETO_TMP/diff.$$
  grep "Only in output" $NETO_TMP/diff.$$ > $NETO_TMP/diff_new.$$
  echo "Subject: [SwF/Daily] diff sur output pour la build $label" > $NETO_TMP/mailsvan.$$
  echo "From: software Factory <Software.Factory@netonomy.com>" >> $NETO_TMP/mailsvan.$$
  echo "To: stephane.vanlierde@netonomy.com" >> $NETO_TMP/mailsvan.$$
  echo "Reply-To: swf@netonomy.com" >> $NETO_TMP/mailsvan.$$
  echo "Fichiers ajoutes :" >> $NETO_TMP/mailsvan.$$
  echo "======================================" >> $NETO_TMP/mailsvan.$$
  echo >> $NETO_TMP/mailsvan.$$
  cat $NETO_TMP/diff_new.$$ >> $NETO_TMP/mailsvan.$$
  echo >> $NETO_TMP/mailsvan.$$
  echo >> $NETO_TMP/mailsvan.$$
  echo >> $NETO_TMP/mailsvan.$$
  echo "Fichiers supprimes :" >> $NETO_TMP/mailsvan.$$
  echo "======================================" >> $NETO_TMP/mailsvan.$$
  echo >> $NETO_TMP/mailsvan.$$
  cat $NETO_TMP/diff_old.$$ >> $NETO_TMP/mailsvan.$$
  mail $RECIPTEST < $NETO_TMP/mailsvan.$$

  rm -rf output.old $NETO_TMP/diff.$$ $NETO_TMP/mailsvan.$$ $NETO_TMP/diff_new.$$ $NETO_TMP/diff_old.$$

}
#*******
duree()
{
  datedeb=`date --date="$datedeb" +%s`
  datefin=`date --date="$datefin" +%s`
  duree=`expr $datefin - $datedeb`
  h=`expr $duree / 3600`
  reste=`expr $duree % 3600`
  m=`expr $reste / 60`
  s=`expr $reste % 60`
  if [ $h -eq 0 ]
  then Duree="$m minutes $s secondes"
  else Duree="$h heures $m minutes $s secondes"
  fi
}
#*******
build()
{
  ts
  build_t0=$ts_s

  cd $SWFDIR
  touch $NETO_NSHOME/.build
  chooselabel
  if [ -z "${netodate}" ]
  then llabel
  fi
  datedeb=`date`
  slogmake
  savenv
  #savoutput
  getlabel

  ts
  build_main_t0=$ts_s

  build_clean
  build_all
  build_deploy
  build_test
  findnbtest
  wvar
#  mail_test
  build_setup
#  diffoutput

  ts
  echo "BUILDMEASURE BUILD.MAIN.TIME" `expr $ts_s - $build_main_t0` >> $NETO_LOGS/$log

#  mklabelsuccess
#  mklabelstarteam

  ts
  echo "BUILDMEASURE BUILD.TIME" `expr $ts_s - $build_t0` >> $NETO_LOGS/$log
  rm -f $NETO_NSHOME/.build
  datefin=`date`
  wvar
if [ "${OPTION}" = "auto" ]
then exit
fi
}
#*******
versioning()
{
  ts
  build_t0=$ts_s

  cd $SWFDIR
  touch $NETO_NSHOME/.build
  chooselabel
  if [ -z "${netodate}" ]
  then llabel
  fi
  datedeb=`date`
  slogmake
  savenv
  #savoutput
  getlabel

  ts
  build_main_t0=$ts_s

  build_clean
  build_all
  build_deploy
#  build_test
#  findnbtest
  wvar
#  mail_test
  build_setup
#  diffoutput

  ts
  echo "BUILDMEASURE BUILD.MAIN.TIME" `expr $ts_s - $build_main_t0` >> $NETO_LOGS/$log

#  mklabelsuccess
#  mklabelstarteam

  ts
  echo "BUILDMEASURE BUILD.TIME" `expr $ts_s - $build_t0` >> $NETO_LOGS/$log
  rm -f $NETO_NSHOME/.build
  datefin=`date`
  wvar
if [ "${OPTION}" = "auto" ]
then exit
fi
}
#*******
mklabelsuccess()
{
  cd $SWFDIR
  rvar
  p4 labelsync -l BUILDCONESUCCESS 2> /dev/null
  p4 label -o BUILDCONESUCCESS > label.$$
  clval=`p4 label -o $label |grep "Created by nsuser." |awk -F">" '{print $2}'`
  echo "label=$label"
  cl=" Created by nsuser. -->$label ($clval)"
ed -s label.$$ <<!ENDEDIT! > /dev/null
/Created
/Created
d
i
$cl
.
w
q
!ENDEDIT!
  p4 label -i < label.$$
  rm -f label.$$
}
#*******
mklabelstarteam()
{
  $JAVABIN/java  -cp $STARTEAM/WEB-INF/classes:$STARTEAM/WEB-INF/lib/starteam-sdk.jar starteam.GetCRList newlabel Core $label " "
}
#*******
savenv()
{
  echo "################# BUILD ENV ###############" >> $NETO_LOGS/$log
  env >> $NETO_LOGS/$log
  echo "################# BUILD ENV ###############" >> $NETO_LOGS/$log
}
#*******
findnbtest()
{
 cd $NETO_NSHOME/tools
 flog=$NETO_LOGS/$log
 grep JUNIT $flog|grep CORE |grep RESULT > testblm.tmp
 grep JUNIT $flog|grep SYNCHRONIZER |grep RESULT > testsyn.tmp
 grep JUNIT $flog|grep CID |grep -v CID2CBULOADER |grep RESULT > testcid.tmp
 grep JUNIT $flog|grep ISF |grep RESULT > testisf.tmp
 grep JUNIT $flog|grep ADMIN |grep RESULT > testadm.tmp
 grep JUNIT $flog|grep CID2CBULOADER |grep RESULT > testcbu.tmp
 grep JUNIT $flog|grep MLX |grep RESULT > testmlx.tmp
 grep JUNIT $flog|grep QRA |grep RESULT > testqra.tmp
 grep JUNIT $flog|grep FILEMGR |grep RESULT > testfilemgr.tmp
 grep JUNIT $flog|grep CUS |grep RESULT > testcus.tmp
 grep JUNIT $flog|grep JBS |grep RESULT > testjbs.tmp
 grep JUNIT $flog|grep CHA |grep RESULT > testjbs.tmp
 grep JUNIT $flog|grep PLS |grep RESULT > testpls.tmp
 grep JUNIT $flog|grep ETL |grep RESULT > testetl.tmp
 nbblmtest=`wc testblm.tmp|awk '{print $1}'`
 nbcidtest=`wc testcid.tmp|awk '{print $1}'`
 nbsyntest=`wc testsyn.tmp|awk '{print $1}'`
 nbisftest=`wc testisf.tmp|awk '{print $1}'`
 nbadmtest=`wc testadm.tmp|awk '{print $1}'`
 nbcbutest=`wc testcbu.tmp|awk '{print $1}'`
 nbmlxtest=`wc testmlx.tmp|awk '{print $1}'`
 nbqratest=`wc testqra.tmp|awk '{print $1}'`
 nbfilemgrtest=`wc testfilemgr.tmp|awk '{print $1}'`
 nbcustest=`wc testcus.tmp|awk '{print $1}'`
 nbjbstest=`wc testjbs.tmp|awk '{print $1}'`
 nbplstest=`wc testpls.tmp|awk '{print $1}'`
 nbetltest=`wc testetl.tmp|awk '{print $1}'`
 rm -f testblm.tmp testcid.tmp testsyn.tmp testisf.tmp testadm.tmp testcbu.tmp testmlx.tmp testqra.tmp testfilemgr.tmp testcus.tmp testjbs.tmp testpls.tmp testetl.tmp
}
#*******
mail_test()
{
 flog=$log.txt
 rvar
 if [ $nbblmtest -lt $nbblmtestold ]
 then mailblm="WARNING : only $nbblmtest CORE tests performed for build $label. There were $nbblmtestold performed for build $labelold."
 fi
 if [ $nbsyntest -lt $nbsyntestold ]
 then mailsyn="WARNING : only $nbsyntest SYNCHRONIZER tests performed for build $label. There were $nbsyntestold performed for build $labelold."
 fi
 if [ $nbcidtest -lt $nbcidtestold ]
 then mailcid="WARNING : only $nbcidtest CID tests performed for build $label. There were $nbcidtestold performed for build $labelold."
 fi
 if [ $nbisftest -lt $nbisftestold ]
 then mailisf="WARNING : only $nbisftest ISF tests performed for build $label. There were $nbisftestold performed for build $labelold."
 fi
 if [ $nbadmtest -lt $nbadmtestold ]
 then mailadm="WARNING : only $nbadmtest ADMIN tests performed for build $label. There were $nbadmtestold performed for build $labelold."
 fi
 if [ $nbcbutest -lt $nbcbutestold ]
 then mailcbu="WARNING : only $nbcbutest CID2CBULOADER tests performed for build $label. There were $nbcbutestold performed for build $labelold."
 fi
 if [ $nbmlxtest -lt $nbmlxtestold ]
 then mailmlx="WARNING : only $nbmlxtest MLX tests performed for build $label. There were $nbmlxtestold performed for build $labelold."
 fi
 if [ $nbqratest -lt $nbqratestold ]
 then mailqra="WARNING : only $nbqratest QRA tests performed for build $label. There were $nbqratestold performed for build $labelold."
 fi
 if [ $nbfilemgrtest -lt $nbfilemgrtestold ]
 then mailfilemgr="WARNING : only $nbfilemgrtest FILEMGR tests performed for build $label. There were $nbfilemgrtestold performed for build $labelold."
 fi
 if [ $nbcustest -lt $nbcustestold ]
 then mailcus="WARNING : only $nbcustest CUSTDIMLOADER tests performed for build $label. There were $nbcustestold performed for build $labelold."
 fi
 if [ $nbjbstest -lt $nbjbstestold ]
 then mailjbs="WARNING : only $nbjbstest JOBSERVICE tests performed for build $label. There were $nbjbstestold performed for build $labelold."
 fi
 if [ $nbplstest -lt $nbplstestold ]
 then mailpls="WARNING : only $nbplstest PLSTUDIO tests performed for build $label. There were $nbplstestold performed for build $labelold."
 fi
 if [ $nbetltest -lt $nbetltestold ]
 then mailetl="WARNING : only $nbetltest ETL tests performed for build $label. There were $nbetltestold performed for build $labelold."
 fi
 if [ $nbsyntest -lt $nbsyntestold ]
 then mailsyn="WARNING : only $nbsyntest SYN tests performed for build $label. There were $nbsyntestold performed for build $labelold."
 fi
 if [ "${mailblm}" != "" -o "${mailsyn}" != "" -o "${mailisf}" != "" -o "${mailcid}" != "" -o "${mailadm}" != "" -o "${mailcbu}" != "" -o "${mailmlx}" != ""  -o "${mailqra}" != "" -o "${mailfilemgr}" != "" -o "${mailcus}" != "" -o "${mailjbs}" != "" -o "${mailpls}" != "" -o "${mailetl}" != "" ]
 then sed -e "s/!LABEL!/$label/" \
		  -e "s/!RECIP!/$RECIPDEV/" \
		  -e "s/!OLDLABEL!/$labelold/" \
       < $SWFDIR/mailtest.in > $NETO_NSHOME/tools/mailtest.txt
	  echo $mailblm >> $NETO_NSHOME/tools/mailtest.txt
	  echo $mailsyn >> $NETO_NSHOME/tools/mailtest.txt
	  echo $mailisf >> $NETO_NSHOME/tools/mailtest.txt
	  echo $mailcid >> $NETO_NSHOME/tools/mailtest.txt
	  echo $mailadm >> $NETO_NSHOME/tools/mailtest.txt
	  echo $mailcbu >> $NETO_NSHOME/tools/mailtest.txt
	  echo $mailmlx >> $NETO_NSHOME/tools/mailtest.txt
	  echo $mailqra >> $NETO_NSHOME/tools/mailtest.txt
	  echo $mailfilemgr >> $NETO_NSHOME/tools/mailtest.txt
	  echo $mailcus >> $NETO_NSHOME/tools/mailtest.txt
	  echo $mailjbs >> $NETO_NSHOME/tools/mailtest.txt
	  echo $mailpls >> $NETO_NSHOME/tools/mailtest.txt
	  echo $mailetl >> $NETO_NSHOME/tools/mailtest.txt
	  echo >> $NETO_NSHOME/tools/mailtest.txt
	  echo "See the log file here : ftp://spip/tmplogs/$flog" >> $NETO_NSHOME/tools/mailtest.txt
	  cp $NETO_LOGS/$log $NETO_TARS/../../tmplogs/$flog
	  mail $RECIPDEV < $NETO_NSHOME/tools/mailtest.txt
	  rm $NETO_NSHOME/tools/mailtest.txt
 fi
}
#*******
makelabel()
{
  echo
  cd $SWFDIR
  p4 sync $SWFDIR/labelvar.txt
  p4 edit $SWFDIR/labelvar.txt
  p4 sync $BUILD_ROOTDIR/config/version.properties
  p4 edit $BUILD_ROOTDIR/config/version.properties
  p4 sync $BUILD_ROOTDIR/cd-image/Contents.html.in
  p4 sync $BUILD_ROOTDIR/cd-image/Contents.html
  p4 edit $BUILD_ROOTDIR/cd-image/Contents.html
  p4 sync $SWFDIR/p4specif.in
#  buildn=`head -2 labelvar.txt|tail -1`
 sed -e "s/!P4CLIENT!/$P4CLIENT/" \
     -e "s/!BRANCHNAME!/$sbranchname/" \
     -e "s/!SWFBRANCHNAME!/$sswfbranchname/" \
	< $SWFDIR/p4specif.in > $SWFDIR/p4specif.$$
  clnum=`p4 change -i < $SWFDIR/p4specif.$$|awk '{print $2}'`
  buildn=$clnum
  version=`head -3 labelvar.txt|tail -1`
  major=`head -4 labelvar.txt|tail -1`
  minor=`head -5 labelvar.txt|tail -1`
  micro=`head -6 labelvar.txt|tail -1`
  completeversion=`head -7 labelvar.txt|tail -1`
  label=`head -8 labelvar.txt|tail -1`
  demolabel=`head -9 labelvar.txt|tail -1`
  export label
  pversion=`head -10 labelvar.txt|tail -1`
  pname=`head -11 labelvar.txt|tail -1`
  echo
  echo "Project name is $PROJECT"
  echo
  EchoNoCR "Enter build number (CR=<$buildn>) : "
  read rbuildn
  if [ "${rbuildn}" != "" ]
  then buildn=$rbuildn
  fi
  label="$PROJECT-${pversion}-$buildn"
  demolabel="$DEMOPROJECT-${pversion}-$buildn"
  export label demolabel

 p4 change -o $clnum > $SWFDIR/p4specif2.$$
 sed -e "s/!LABEL!/$label/" \
	< $SWFDIR/p4specif2.$$ > $SWFDIR/p4specif3.$$
 mv $SWFDIR/p4specif3.$$ $SWFDIR/p4specif.$$
 p4 change -i < $SWFDIR/p4specif.$$

  echo
  EchoNoCR "Enter version (major.minor.micro) (CR=<$version>) : "
  read rversion
  EchoNoCR "Enter packages name (CR=<$pname>) : "
  read rpname
  if [ "${rpname}" != "" ]
  then pname=$rpname
  fi
  EchoNoCR "Enter product version (CR=<$pversion>) : "
  read rpversion
  if [ "${rpversion}" = "0" ]
  then pversion=$label
  else if [ "${rpversion}" != "" ]
	   then pversion=$rpversion
                label="$PROJECT-${pversion}-$buildn"
	   fi
  fi

  if [ "${rversion}" = "0" ]
  then major=""
       minor=""
       micro=""
	   version=""
  	   completeversion="$label.$buildn"
  else if [ "${rversion}" != "" ]
	   then version=$rversion
	   fi
	   major=`echo $version | awk -F. '{print $1}'`
       minor=`echo $version | awk -F. '{print $2}'`
       micro=`echo $version | awk -F. '{print $3}'`
  	   completeversion="$version.$buildn"
  fi
  echo
  cd $BUILD_ROOTDIR/config
  rm -f $BUILD_ROOTDIR/config/version.properties
  llabel
  echo
  echo "*****************************"
  echo "ProducName=$NETO_PRODUCTNAME"
  echo "ProductVersion=$pversion"
  echo "PackagesName=$pname"
  echo "CompleteVersion=$completeversion"
  echo "DATE=$netodate"
  echo "*****************************"
  echo
  LANG=us_US
  export LANG
  datehtm=`date '+ %B %e %Y'`
  LANG=fr_FR
  export LANG
  sed -e "s/!PN!/$NETO_PRODUCTNAME/" \
      -e "s/!SN!/$SUITENAME/" \
      -e "s/!PV!/$pversion/" \
      -e "s/!PAN!/$pname/" \
      -e "s/!MAJOR!/$major/" \
      -e "s/!MINOR!/$minor/" \
      -e "s/!MICRO!/$micro/" \
      -e "s/!BUILD!/$buildn/" \
      -e "s/!DATE!/$netodate/"\
      -e "s/!PDATE!/$datehtm/"\
      < $SWFDIR/version.properties.in > version.properties
  cd $BUILD_ROOTDIR/3rd-party
  cd $BUILD_ROOTDIR/cd-image
  sed -e "s/@ProductName@/$NETO_PRODUCTNAME/" \
      -e "s/@ProductVersion@/$pversion/" \
      -e "s/@ProductMajorVersion@/$major/" \
      -e "s/@ProductMinorVersion@/$minor/" \
      -e "s/@ProductMicroVersion@/$micro/" \
      -e "s/@ProductBuildNumber@/$buildn/" \
      -e "s/@ProductBuildDate@/$netodate/"\
      -e "s/@Date@/$datehtm/"\
      -e "s/@SuiteName@/$SUITENAME/"\
      < Contents.html.in > Contents.html
  cd $SWFDIR
  echo $PROJECT > labelvar.txt
  echo $buildn >> labelvar.txt
  echo $version >> labelvar.txt
  echo $major >> labelvar.txt
  echo $minor >> labelvar.txt
  echo $micro >> labelvar.txt
  echo $completeversion >> labelvar.txt
  echo $label >> labelvar.txt
  echo $demolabel >> labelvar.txt
  echo $pversion >> labelvar.txt
  echo $pname >> labelvar.txt
  echo $netodate >> labelvar.txt

  p4 labels|grep -v M5|grep -v M6|awk '{print $2}' > $NETO_TMP/labelexist.$$
  grep -w $label $NETO_TMP/labelexist.$$
  if [ $? != 0 ]
  then NEW=1
	   EchoNoCR "Enter changelist level or LAST or NUTCONESUCCESS (CR=<LAST>) : "
       read changelist
       if [ "${changelist}" != "0" ]
       then if [ "${changelist}" = "last" -o "${changelist}" = "LAST" -o "${changelist}" = "" ]
			then changelist=`p4 changes //depot/$branchname/... |sort -rn -k 2,2 |head -1|awk '{print $2}'`
			fi

            if [ "${changelist}" = "NUTCONESUCCESS" ]
			then changelist=`p4 label -o NUTCONESUCCESS | grep "\-\->" | awk -F">" '{print $2}'`
			fi
			p4 sync //depot/$branchname/...@$changelist
			p4 sync //depot/$branchname/setup/...
			p4 sync //depot/$branchname/../swf/platform/...
			p4 sync //depot/$branchname/documentation/...
			p4 sync //depot/$branchname/cd-image/...
            totlist=" -->$changelist"
       else totlist=""
       fi
  else NEW=0
	   totlist=""
	   p4 sync //depot/$branchname/...@$label
  fi
  while true
  do
	echo
    EchoNoCR "Enter additional changelist : "
    read changelist
    if [ "${changelist}" = "" ]
    then break
    fi
    p4 sync //depot/$branchname/...@$changelist,$changelist
    totlist="$totlist + $changelist"
  done
  if [ $NEW = 0 ]
  then Unlock
  fi
  LANG=us_US
  export LANG
  datehtm=`date '+ %B %e %Y'`
  LANG=fr_FR
  export LANG
  p4 label -o -t $labeltemplate $label > $NETO_TMP/label.$$
ed -s $NETO_TMP/label.$$ <<!ENDEDIT! > /dev/null
/Created
a
$totlist
.
/Created
.,+1j
w
q
!ENDEDIT!
  p4 label -i < $NETO_TMP/label.$$
  rm $NETO_TMP/label.$$

  p4 submit -c $clnum
  p4 labelsync -l $label
  Lock
  rm -f $SWFDIR/p4specif.$$ $SWFDIR/p4specif2.$$ $NETO_TMP/labelexist.$$
  cd $SWFDIR
}
#*******
Lock()
{
  p4 label -o $label > $NETO_TMP/llabel.$$
  sed -e "13,$ s|unlocked|locked|" < $NETO_TMP/llabel.$$ > $NETO_TMP/llabel2.$$
  p4 label -i < $NETO_TMP/llabel2.$$
  rm $NETO_TMP/llabel.$$ $NETO_TMP/llabel2.$$
}
#*******
Unlock()
{
  p4 label -o $label > $NETO_TMP/llabel.$$
  sed -e "13,$ s|locked|unlocked|" < $NETO_TMP/llabel.$$ > $NETO_TMP/llabel2.$$
  p4 label -i < $NETO_TMP/llabel2.$$
  rm $NETO_TMP/llabel.$$ $NETO_TMP/llabel2.$$
}
#*******
chooselabel()
{
  maxlabel=1
#  p4 labels |grep $PROJECT|grep -v M5|grep -v M6|grep -v RA|grep -v labeltemplate|grep -v BUILDCONESUCCESS| grep -v "[0-9]\-"| grep -v "[0-9]\_"| sort -n -t"-" -k 3,3 |tail -10 > $NETO_TMP/listlabelline.$$
  p4 labels |grep ${PROJECT}-3.7.|grep -v 3.5.15|grep -v Mstar|grep -v labeltemplate|grep -v BUILDCONESUCCESS| sort -n -t"-" -k 8,8 |tail -10 > $NETO_TMP/listlabelline.$$
  cat $NETO_TMP/listlabelline.$$ | awk '{print $2}' > $NETO_TMP/listlabel.$$
  i=`wc $NETO_TMP/listlabelline.$$ | awk '{print $1}'`
  while [ $i -ne 0 ]
  do
    line=`head -1 $NETO_TMP/listlabelline.$$`
    i=`expr $i - 1`
    tail -$i $NETO_TMP/listlabelline.$$ > $NETO_TMP/listlabelline2.$$
    mv $NETO_TMP/listlabelline2.$$ $NETO_TMP/listlabelline.$$
    echo "     ($maxlabel) $line"
    maxlabel=`expr $maxlabel + 1`
  done

  while true
  do
    EchoNoCR "Enter your choice : "
    read numlabel
    if [ $numlabel -ge 1 -a $numlabel -lt $maxlabel ]
    then break
    else echo;echo ">>>>>>>>>> BAD CHOICE <<<<<<<<<<";echo
    fi
  done
  j=1
  for i in `cat $NETO_TMP/listlabel.$$`
  do
    if [ $j -eq $numlabel ]
    then label=$i
		 export label
         break
    fi
    j=`expr $j + 1`
  done
  rm -rf $NETO_TMP/listlabel.$$ $NETO_TMP/listlabelline.$$ $NETO_TMP/listlabelline2.$$
}
#*******
getlabel()
{
  EchoNoCR "Extract label $label... "
  echo "Extract label $label" >> $NETO_LOGS/$log
  p4 sync @$label >> $NETO_LOGS/$log 2>&1
  echo "OK."
  cd $SWFDIR
  buildn=`head -2 labelvar.txt|tail -1`
  version=`head -3 labelvar.txt|tail -1`
  major=`head -4 labelvar.txt|tail -1`
  minor=`head -5 labelvar.txt|tail -1`
  micro=`head -6 labelvar.txt|tail -1`
  completeversion=`head -7 labelvar.txt|tail -1`
  label=`head -8 labelvar.txt|tail -1`
  demolabel=`head -9 labelvar.txt|tail -1`
  export label demolabel
  pversion=`head -10 labelvar.txt|tail -1`
  pname=`head -11 labelvar.txt|tail -1`
}
#*******
sortir()
{
  p4 revert $SWFDIR/labelvar.txt 2>/dev/null
  p4 revert $BUILD_ROOTDIR/config/version.properties 2>/dev/null
  p4 revert $BUILD_ROOTDIR/platform/cd-image/Contents.html 2>/dev/null
  p4 revert $BUILD_ROOTDIR/platform/3rd-party/license/Copyright.html 2>/dev/null
  rm -f $NETO_NSHOME/.build
  rm -f /tmp/dbcreate_db2
  exit 0
}
#*******
banner()
{
  echo "*******************************************************************************"
  echo "*                                                                             *"
  echo "*                          N E T O N O B U I L D                              *"
  echo "*                                                                             *"
  echo "*******************************************************************************"
  echo
  echo
}
#*******
p4clear()
{
  echo
  EchoNoCR "Nettoyage de l'arborescence... "
  sh clear.sh
  EchoNoCR "OK."
  echo
}
#*******
menu()
{
while true
do
  choix="0"
echo "choix=$choix"
  echo
  echo "P4CLIENT is $P4CLIENT"
  echo
  echo "                  (1) make or modify label"
  echo "                  (2) build"
  echo "                  (3) mail"
  echo "                  (4) cdimage"
  echo "                  (5) versioning only"
  echo "                  (6) burn cd"
  echo "                  (7) clear p4 tree"
  echo "                  (8) Generate Javadoc"
  echo "                  (9) Generate ISF Javadoc"
  echo "                  (0) sortir"
  echo
  EchoNoCR "Your choice : "
  read choix
echo "Your choice is [$choix]"
  [ ! -z "${choix}" ] && break
done
# debug
}
##################### M A I N ########################
buildenv
GetEcho
banner
while true
do
  menu
  case $choix in
    0) sortir;;
    1) makelabel;;
    2) build;;
    3) rvar
       mailcore;;
    4) rvar
       cdimage;;
    5) versioning;;
    6) rvar
       gravage;;
    7) p4clear;;
    8) rvar
       javadoc;;
    9) rvar
       isfjavadoc;;
    *) echo
       echo ">>>>> BAD CHOICE <<<<<"
       echo;;
  esac
done
