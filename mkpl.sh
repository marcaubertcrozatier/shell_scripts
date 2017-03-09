#!/bin/sh
#
# Menage sur OCM continuous
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/artifacts/ccbs_ocm_continuous ]
then cd /home/nsuser/cruisecontrol/ccbs/artifacts/ccbs_ocm_continuous
     nb=`ls | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	  rm -rf `ls |sort| head -$troplein`
     fi
fi


# Menage sur log OCM continuous
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/logs/ccbs_ocm_continuous ]
then cd /home/nsuser/cruisecontrol/ccbs/logs/ccbs_ocm_continuous
     nb=`ls log*.xml | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	 rm -rf `ls log*.xml|sort| head -$troplein`
     fi
fi


# Menage sur cache log OCM continuous
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/logs/ccbs_ocm_continuous/_cache ]
then cd /home/nsuser/cruisecontrol/ccbs/logs/ccbs_ocm_continuous/_cache
     nb=`ls log*.html | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	 rm -rf `ls log*.html|sort| head -$troplein`
     fi
fi

#############################################################

# Menage sur B2C daily
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/artifacts/ccbs_b2c_daily ]
then cd /home/nsuser/cruisecontrol/ccbs/artifacts/ccbs_b2c_daily
     nb=`ls | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	  rm -rf `ls |sort| head -$troplein`
     fi
fi


# Menage sur log B2C daily
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/logs/ccbs_b2c_daily ]
then cd /home/nsuser/cruisecontrol/ccbs/logs/ccbs_b2c_daily
     nb=`ls log*.xml | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	 rm -rf `ls log*.xml|sort| head -$troplein`
     fi
fi


# Menage sur cache log B2C daily
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/logs/ccbs_b2c_daily/_cache ]
then cd /home/nsuser/cruisecontrol/ccbs/logs/ccbs_b2c_daily/_cache
     nb=`ls log*.html | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	 rm -rf `ls log*.html|sort| head -$troplein`
     fi
fi

###################################################################

# Menage sur B2C continuous
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/artifacts/ccbs_b2c_continuous ]
then cd /home/nsuser/cruisecontrol/ccbs/artifacts/ccbs_b2c_continuous
     nb=`ls | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	  rm -rf `ls |sort| head -$troplein`
     fi
fi


# Menage sur log B2C continuous
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/logs/ccbs_b2c_continuous ]
then cd /home/nsuser/cruisecontrol/ccbs/logs/ccbs_b2c_continuous
     nb=`ls log*.xml | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	 rm -rf `ls log*.xml|sort| head -$troplein`
     fi
fi


# Menage sur cache log B2C continuous
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/logs/ccbs_b2c_continuous/_cache ]
then cd /home/nsuser/cruisecontrol/ccbs/logs/ccbs_b2c_continuous/_cache
     nb=`ls log*.html | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	 rm -rf `ls log*.html|sort| head -$troplein`
     fi
fi

###################################################################

# Menage sur IK daily
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/artifacts/ccbs_ik_daily ]
then cd /home/nsuser/cruisecontrol/ccbs/artifacts/ccbs_ik_daily
     nb=`ls | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	  rm -rf `ls |sort| head -$troplein`
     fi
fi


# Menage sur log IK continuous
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/logs/ccbs_ik_daily ]
then cd /home/nsuser/cruisecontrol/ccbs/logs/ccbs_ik_daily
     nb=`ls log*.xml | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	 rm -rf `ls log*.xml|sort| head -$troplein`
     fi
fi


# Menage sur cache log IK continuous
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/logs/ccbs_ik_daily/_cache ]
then cd /home/nsuser/cruisecontrol/ccbs/logs/ccbs_ik_daily/_cache
     nb=`ls log*.html | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	 rm -rf `ls log*.html|sort| head -$troplein`
     fi
fi

###################################################################

# Menage sur IK continuous
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/artifacts/ccbs_ik_continuous ]
then cd /home/nsuser/cruisecontrol/ccbs/artifacts/ccbs_ik_continuous
     nb=`ls | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	  rm -rf `ls |sort| head -$troplein`
     fi
fi


# Menage sur log IK continuous
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/logs/ccbs_ik_continuous ]
then cd /home/nsuser/cruisecontrol/ccbs/logs/ccbs_ik_continuous
     nb=`ls log*.xml | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	 rm -rf `ls log*.xml|sort| head -$troplein`
     fi
fi


# Menage sur cache log IK continuous
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/logs/ccbs_ik_continuous/_cache ]
then cd /home/nsuser/cruisecontrol/ccbs/logs/ccbs_ik_continuous/_cache
     nb=`ls log*.html | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	 rm -rf `ls log*.html|sort| head -$troplein`
     fi
fi

###################################################################

# Menage sur Platform continuous
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/artifacts/ccbs_platform_continuous ]
then cd /home/nsuser/cruisecontrol/ccbs/artifacts/ccbs_platform_continuous
     nb=`ls | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	  rm -rf `ls |sort| head -$troplein`
     fi
fi


# Menage sur log Platform continuous
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/logs/ccbs_platform_continuous ]
then cd /home/nsuser/cruisecontrol/ccbs/logs/ccbs_platform_continuous
     nb=`ls log*.xml | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	 rm -rf `ls log*.xml|sort| head -$troplein`
     fi
fi


# Menage sur cache log Platform continuous
MAX=4
if [ -d /home/nsuser/cruisecontrol/ccbs/logs/ccbs_platform_continuous/_cache ]
then cd /home/nsuser/cruisecontrol/ccbs/logs/ccbs_platform_continuous/_cache
     nb=`ls log*.html | wc | awk '{print $1}'`
     if [ $nb -gt $MAX ]
     then troplein=`expr $nb - $MAX`
	 rm -rf `ls log*.html|sort| head -$troplein`
     fi
fi

###################################################################

