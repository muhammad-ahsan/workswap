#!/bin/bash


AVAILABLE_PLUGINS=("aws" "gcloud" "git" "azure")
ENABLED_PLUGINS=()

# Function to prompt user for input
_prompt_user() {
    read -p "Enter value for $1: " value
    eval "$1=\$value"
}

_setup_environment(){

    local userEnv="$1"
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

    if [ ! -e "$ROOT_PATH/env/$userEnv" ]; then
        > "$ROOT_PATH/env/$userEnv"
        printf "#!/bin/bash\n\n" >> "$ROOT_PATH/env/$userEnv"
    fi
    echo $userEnv
}

_validate_non_empty(){
    if [ -z "$1" ]; then
        echo "Argument cannot be empty :( "
        exit 1
    fi
}
_setup_plugin(){
    # User environment is required
    _validate_non_empty $1
    userEnv = $1

    while true; do
        echo "Which plugins you want to configure? Available options: "
        ls -1 "$ROOT_PATH/plugins"

        read -p "Please enter plugin's name: " userPlugin

        # Check if userPlugin is available
        if [[ " ${AVAILABLE_PLUGINS[@]} " =~ " $userPlugin " ]]; then
            ENABLED_PLUGINS+=($userPlugin)
            _configure_plugins $userEnv
            break
        fi

        echo "Invalid plugin. Please try again."
    done
}

_configure_plugins() {
    # User environment is required
    _validate_non_empty $1
    userEnv=$1

    # TODO: What if plugin is already configured
    # Load env and rewrite

    # Write plugins to user environment
    declare -p ENABLED_PLUGINS >> "$ROOT_PATH/env/$1"

    for plugin in "${ENABLED_PLUGINS[@]}"; do
        # Check if the current plugin is one of the specified values
        if [[ "$plugin" == "git" ]]; then
            # Get variables value from user
            _prompt_user "git_username"
            _prompt_user "git_email"
            # Write to new environment
            echo "git_username=$git_username" >> "$ROOT_PATH/env/$userEnv"
            echo "git_email=$git_email" >> "$ROOT_PATH/env/$userEnv"
        elif [[ "$plugin" == "aws" ]]; then
            echo Not implemented yet
        elif [[ "$plugin" == "azure" ]]; then
            echo Not implemented yet
        elif [[ "$plugin" == "gcloud" ]]; then
            echo Not implemented yet
        else
            echo "$plugin is not found in supported plugins $AVAILABLE_PLUGINS"
            exit 1
        fi
        echo Environment: $userEnv -> Status: success - $plugin configured
    done
}

show() {
	ls -1 "$ROOT_PATH/env"
}

set() {
	printf "\nWORKSPACE = $1\n"

	filename=$1

	# Check if the file exists
	if [ -f "$ROOT_PATH/env/$filename" ]; then
		source "$ROOT_PATH/env/$filename"

		printf "\nGIT ENVIRONMENT\n\n"
		# TODO Make it generic
		$ROOT_PATH/plugins/git/git-config.sh $git_username $git_email
	else
		echo "Environment does not exist :("
	fi
}

remove() {
	if [ -f "$ROOT_PATH/env/$1" ]; then
		rm "$ROOT_PATH/env/$1"
		echo "Environment $1 removed"
	else
		echo "Environment does not exist :("
	fi
}

config() {
    userEnv=$(_setup_environment $1)
    _setup_plugin $userEnv
}