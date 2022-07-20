for line in `cat host_list`
do
    # a:avg s:stddev
    n1=$(ping -c9 $line | tail -1 | awk '{print $4}' )
    a1=$(echo $n1 | cut -d '/' -f 2)
    s1=$(echo $n1 | cut -d '/' -f 4)
    n2=$(ping -c9 $line | tail -1 | awk '{print $4}' )
    a2=$(echo $n2 | cut -d '/' -f 2)
    s2=$(echo $n2 | cut -d '/' -f 4)
    n3=$(ping -c9 $line | tail -1 | awk '{print $4}' )
    a3=$(echo $n3 | cut -d '/' -f 2)
    s3=$(echo $n3 | cut -d '/' -f 4)
    x=`echo "scale=2; ($a1+$a2+$a3)/3" | bc`
    y=`echo "scale=2; sqrt((($s1)^2+($s2)^2+($s3)^2)/3)" | bc`
    echo -n "avg:$x\t" ; echo "stddev:$y"
    echo ----------
done

