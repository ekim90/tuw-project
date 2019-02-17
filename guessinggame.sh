#!/usr/bin/env bash

function get_files_number_in_current_dir {
	echo $(ls -1 | wc -l)
}


files_number=$(get_files_number_in_current_dir)
files_number_guessed=0
while [[ files_number_guessed -eq 0 ]]
do
	echo "How many files are there in the current directory?"
	read response

	if [[ ! $response =~ ^[0-9]+$ ]]
	then
		echo "You should input a non-negative integer value (without a sign)"
		echo ""
	# `${#response} -gt ${#files_number}` is for very long inputs, to prevent overflow.
	elif [[ ${#response} -gt ${#files_number} ]] || [[ $response -gt $files_number ]]
	then
		echo "Wrong: the actual number of files is lower"
		echo ""
	elif [[ $response -lt $files_number ]]
	then
		echo "Wrong: the acutal number of files is higher"
		echo ""
	elif [[ $response -eq $files_number ]]
	then
		echo "Congratulations! Your guess is right."
		let files_number_guessed=1
	fi
done

