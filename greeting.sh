# Function to display help information
#what should this functionds do§

display_help() {
    echo "Usage: ./greeting_with_options.sh [options]"
    echo "Options:"
    echo "  -n <name>   Specify the name of the person to greet."
    echo "  -h          Display help information."
}
 
# Default greeting message
greet="Hello! Nice to meet you!"
 
# Main script logic
while getopts "n:h" option; do
    case "${option}" in
        n)
            # Process the -n option
            name="${OPTARG}"
            greet="Hello, $name! Nice to meet you!"
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
 
# Display the greeting message
echo "$greet"
