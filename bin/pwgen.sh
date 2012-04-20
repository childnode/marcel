#!/bin/bash
for ((n=0;n<10;n++)); do dd if=/dev/urandom count=1 2> /dev/null | uuencode -m -| sed -ne 2p | cut -c-8; done
