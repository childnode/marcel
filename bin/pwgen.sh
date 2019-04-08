#!/bin/bash
for ((n=0;n<${2:-1};n++)); do dd if=/dev/urandom count=1 2> /dev/null | uuencode -m -| sed -ne 2p | cut -c-${1:-8}; done
