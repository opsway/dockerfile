#!/usr/bin/env bash

isURL() {
	regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
	[[ ${1} =~ ${regex} ]]
}

replace() {
	sed -e ':a' -e 'N' -e '$!ba' -e 's/'"$1"'/'"$2"'/g'
}

addFromSTDIN() {
	printf "RUN "
	tail -n +3 |
		replace '#\n' '# ;\\\n' |
		replace '\n\n' ' ;\\\n'
}

addFromFile() {
	addFromSTDIN <"${1}"
}

addFromURL() {
	curl --silent "${1}" | addFromSTDIN
}

create() {
	imageFrom=${1}

	if [[ -z ${imageFrom} ]]; then
		echo "image name is require"
		exit 1
	fi

	echo "FROM ${imageFrom}"
	echo ""

	for i in "${@:2}"; do
		if isURL "${i}"; then
			addFromURL "${i}"
		else
			addFromFile "${i}"
		fi
		echo ""
	done
}

create "${@}"
