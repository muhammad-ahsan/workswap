#!/bin/bash

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
		$ROOT_PATH/plugins/git/git-config.sh.sh $git_username $git_email
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
	echo "Not implemented in this version!"
	# Source config REPL here
}