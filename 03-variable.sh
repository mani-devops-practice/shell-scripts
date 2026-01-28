
#!/bin/bash


start_time=$(date +%s)

echo "start time is $start_time"

sleep 10

end_time=$(date +%s)

diff_time=$(($end_time-$start_time))

echo "execution time $diff_time"
