#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Construct the absolute path to helper.sh
source "$script_dir/helper.sh"


show() {
	ls -1 "$ROOT_PATH/.env"
}

enable() {
	printf "\nWORKSPACE = $1\n"

	profile=$1

	# Check if the file exists
	if [ -d "$ROOT_PATH/.env/$profile" ]; then
	    if [ -d "$ROOT_PATH/.env/$PROFILE" ]; then
            for script in "$ROOT_PATH/.env/$PROFILE"/*; do
                [ -f "$script" ] && source "$script"
                if [ "$(basename "$script_file")" == "git.sh" ]; then
                    $ROOT_PATH/plugins/git/git-config.sh $git_username $git_email
                elif [ "$(basename "$script_file")" == "aws.sh" ]; then
                    echo Not implemented && exit 1
                elif [ "$(basename "$script_file")" == "azure.sh" ]; then
                    echo Not implemented && exit 1
                elif [ "$(basename "$script_file")" == "gcloud.sh" ]; then
                    echo Not implemented && exit 1
                fi
            done
        else
            echo "Environments doesn't exist, run config command first"
            exit 1
        fi
	else
		echo "Environment does not exist :("
	fi
}

remove() {
	if [ -d "$ROOT_PATH/.env/$1" ]; then
		rm -rf "$ROOT_PATH/.env/$1"
		echo "Environment $1 removed"
	else
		echo "Environment does not exist :("
	fi
}

config() {
    environment_dir=$(_setup_environment $1)
    _associate_plugins_to_env $environment_dir
}