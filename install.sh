#!/bin/bash
#
# Run as root. Copy executable files to the /usr/local/bin.

declare -a files=( hdr.sh c.sh opt.sh )
cd /usr/local/bin
for file in ${files[@]}
do
	test ! -e $file || sudo unlink $file
	sudo ln --symbolic $OLDPWD/$file .
done
