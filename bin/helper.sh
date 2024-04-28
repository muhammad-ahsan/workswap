#!/bin/bash

AVAILABLE_PLUGINS=("aws" "gcloud" "git" "azure")
ENABLED_PLUGINS=()

# Function to prompt user for input
_prompt_user() {
    read -p "Enter value for $1: " value
    eval "$1=\$value"
}

_validate_non_empty(){
    if [ -z "$1" ]; then
        echo "Argument cannot be empty :( "
        exit 1
    fi
}

_validate_exist(){
    if [ ! -d "$1" ]; then
        echo "Directory doesn't exist"
        exit 1
    fi
}

_setup_environment(){
    userEnv="$1"

    while true; do
        # Check if name is provided as an argument
        if [ -z "$1" ]; then
            read -p "Please enter new environment's name: " userEnv
             # Check if $userEnv is not empty
            if [ -z "$userEnv" ]; then
                echo "Environment cannot be empty. Please try again."
                continue
            fi
        fi
        break
    done

    environment_dir="$ROOT_PATH/.env/$userEnv"

    if [ ! -e "$ROOT_PATH/.env/$userEnv" ]; then
        # Environment creation
        mkdir -p $environment_dir
    fi
    echo $environment_dir
}

_associate_plugins_to_env(){
    # User environment is required
    _validate_exist $1
    environment_dir=$1

    while true; do
        echo "Which plugins you want to configure? Available options: "
        ls -1 "$ROOT_PATH/plugins"

        read -p "Please enter plugin's name: " userPlugin

        # Check if userPlugin is available
        if [[ " ${AVAILABLE_PLUGINS[@]} " =~ " $userPlugin " ]]; then
            ENABLED_PLUGINS+=($userPlugin)
            _configure_plugins $environment_dir
            break
        fi

        echo "Invalid plugin. Please try again."
    done
}

_configure_plugins() {

    # User environment is required
    _validate_exist $1
    environment_dir=$1

    for plugin in "${ENABLED_PLUGINS[@]}"; do
        # Write plugins to user environment
        properties_file="$environment_dir/${plugin}.sh"

        # In case plugin is already configured - Truncate
        printf "#!/bin/bash\n\n" > "$properties_file"

        # Check if the current plugin is one of the specified values
        if [[ "$plugin" == "git" ]]; then
            _prompt_user "git_username"
            _prompt_user "git_email"
            echo "git_username=$git_username" >> $properties_file
            echo "git_email=$git_email" >> $properties_file
        elif [[ "$plugin" == "aws" ]]; then
            echo Not Implemented
        elif [[ "$plugin" == "azure" ]]; then
            echo Not Implemented
        elif [[ "$plugin" == "gcloud" ]]; then
            echo Not Implemented
        else
            echo "$plugin is not found in supported plugins $AVAILABLE_PLUGINS"
            exit 1
        fi
        echo Status: success - $plugin configured
    done
}