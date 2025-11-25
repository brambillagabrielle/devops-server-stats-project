/cpu / {
    cpu_time = $2 + $3 + $4 + $5 + $6 + $7 + $8;
    idle_percentage = ($5 * 100) / cpu_time;
    print (100 - idle_percentage) "%"
}