#numlines=$(ls -l | wc -l)
#for (( c=1; c<=$numlines; c++ ))
#do
#   echo "Welcome $c times"
#done

for i in *
do
	cd $i
	temp=$(ls -al | awk '{print $5}' | grep 1039)
	if [ $temp -eq 1033 ]
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	cd ..
done


