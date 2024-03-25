serverInfo=$(grep running nodeList.txt| awk '{print $1}')

ipAddress="10.64.251.22"
# Alen added comment 

for sName in $serverInfo; do 
	ssh nomachine@$ipAddress sudo /etc/NX/nxserver --nodeinfo $sName > savedServerInfo.txt
	avgScon=$(cat savedServerInfo.txt | grep "Avg. server connections" | grep -Eo "[0-9]{1,2}\.[0-9]{1,2}|[0-9]{1,2}" | head -n1)
	maxScon=$(cat savedServerInfo.txt | grep "Max. server connections" | grep -Eo "[0-9]{1,2}\.[0-9]{1,2}|[0-9]{1,2}" | head -n1)
	avgDcon=$(cat savedServerInfo.txt | grep "Avg. desktops connections" | grep -Eo "[0-9]{1,2}\.[0-9]{1,2}|[0-9]{1,2}" | head -n1)
	maxDcon=$(cat savedServerInfo.txt | grep "Max. desktops connections" | grep -Eo "[0-9]{1,2}\.[0-9]{1,2}|[0-9]{1,2}" | head -n1)
	#echo "INFO: Avg. server connections for $sName is: $avgScon"
	#echo "INFO: Max. server connections for $sName is: $maxScon"
	#echo "INFO: Avg. desktops connections for $sName is: $avgDcon"
	#echo -e "INFO: Max. desktops connections for $sName is: $maxDcon\n"

	echo  "INFO: Node with name $sName had connections avg/max sever, avg/max desktop: $avgScon, $maxScon, $avgDcon, $maxDcon"

done 

