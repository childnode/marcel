#!/usr/bin/env bash

## non interactive shouldn't setup anything
[[ $- != *i* ]] && return

for rcTermOrOSType in '' $TERM $TERM_PROGRAM $HOSTTYPE $MACHTYPE $OSTYPE; do
	for rcFile in ~/.bashrc.d/${rcTermOrOSType}/*; do
		# [[ -f ${rcFile} && "$(basename ${rcFile})" == "$(basename ${rcFile} .disabled)" ]] && echo ${rcFile} && time source ${rcFile}
		[[ -f ${rcFile} && "$(basename ${rcFile})" == "$(basename ${rcFile} .disabled)" ]] && source ${rcFile}
	done
done
unset rcTermOrOSType
unset rcFile

[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
