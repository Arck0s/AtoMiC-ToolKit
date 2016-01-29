#!/bin/bash
echo -e $YELLOW'--->Searching '$APPSETTINGS' for possible port numbers...'$ENDCOLOR
if [ ! $PORTSEARCH=="NA" ] && [ ! $APPSETTINGS == "NA" ]; then
	echo -e 'Found the following port numbers:'
	grep "$PORTSEARCH" $APPSETTINGS | grep -v "http" | grep -Eo '[0-9]{4}'
	PORTSTRING=$(grep "$PORTSEARCH" $APPSETTINGS | grep -v "https" | head -1)
	#echo $PORTSTRING
	APPPORT=${PORTSTRING//[!0-9]/}
	#echo $APPPORT
	if [ ! -z "$APPPORT" ]; then
		echo -e 'Possible port: '$APPPORT'. If this does not work, try the other ports listed above.'
	else
		APPPORT=$APPDPORT
    	echo -e 'Not found. Using default port: '$APPDPORT
	fi
else
	APPPORT=$APPDPORT
    echo -e 'Incompatibility. Cannot determine port. Try default port: '$APPPORT
fi
