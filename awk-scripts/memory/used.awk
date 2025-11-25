/MemTotal/ { total_mem = $2 }
/MemFree/ { free_mem = $2 }

END {
    used_mem = total_mem - free_mem
    used_percentage = (used_mem * 100) / total_mem
    print used_mem " kB (" used_percentage "%)"
}