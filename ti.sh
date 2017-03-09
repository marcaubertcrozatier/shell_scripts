echo "Time : "
read Time
time=`expr $Time / 60`
restime=`expr $Time % 60`
echo "$Time / 60 = $time + $restime"
