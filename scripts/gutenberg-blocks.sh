#!/bin/zsh

# Set version number
VERSION_NUMBER="0.0.14"

# Set Colorsy61dC*TkFr!cG8AB#VUoqFIAVWdzPb3D4HXT0ZzP
_GREEN=$(tput setaf 2)      # Success
_YELLOW=$(tput setaf 3)     # Notice or question
_RED=$(tput setaf 1)        # Deleting or error
_RESET=$(tput sgr0)         # Reset
_B=$(tput bold)             # Bold text
_U=$(tput smul)             # Underlined text
_ENDU=$(tput rmul)          # End underlined text

# Set Root path
ROOT=$(pwd)

# Set user
USER=$(whoami)
GROUP=$(id -g -n)

# Get the default blocks folder path based on the current directory
DEFAULT_FOLDER="templates/blocks"

# Set default
INSTALL_PATH=""

# Clone an empy starterblock and fill it interactively
function create() {
    echo "Cloning Gutenberg Starter Block..."
    
    # Get default block from cloud
    curl -o starterblock.tar.gz 'https://assets.burovoordeboeg.nl/blocks/starterblock.tar.gz' -A bvdb
    tar -xf starterblock.tar.gz
    rm -rf starterblock.tar.gz

    # Ask user if it wants to run in interactive mode or just get the starter block
    echo "${_YELLOW}Would you like to run the installer interactively? (y/n): ${_RESET}"
    read RUN_INTERACTIVELY

    if [[ "$RUN_INTERACTIVELY" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        # Ask user for the folder path to install the block (default: templates/blocks)
        echo -n "Enter the folder path to install the block (default: $DEFAULT_FOLDER): "
        read INSTALL_PATH
        INSTALL_PATH=${INSTALL_PATH:-$DEFAULT_FOLDER}

        # Check if the specified directory exists
        check_directory_exists "$INSTALL_PATH" || { cleanup_and_exit; return; }

        # Move block to the specified location
        mv starter-block "$INSTALL_PATH" || { echo "${_RED}Error: Unable to move block to $INSTALL_PATH.${_RESET}"; cleanup_and_exit; return; }

        # Ask user to input the new value for "name"
        echo -n "Enter the new value for the block name (e.g., acf/header), this value is also used to rename the folder: "
        read BLOCK_NAME

        # Ask user to input the new value for "title"
        echo -n "Enter the new value for the block title: "
        read BLOCK_TITLE

        # Ask user to input the new value for "description"
        echo -n "Enter the new value for the block description: "
        read BLOCK_DESCRIPTION

        # Ask user to input the new value for "category"
        echo -n "Enter the new value for block category: "
        read BLOCK_CATEGORY

        # Ask user to input the new value for "icon"
        echo -n "Enter the new value for block icon: "
        read BLOCK_ICON

        # Check if BLOCK_NAME is not empty
        if [ -n "$BLOCK_NAME" ]; then
            # Remove "acf/" prefix from block name to rename the folder
            FOLDER_NAME=$(echo "$BLOCK_NAME" | sed 's/^acf\///')
            if [ -d "$INSTALL_PATH/$FOLDER_NAME" ]; then
                # If folder with same name exists, rename it with suffix
                # TODO this conflicts with the block.json sed-command, probably due to wrong install-path
                rename_folder "$FOLDER_NAME" 2
                # Adjust path to block.json based on the INSTALL_PATH
                BLOCK_JSON_PATH="$INSTALL_PATH/block.json"
            else
                mv "$INSTALL_PATH/starter-block" "$INSTALL_PATH/$FOLDER_NAME"
                # Adjust path to block.json based on the INSTALL_PATH
                BLOCK_JSON_PATH="$INSTALL_PATH/$FOLDER_NAME/block.json"
            fi


            # Replace the line starting with "name" with the new value
            sed -i '' -e "s,\"name\": \".*\", \"name\": \"$BLOCK_NAME\"," "$BLOCK_JSON_PATH"
        else
            echo "${_RED}A name for the block is needed to create it.${_RESET}"; 
            cleanup_and_exit;
            return; 
        fi

        # Check if BLOCK_TITLE is not empty
        if [ -n "$BLOCK_TITLE" ]; then
            # Replace the line starting with "title" with the new value
            sed -i '' -e "s,\"title\": \".*\", \"title\": \"$BLOCK_TITLE\"," "$BLOCK_JSON_PATH"
        fi

        # Check if BLOCK_DESCRIPTION is not empty
        if [ -n "$BLOCK_DESCRIPTION" ]; then
            # Replace the line starting with "description" with the new value
            sed -i '' -e "s,\"description\": \".*\", \"description\": \"$BLOCK_DESCRIPTION\"," "$BLOCK_JSON_PATH"
        fi

        # Check if BLOCK_CATEGORY is not empty
        if [ -n "$BLOCK_CATEGORY" ]; then
            # Replace the line starting with "category" with the new value
            sed -i '' -e "s,\"category\": \".*\", \"category\": \"$BLOCK_CATEGORY\"," "$BLOCK_JSON_PATH"
        fi

        # Check if BLOCK_ICON is not empty
        if [ -n "$BLOCK_ICON" ]; then
            # Replace the line starting with "icon" with the new value
            sed -i '' -e "s,\"icon\": \".*\", \"icon\": \"$BLOCK_ICON\"," "$BLOCK_JSON_PATH"
        fi

        echo "${_GREEN}The block is ready for you. Make something kick ass of it!${_RESET}"

    else
        # Move block to the default location
        mv starter-block "$DEFAULT_FOLDER/starter-block" || { echo "${_RED}Error: Unable to move block to $INSTALL_PATH.${_RESET}"; cleanup_and_exit; return; }
        echo "${_GREEN}You can find the bare starter-block in the root of your site. Please don't forget to edit the details.${_RESET}";
    fi
}

# Function to rename folder with suffix
function rename_folder() {
    local folder_name="$1"
    local suffix="$2"
    local new_name="${folder_name%-[0-9]*}-$suffix"
    if [ -d "$INSTALL_PATH/$new_name" ]; then
        rename_folder "$folder_name" $((suffix + 1))
    else
        mv "$INSTALL_PATH/starter-block" "$INSTALL_PATH/$new_name" || { echo "${_RED}Error: Unable to rename block folder.${_RESET}"; cleanup_and_exit; return; }
        INSTALL_PATH="$INSTALL_PATH/$new_name"
    fi
}

# Function to remove folders on failure
function cleanup_and_exit() {
    echo "${_RED}Error occurred. Cleaning up...${_RESET}"
    rm -rf "$INSTALL_PATH" starter-block starterblock.tar.gz
}

# Function to check if the directory exists
# Function to check if the directory exists
function check_directory_exists() {
    local dir="$1"
    if [ ! -d "$dir" ]; then
        echo "${_RED}Error: The specified directory '$dir' does not exist.${_RESET}"
        cleanup_and_exit
    fi
}

# Function to display script version
function display_version {
    echo "Gutenberg Blocks Script v$VERSION_NUMBER"
}

# Function to display script help
function display_help {
    cat << EOF
Usage: gutenberg-blocks [options]

Options:
  -v, --version   Display the version
  -h, --help      Display this help message
EOF
}

# Case statement to call the correct method based on command-line arguments
case "$1" in
    "--version" | "-v")
        display_version
        ;;
    "--help" | "-h")
        display_help
        ;;
    *)
        echo "Please use one of the registered commands: $0 {create|--version|--help}"
        ;;
esac