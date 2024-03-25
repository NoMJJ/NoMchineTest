function nxHelp() {
    echo -e ""
    echo -e "Used:\t$0 [-h] for help"
    echo -e "\t[-i] Enter IP where script will be executed"
    echo -e "\t[-t] Define test function that will be executed for ex 'stats'"
}

while getopts i:t:h option; do
  case "${option}" in
    h) nxHelp; exit 0;;
    i) ipAddress=${OPTARG} ;;           # 10.64.251.22 ...
    t) testFunction=${OPTARG} ;;        # something that can be done 
    ?) echo -e "\nError: option -$OPTARG is not implemented checking help instead\n"; nxHelp; exit 0 ;;
  esac
done

while getopts ijkd:sawe op; do
  echo "TEST: $op -- ${OPTARG}" 
done

# check
if [[ -z $ipAddress ]]; then 
  echo "INFO: setting default IP address to 10.64.251.22"
  ipAddress="10.64.251.22"
else 
  echo "Using provided IP address: $ipAddress"
fi

if [[ -z $testFunction ]]; then 
  echo "INFO: setting test Function to 'stats'"
  testFunction="stats"
else 
  echo "Using provide test function: $testFunction"
fi

echo "INFO: $ipAddress ---- $testFunction"

ssh nomachine@$ipAddress sudo /etc/NX/nxserver --nodelist > nodeList.txt


#cat nodeList.txt

sum=0;
while read line; do 
#    sum=$((sum + number)); 
  echo "info: $line"
  sleep 3
done <nodeList.txt
echo $sum