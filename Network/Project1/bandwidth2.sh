for line2 in `cat iperf3_sup`
do
    iperf3 -c $line2 | tail -3
    iperf3 -c $line2 | tail -3
    iperf3 -c $line2 | tail -3
    echo --------
done