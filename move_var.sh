#!/bin/bash
for file in $(ls /var)
do
	#echo "moving $file to /varssd/."
	if [ -f "/var/$file" ]
       	then
		echo "$file is a file"
		[ -f "/varssd/$file" ] && rm /varssd/$file
		mv /var/$file /varssd/.
	elif [ -L "/var/$file" ]
       	then
	       	echo "$file is a symlink do nothing" 
		[ -L "/varssd/$file" ] && echo "Exists ok" || cp /var/$file /ssd/.
	elif [ -d "/var/$file" ]
       	then 
		echo "$file is a directory"
		[ -d "/varssd/$file" ] && rm -d /varssd/$file
		cp /var/$file /varssd.
	fi
done
echo "Done if /var/ is empthy then remove var and symlinkit to varssd"
