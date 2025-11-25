/^total/ {
    total_disk = $2
    used_disk = $3
}

END {
    used_percentage = (used_disk * 100) / total_disk
    print used_disk " kB (" used_percentage "%)"
}