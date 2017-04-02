#!/bin/bash
# 
# Run speedtest client, save output in CSV files (rotated monthly)
#
ym=`date +%Y-%m`
dir=${HOME}/speedtest
fname=${dir}/${ym}_speedtest.csv

# make directory to save CSV outputs
if [ ! -d $dir ]; then
    mkdir $dir
fi

# create header line if this month's CSV doesn't exist yet
if [ ! -f $fname ]; then
    speedtest --csv --csv-header > $fname
fi

# run speedtest, append results in this month's CSV file
speedtest --csv >> $fname

