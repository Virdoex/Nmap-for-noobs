#!/bin/bash

# This is simple script to scan a network or a system

echo "What you want to scan"
echo "[+]1.A web system"
echo "[+] 2. A netowrk"
echo "Enter your option"

read op

if [ "$op" -eq 1 ]
then
	echo "Enter the host name"
	read host
	echo "[1].Do you want a simple scan "
	echo "[2].Do you want an agressive scan"
	echo "3.Script scan"
	read scan
	if [ "$scan" -eq 1 ]
	then
		echo "enter the port range you want to scan"
		read range
		nmap -p $range $host
	end
	if [ "$scan" -eq 2 ]
	then
		echo "Enter the port range you want to scan"
		read range
		nmap -A -p $range $host
	fi
	if [ "$scan" -eq 3 ]
	then
		echo "Which script you want to use"
		echo "[1].HTTP"
		echo "[2].SSH"
		echo "[3].SNMP"
		echo "[4].SMTP"
		echo "Enter your option"
		read script
		if [ "$script" -eq 1 ]
		then
			nmap -vv -Pn --script=http* $subnet
		fi
		if [ "$script" -eq 2 ]
		then
			nmap -vv -Pn --script=ssh* $subnet
		fi
		if [ "$script" -eq 3 ]
		then
			nmap --vv -Pn --script=snmp* $subnet
		fi
		if [ "$script" -eq 4 ]
		then
			nmap --vv -Pn --script=smtp* $subnet
		fi
	fi

fi
if [ "$op" -eq 2 ]
then
	echo "Enter the subnet you want to scan"
	read subnet
	echo "What you want to scan in this network"
	echo "[1].A ping scan"
	echo "[2].A os scan"
	echo "[3].Use nse script"
	echo "[4].Aggressive scan"
	echo "[5]Services and version scan"
	read scan
	if [ "$scan" -eq 1 ]
	then
		nmap -sP $subnet
	fi
	if [ "$scan" -eq 2 ]
	then
		nmap -O $subnet
	fi
	if [ "$scan" -eq 3 ]
	then
		echo "Which script you want to use"
		echo "[1].HTTP"
		echo "[2].SSH"
		echo "[3].SNMP"
		echo "[4].SMTP"
		echo "Enter your option"
		read script
		if [ "$script" -eq 1 ]
		then
			nmap -vv -Pn --script=http* $subnet
		fi
		if [ "$script" -eq 2 ]
		then
			nmap -vv -Pn --script=ssh* $subnet
		fi
		if [ "$script" -eq 3 ]
		then
			nmap --vv -Pn --script=snmp* $subnet
		fi
		if [ "$script" -eq 4 ]
		then
			nmap --vv -Pn --script=smtp* $subnet
		fi
	fi

	if [ "$scan" eq 4 ]
	then
		nmap -A $subnet
	fi
	if [ "$scan" eq 5 ] 
	then
		nmap -sS -sV --vv $subnet
	fi
	
fi
fi
