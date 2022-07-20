for line in `cat host_list`
do
    traceroute -nw1 $line | awk 'END{print $1}'
done
