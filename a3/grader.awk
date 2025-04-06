function pass(avg){
        if (avg >= 70)
		return "PASS"
	else
		return "FAIL"
}   

BEGIN {
	FS=","
	#Start Low
	max = 0
	maxName = ""
	#Start High
	min = 301
	minName = ""

}
NR > 1 {
	#This is used for Task 1
	name = $2
	n[NR] = $2
	sum[name] = ($3 + $4 + $5)

	#Task2: Using the user-defined function pass, the average was calculated and classidied properly
	avg[name] = ($3 + $4 + $5)/3
	status[name] = pass(avg[name])

	#Task 3: This will detemine the highest and lowest scoring students based on the total
	if (max < sum[name]){
		maxName = name
		max = sum[name]
	}
	if (min > sum[name]){
		minName = name
		min = sum[name]
	}
		
}
END {
	# Task 4: Printing out every student and corresponding information
	print "All Students:\n"
	for (key in n){
		track_name = n[key]
		print "Name: " track_name "\nTotal Score: " sum[track_name] "\nAverage Score: " avg[track_name] "\nStatus: " status[track_name] "\n"
	}
	
	#Task 5: Printing out information on the top and lowest scoring students
	print "Top Scorer\nName: " maxName "\nTotal Score: " sum[maxName] "\nAverage Score: " avg[maxName] "\nStatus: " status[maxName] "\n"

	print "Lowest Scorer\nName: " minName "\nTotal Score: " sum[minName] "\nAverage Score: " avg[minName] "\nStatus: " status[minName] "\n"
}

