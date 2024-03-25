grep running nodeList.txt | awk '{print $6}' > nodeLine6.txt

sum1=0
sum2=0
sum3=0
sum4=0

while read nodeLine; do

    #Alen
    # Edited comment 
    # Sum of the stats of numbe of different types of connections

    stat1=`echo $nodeLine | cut -d "/" -f1`; 
    echo $stat1; 
    sum1=$((sum1 + stat1));

    stat2=`echo $nodeLine | cut -d "/" -f2`; 
    echo $stat2; 
    sum2=$((sum2 + stat2));

    stat3=`echo $nodeLine | cut -d "/" -f3`; 
    echo $stat3; 
    sum3=$((sum3 + stat3)); 
    
    stat4=`echo $nodeLine | cut -d "/" -f4`; 
    echo $stat4; 
    sum4=$((sum4 + stat4));

done < nodeLine6.txt

echo "Sum f1 = to:" $sum1 
echo "Sum f2 = to:" $sum2
echo "Sum f3 = to:" $sum3
echo "Sum f4 = to:" $sum4
