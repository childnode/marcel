#!/bin/bash
for aliasTermOrOSType in '' $TERM $TERM_PROGRAM $HOSTTYPE $MACHTYPE $OSTYPE; do
	for aliasFile in ~/.bash_aliases.d/${aliasTermOrOSType}/*; do
		[[ -f ${aliasFile} && "$(basename ${aliasFile})" == "$(basename ${aliasFile} .disabled)" ]] && source ${aliasFile}
	done
done