for line in `cat iperf_sup`
do
    iperf -c $line | tail -1
    iperf -c $line | tail -1
    iperf -c $line | tail -1
    echo --------
done