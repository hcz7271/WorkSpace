for i in `seq 2000 3000`
do
    if cal 2 $i | grep '23 24 25 26 27 28 29' >/dev/null
    then
	echo $i
    fi
done | wc -l
