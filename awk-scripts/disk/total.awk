/^total/ { 
    total_disk = $2
    print total_disk " kB" 
}