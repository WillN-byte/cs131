#!/bin/bash

link="$3"

echo "What days of the week do you want to open this link. Options include 0-6 where 0 = Sunday and 6 = Saturday"
read daysOfTheWeek

echo "What time do you wnat meeting to open (in 24 hours format like 13:01"
read time
hour=$(echo "$time" | cut -d':' -f1)
min=$(echo "$time" | cut -d':' -f2)

valid_days="0 1 2 3 4 5 6"

for day in $daysOfTheWeek; do
	if [[ ! " $valid_days " =~ " $day " ]]; then
		echo "$day not valid. Please enter one or more of the following: 0 1 2 3 4 5 6"
		exit 1
	fi
done

job="xdg-open \"$link\""
crontab -l | grep -v "$job" | crontab -

for day in $daysOfTheWeek; do
	cron_time="$min $hour * * $day"
	echo "$cron_time $job" | crontab -
done

echo "Zoom meeting will be launched every $daysOfTheWeek at $time"
