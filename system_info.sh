display_help() {
    echo "Usage: ./greeting_with_options.sh [options]"
    echo "Options:"
    echo "  -r          Display RAM information."
    echo "  -h          Display help information."
}

total_mem=$(grep MemTotal /proc/meminfo | awk '{print $2}')
 
total_mem_mb=$((total_mem / 1024))
 
while getopts rh option; do
    case "${option}" in
        r)
            # Process the - option
            echo "Total memory: $total_mem_mb MB"
            ;;
        h)
            # Display help information
            display_help
            exit 0
            ;;
        ?)
            # Invalid option
            echo "Error: Invalid option -$OPTARG"
            display_help
            exit 1
            ;;
    esac
done    