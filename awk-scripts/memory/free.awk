/MemTotal/ { total_mem = $2 }
/MemFree/ { free_mem = $2 }

END {
    free_percentage = (free_mem * 100) / total_mem
    print free_mem " kB (" free_percentage "%)"
}