option=1
while [ $option -gt 0 ] && [ $option -lt 4 ]
do
	echo "Choose: 1)Lookup  2)Modify or Insert  3)Generate"
	read option

	if [ $option -eq 1 ]
	then
		echo "Entered one"
		echo "Enter the level of bandit you need password for"
		read linenum
		filename="./banditpassword"
		line=0
		flag=0
		while read -r presentline
		do
			let "line=line+1"
			if [ $line -eq $linenum ]
			then
				echo "$presentline"
				flag=1
			fi
		done<$filename
		if [ $flag -eq 0 ]
		then
			echo "Sorry..couldnt find"
		fi
	elif [ $option -eq 2 ]
	then
		echo "Entered two"
		echo "Enter level number to be modified or inserted"
		read linenum
		newpass=1
		filename="./banditpassword"
		line=0
		flag=0
		while read -r presentline
		do
			let "line=line+1"
			if [ $line -eq $linenum ]
			then
				flag=1
			fi
		done<$filename
		if [ $flag -eq 0 ]
		then
			let "line=line+1"
			if [ $line -eq $linenum ]
			then
				echo "Inserting new level.Enter the password for $linenum"
				read newpass
				echo "You entered $newpass"
				echo "level$linenum: $newpass" >> $filename
			else
				echo "No buddy, you shouldnt skip levels"
			fi
		else
			echo "Found line $linenum. Enter new password"
			read newpass
			sed -i "${linenum}s/.*/level$linenum: $newpass/" "$filename"
		fi
	elif [ $option -eq 3 ]
	then
		echo "Enter the level to be generated and given"
		read linenum
		echo "ssh bandit$linenum@bandit.labs.overthewire.org -p 2220"
	else
		echo "Anything else....Quitting"
	fi
done
