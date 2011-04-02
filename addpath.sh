PROGNAME="Add2Path"
PROGVERSION="v1"
usage()
{
	echo -e "Usage: $PROGNAME $PROGVERSION [-p]"
	echo -e "\t-p       ... Adds PATH to .bashrc forcing it to be persistant through reboots"
}

while getopts "sc" opt
do
	case $opt in
	p) export PATH=$PATH:$PWD >> /home/.bashrc ;;
	*) usage ; exit 2;;
	esac
done

export PATH=$PATH:$PWD
