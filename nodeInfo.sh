grep running nodeList.txt | awk '{print $5}' > nodeLine6.txt
 
grep unreachable nodeList.txt | awk '{print $5}' >> nodeLine6.txt

grep failed nodeList.txt | awk '{print $5}' >> nodeLine6.txt
 
grep stopped nodeList.txt | awk '{print $5}' >> nodeLine6.txt
 
runNode=0
unrNode=0
failNode=0
stopedNode=0
 

while read nodeLine; do


    stat1=$(echo "$nodeLine" | grep -c "running")

    echo "$stat1"

    runNode=$((runNode + stat1))
 
    stat2=$(echo "$nodeLine" | grep -c "unreachable")

    echo "$stat2"

    unrNode=$((unrNode + stat2))

    stat3=$(echo "$nodeLine" | grep -c "failed")

    echo "$stat3"

    failNode=$((failNode + stat3))

    stat4=$(echo "$nodeLine" | grep -c "stopped")

    echo "$stat4"

    stopedNode=$((stopedNode + stat4))
 
done < nodeLine6.txt
 

echo "number of running nodes:" $runNode
echo "number of unreachable nodes:" $unrNode
echo "number of failed nodes:" $failNode
echo "number of stopped nodes: $stopedNode"
