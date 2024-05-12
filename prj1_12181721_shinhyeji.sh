#!/bin/bash

menu() {
	echo ""
	echo "[MENU]"
	echo "1. Get the data of Heung-Min Son's Current Club, Appearances, Goals, Assists in players.csv"
	echo "2. Get the team data to enter a league position in teams.csv"
	echo "3. Get the Top-3 Attendance mathces in mateches.csv"
	echo "4. Get the team's league position and team's top scorer in teams.csv & players.csv"
	echo "5. Get the modified format of data_GMT in matches.csv"
	echo "6. Get the data of the wining team by the largest difference on home stadium in teams.csv & matches.csv"
	echo "7. Exit"
}

opt1() {
    read -p "Do you want to get Heung-Min Son's data? (y/n): " choice
    if [[ $choice == "y" ]]; then
        result=$(awk -F, '$1=="Heung-Min Son"{print "Team:" $4 ", Appearance:" $6 ", Goal:" $7 ", Assist:" $8}' players.csv)
        echo "$result"
    else
        echo "No data retrieved."
    fi
}

opt2() {
    read -p "What do you want to get the team data of league position[1~20]: " choice
	result=$(awk -F, -v pos="$choice" '$6==pos{wins=$2; draws=$3; losses=$4; rates=wins/(wins+draws+losses);
            print "League Position:", $6, "Team:", $1, "Winning Rate:", rates}' teams.csv)
    echo "$result"
}

opt3() {
	read -p "Do you want to know Top-3 attendance data and average attendance? (y/n): " choice
    if [[ $choice == "y" ]]; then
		echo "***Top-3 Attendance Match***"
        sort -t, -k2 -nr matches.csv | head -n 3 | awk -F, '{printf "%s vs %s (%s)\n%s %s %s\n", $3, $4, $1, $2, $6, $7}'
    else
        echo "No data retrieved."
    fi
}

opt4() {
    echo ""
}

opt5() {
	echo ""
}

opt6() {
	echo ""
}




echo "*************OSS1 - Project1*************"
echo "*         StudentID : 12181721          *"
echo "*           Name : Hyeji Shin           *"
echo "*****************************************"

while true; do
	menu
	read -p "Enter your CHOICE (1~7):" choice

	case $choice in
		1) opt1 ;;
		2) opt2 ;;
		3) opt3 ;;
		4) opt4 ;;
		5) opt5 ;;
		6) opt6 ;;
		7) echo "Bye"; exit ;;
		*) echo "Invalid choice" ;;
	esac
done
