#!/bin/bash
#
# option parsing function routines
#
# the expected option parsing loop in the main
# script should be:
#
# for option; do
#		case $option in
#			 '-a')	action;;
#		esac
#		shift $count
#		count=1
#
#
# variables:		count		shift step
#
# 

argument_required=
count=1

#
# Set variable to an option argument. Global value of the argument_required can be set.
#
# usage: get_arg variable $1 $2 
#
# cases:
# 	get_arg VAR --opt value
# 	get_arg VAR -ovalue
# 	get_arg VAR -o value
#
function get_arg() {

	# Debug
	#echo "\$1: $1"
	#echo "\$2: $2"
	#echo "\$3: $3"

	count=2

	if [[ $2 =~ ^-- ]]		# long option/ --opt value
	then

		arg=$3
	else									

		arg=${2/${2:0:2}}
		if [ ! $arg ]			
		then		
			arg=$3
		else
			count=1
		fi
	fi

	if [[ ! $arg || $arg =~ ^- ]]		# was not set or set to the following option
	then
		if [ $argument_required ]
		then
				echo "argument required for the \`$2' option"
				exit 1
		fi
	fi
	eval "$1=$arg"

	# Debug
	#echo "$1 was set to ${!1}"
}
