while true
do
f_year=1900
s_days=0
month=(31 28 31 30 31 30 31 31 30 31 30 31)

echo ""
echo "================ Calender ================"
echo -n "----------> input year : "
read c_year
while [ $f_year -lt $c_year ]
do
if [ `expr $f_year % 4` -eq 0 ]
then
if [ `expr $f_year % 400` -eq 0 ]
then
s_days=`expr $s_days + 366`
elif [ `expr $f_year % 100` -eq 0 ]
then
s_days=`expr $s_days + 365`
else
s_days=`expr $s_days + 366`
fi
else
s_days=`expr $s_days + 365`
fi
f_year=`expr $f_year + 1`
done

echo""
echo "================ Calender ================"
echo "---------->1. input month ? "
echo "---------->2. show year ? "
read choice

if [ `expr $c_year % 4` -eq 0 ]
then
if [ `expr $c_year % 400` -eq 0 ]
then
month[1]=29
elif [ `expr $c_year % 100` -eq 0 ]
then
month[1]=28
else
month[1]=29
fi
else
month[1]=28
fi

if [ $choice -eq 1 ]
then
i=0
echo ""
echo "=========================================="
echo "================ Calender ================"
echo "----------> input Month : "
read c_month
while [ $i -lt `expr $c_month - 1` ]
do
s_days=`expr $s_days + ${month[$i]}`
i=`expr $i + 1`
done
echo ""
echo "=========== $c_year / $c_month ==========="
echo "Sun Mon Tue Wed Thu Fri sat"

cnt=`expr $s_days + 1`
cnt=`expr $cnt % 7`
temp=0
while [ $temp -lt $cnt ]
do
echo -n "    "
temp=`expr $temp + 1`
done
temp=1

while [ $temp -le ${month[$i]} ]
do
if [ `expr $cnt % 7` -eq 0 ]
then
echo""
fi
if [ $temp -ge 10 ]
then
echo -n " $temp"
else
echo -n " $temp"
fi
echo -n "  "
temp=`expr $temp + 1`
cnt=`expr $cnt + 1`
done
echo ""
elif [ $choice -eq 2 ]
then
i=0
cnt=`expr $s_days + 1`
while [ $i -le 11 ]
do
echo ""
echo "=========== $c_year / `expr $i + 1` ==========="
echo "Sun   Mon   Tue   Wed   Thu   Fri   Sat "

cnt=`expr $cnt % 7`
temp=0
while [ $temp -lt $cnt ]
do
echo -n "       "
temp=`expr $temp + 1`
done
temp=1
while [ $temp -le ${month[$i]} ]
do
if [ `expr $cnt % 7` -eq 0 ]
then
echo ""
fi
if [ $temp -ge 10 ]
then
echo -n " $temp"
else
echo -n " $temp"
fi
echo -n "  "
temp=`expr $temp + 1`
cnt=`expr $cnt + 1`
done
echo ""
i=`expr $i + 1`
done
fi

echo ""
echo "=========================================="
echo "================ Calender ================"
echo "-->1. continue ?"
echo "-->2. Program Exit ?"
echo -n "---> "
read choice
if [ $choice -eq 2 ]
then
break
fi
done

