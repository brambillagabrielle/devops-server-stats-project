/^total/ {
    total_disk = $2
    free_disk = $4
}

END {
    free_percentage = (free_disk * 100) / total_disk
    print free_disk " kB (" free_percentage "%)"
}