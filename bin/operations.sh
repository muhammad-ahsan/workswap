#!/bin/bash

source $ROOT_PATH/bin/helper.sh

show() {
	ls -1 "$ROOT_PATH/.env"
}

enable() {
	printf "\nWORKSPACE = $1\n"

	profile=$1

	# Check if the file exists
	if [ -d "$ROOT_PATH/.env/$profile" ]; then
	    # TODO: Make it generic with other environments as well
		source "$ROOT_PATH/.env/$profile/git"
		printf "\nGIT ENVIRONMENT\n\n"
		$ROOT_PATH/plugins/git/git-config.sh $git_username $git_email
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
    echo environment_dir=$environment_dir
    echo $environment_dir
    _associate_plugins_to_env $environment_dir
}