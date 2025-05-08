#!/bin/bash

spa()
{
echo
}

clr()
{
clear
}

lod()
{
clr
echo "Loading"
sleep 0.25
clr
echo "Loading."
sleep 0.50
clr
echo "Loading.."
sleep 0.75
clr
echo "Loading..."
sleep 1
clr
scr
}

scr()
{
spa
echo "POWER PLANT DATABASE MANAGEMENT SYSTEM"
spa
use
}

use()
{
echo "User: $(whoami)"
echo "Date: $(date)"
spa
}

men()
{
echo "Menu"
spa
echo "1.ADDB - Add data to data base"
echo "2.VDDB - View data from data base"
echo "3.RDDB - Remove data base"
echo "4.EDDB - Edit data from data base"
echo "5.Error code"
echo "6.Help"
echo "7.About"
echo "8.Exit"
spa
dec
}

dec()
{
read -p "Enter your choice: " c
if [[ "$c" == "1" ]] ; then
adb
elif [[ "$c" == "2" ]] ; then
vdb
elif [[ "$c" == "3" ]] ; then
rdb
elif [[ "$c" == "4" ]] ; then
edb
elif [[ "$c" == "5" ]] ; then
err
elif [[ "$c" == "6" ]] ; then
hel
elif [[ "$c" == "7" ]] ; then
abo
elif [[ "$c" == "8" ]] ; then
exit 1
else
spa
echo "Invalid input"
spa
read -p "Press enter to go back and then exit: " key
lod
men
fi
}

adb()
{
cd "/home/$(whoami)/EcoSmart AI Power/temp"
if [[ "$(pwd)" == "/home/$(whoami)/EcoSmart AI Power/temp" ]] ; then
clr
scr
echo "ADD DATA TO DATABASE"
spa
read -p "Power plant name: " name
spa
cat >> "$name.txt" << EOF
EOF
read -p "Number of units(0-9): " units
cat >> "$name.txt" << EOF
Number_of_units: $units
EOF
i=0
while [[ "$i" < "$units" ]] ;
do
i=$(( "$i" + 1 ))
read -p "Unit-$i capacity(MW): " unit
cat >> "$name.txt" << EOF
Unit-$i capacity(MW): $unit
EOF
done
spa
read -p "Power plant location: " location
spa
cat >> "$name.txt" << EOF
Power_plant location: $location
EOF
read -p "Kind of resource for power plant: " resource
spa
cat >> "$name.txt" << EOF
Kind_of_resource_for power_plant: $resource
EOF
read -p "Power plant status: " status
spa
cat >> "$name.txt" << EOF
Power_plant status: $status
EOF
awk '/capacity/ { sum += $3 }; END {print "Total capacity (MW): " sum}' "$name.txt"
spa
read -p "Do you want to add this data to data base [Y/N]: " choice
cd "/home/$(whoami)/EcoSmart AI Power/data base"
if [[ "$(pwd)" == "/home/$(whoami)/EcoSmart AI Power/data base" ]] ; then
if [[ "$choice" == "Y" || "$choice" == "y" ]] ; then
mv "/home/$(whoami)/EcoSmart AI Power/temp/$name.txt" "/home/$(whoami)/EcoSmart AI Power/data base"
spa
echo "This Data are added to database"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
elif [[ "$choice" == "N" || "$choice" == "n" ]] ; then
spa
echo "This data are not added to data base"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
else
spa
echo "Invalid input"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
fi
else
echo "Error code: 002"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
fi
else
clr
echo "Error code: 001"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
fi
}

vdb()
{
cd "/home/$(whoami)/EcoSmart AI Power/data base"
if [[ "$(pwd)" == "/home/$(whoami)/EcoSmart AI Power/data base" ]] ; then
clr
scr
echo "VIEW DATA FROM DATABASE"
spa
echo "List of data base:"
ls
spa
read -p "Enter name of data base to be view: " name
if [[ "$name" != "" ]] ; then
spa
echo "Data in $name.txt data base:"
cat "/home/$(whoami)/EcoSmart AI Power/data base/$name.txt"
awk '/capacity/ { sum += $3 }; END {print "Total capacity (MW): " sum}' "$name.txt"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
else
spa
echo "Invalid input"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
fi
else
clr
echo "Error code: 003"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
fi
}

rdb()
{
cd "/home/$(whoami)/EcoSmart AI Power/data base"
if [[ "$(pwd)" == "/home/$(whoami)/EcoSmart AI Power/data base" ]] ; then
clr
scr
echo "REMOVE DATABASE"
spa
echo "List of data base:"
ls
spa
read -p "Enter name of data base to be Deleted: " name
if [[ "$name" != "" ]] ; then
spa
echo "Data in $name.txt data base:"
cat "/home/$(whoami)/EcoSmart AI Power/data base/$name.txt"
awk '/capacity/ { sum += $3 }; END {print "Total capacity (MW): " sum}' "$name.txt"
spa
read -p "Do you want to Delete this data base [Y/N]: " choice
if [[ "$choice" == "Y" || "$choice" == "y" ]] ; then
gio trash "/home/$(whoami)/EcoSmart AI Power/data base/$name.txt"
spa
echo "This data base deleted"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
elif [[ "$choice" == "N" || "$choice" == "n" ]] ; then
spa
echo "This data base is not deleted"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
else
spa
echo "Invalid input"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
fi
else
spa
echo "Invalid input"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
fi
else
clr
echo "Error code: 004"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
fi
}

edb()
{
cd "/home/$(whoami)/EcoSmart AI Power/data base"
if [[ "$(pwd)" == "/home/$(whoami)/EcoSmart AI Power/data base" ]] ; then
clr
scr
echo "EDIT DATA FROM DATABASE"
spa
echo "List of data base:"
ls
spa
read -p "Enter name of data base to be edited: " name
if [[ "$name" != "" ]] ; then
spa
echo "Data in $name.txt data base:"
cat "/home/$(whoami)/EcoSmart AI Power/data base/$name.txt"
awk '/capacity/ { sum += $3 }; END {print "Total capacity (MW): " sum}' "$name.txt"
spa
cd "/home/$(whoami)/EcoSmart AI Power/temp"
if [[ "$(pwd)" == "/home/$(whoami)/EcoSmart AI Power/temp" ]] ; then
echo "Power plant name: $name"
spa
read -p "Number of units(0-9): " units
cat >> "$name.txt" << EOF
Number_of_units: $units
EOF
i=0
while [[ "$i" < "$units" ]] ;
do
i=$(( "$i" + 1 ))
read -p "Unit-$i capacity(MW): " unit
cat >> "$name.txt" << EOF
Unit-$i capacity(MW): $unit
EOF
done
spa
read -p "Power plant location: " location
spa
cat >> "$name.txt" << EOF
Power_plant location: $location
EOF
read -p "Kind of resource for power plant: " resource
spa
cat >> "$name.txt" << EOF
Kind_of_resource_for power_plant: $resource
EOF
read -p "Power plant status: " status
spa
cat >> "$name.txt" << EOF
Power_plant status: $status
EOF
awk '/capacity/ { sum += $3 }; END {print "Total capacity (MW): " sum}' "$name.txt"
spa
read -p "Do you want to make change in this data base [Y/N]: " choice
if [[ "$choice" == "Y" || "$choice" == "y" ]] ; then
gio trash "/home/$(whoami)/EcoSmart AI Power/data base/$name.txt"
mv "/home/$(whoami)/EcoSmart AI Power/temp/$name.txt" "/home/$(whoami)/EcoSmart AI Power/data base"
spa
echo "This Data are added to database"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
elif [[ "$choice" == "N" || "$choice" == "n" ]] ; then
spa
echo "This data are not added to data base"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
else
spa
echo "Invalid input"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
fi
else
clr
echo "Error code: 006"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
fi
else
spa
echo "Invalid input"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
fi
else
clr
echo "Error code: 005"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
fi
}

err()
{
clr
scr
spa
read -p "Enter error code [eg. 001 to 006]: " code
if [[ "$code" == "001" ]] ; then
echo "Can not locate /home/$(whoami)/EcoSmart AI Power/temp path on your system."
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
elif [[ "$code" == "002" ]] ; then
echo "Can not locate /home/$(whoami)/EcoSmart AI Power/data base path on your system."
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
elif [[ "$code" == "003" ]] ; then
echo "Can not locate /home/$(whoami)/EcoSmart AI Power/data base path on your system."
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
elif [[ "$code" == "004" ]] ; then
echo "Can not locate /home/$(whoami)/EcoSmart AI Power/data base path on your system."
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
elif [[ "$code" == "005" ]] ; then
echo "Can not locate /home/$(whoami)/EcoSmart AI Power/data base path on your system."
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
elif [[ "$code" == "006" ]] ; then
echo "Can not locate /home/$(whoami)/EcoSmart AI Power/temp path on your system."
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
else
spa
echo "Invalid input"
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
fi
}

hel()
{
clr
scr
echo "HELP"
spa
echo "Enter your choice between 1 to 8."
echo "VDDB - View data base will not work before installing."
echo "RDDB - Remove data base will not work before installing."
echo "EDDB - Edit database will not work before installing."
echo "Enter error code between 001 to 006."
echo "For some linux distribution this program may not work."
spa
read -p "Press enter to go back and then exit: " key
clr
scr
men
}

abo()
{
clr
scr
echo "ABOUT"
spa
echo "Version: 1.0"
echo "Released: Oct-2024"
spa
echo "By"
echo "SHABHARESWAHARAN G"
echo "(Entertainment programmer)"
spa
echo "Contact:"
echo "Email: shabhareswaharang@gmail.com"
echo "Twitter(X): https://x.com/GShabhareswaha1"
spa
read -p "Press enter to go back and then exit:" enter
clr
scr
men
}

lod
men
