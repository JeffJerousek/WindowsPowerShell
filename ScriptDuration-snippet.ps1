# Define script start time (put at start of script)
$startTime = (Get-Date)

# Your script here!


# Measure script duration time (put at end of script)
$endTime = (Get-Date)
$ElapsedTime = $endTime-$startTime
'Duration: {0:mm} min {0:ss} sec' -f $ElapsedTime