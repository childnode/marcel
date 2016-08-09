#!/usr/bin/env sh

for rcTermOrOSType in '' $TERM $TERM_PROGRAM $HOSTTYPE $MACHTYPE $OSTYPE; do
	for rcFile in ~/.profile.d/${rcTermOrOSType}/*; do
		# [[ -f ${rcFile} && "$(basename ${rcFile})" == "$(basename ${rcFile} .disabled)" ]] && echo ${rcFile} && time source ${rcFile}
		[[ -f ${rcFile} && "$(basename ${rcFile})" == "$(basename ${rcFile} .disabled)" ]] && source ${rcFile}
	done
done
unset rcTermOrOSType
unset rcFile