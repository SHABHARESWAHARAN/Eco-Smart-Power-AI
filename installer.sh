#!/bin/bash
clr()
{
clear
}

use()
{
echo "user : $(whoami)"
echo "Date : $(date)"
}

spa()
{
echo
}

chk()
{
clr
echo "Checking"
sleep 0.25
clr
echo "Checking."
sleep 0.50
clr
echo "Checking.."
sleep 0.75
clr
echo "Checking..."
sleep 1
clr
if [[ "$(whoami)" == "root" ]] ; then
echo "You are runing this setup as root user."
echo "For some linux distribution root user may not work."
read -p "Do you want to continue [[Y/N]]: " c
if [[ "$c" == "Y" ]] || [[ "$c" == "y" ]] ; then
lod
elif [[ "$c" == "N" ]] || [[ "$c" == "n" ]] ; then
echo "Exit due to root user"
sleep 2
exit 1
else
echo "Invalid input"
sleep 2
spa
echo "Press enter to go back and then exit:"
read enter
clr
fi
else
lod
fi
clr
}

lod()
{
clr
echo "Setup loading"
sleep 0.25
clr
echo "Setup loading."
sleep 0.50
clr
echo "Setup loading.."
sleep 0.75
clr
echo "Setup loading..."
sleep 1.00
clr
scr
men
}

scr()
{
spa
echo "EcoSmart AI Power"
spa
}

ins()
{
clr
echo "EcoSmart AI Power"
spa
cd "/home/$(whoami)"
if [[ "$(pwd)" == "/home/$(whoami)" ]] ; then
clr
echo "[[=................................]] 10%"
sleep 0.25
else
clr
echo "Instlation error code:001"
sleep 2.00
exit 1
fi
mkdir "EcoSmart AI Power"
cd "EcoSmart AI Power"
if [[ "$(pwd)" == "/home/$(whoami)/EcoSmart AI Power" ]] ; then
clr
echo "[[=====............................]] 25%"
sleep 0.50
else
echo "Instlation error code:002"
sleep 2.00
exit 1
fi
mkdir "bin" "history" "data base" "temp" "cohere AI"
cd bin
if [[ "$(pwd)" == "/home/$(whoami)/EcoSmart AI Power/bin" ]] ; then
clr
echo "[[==============...................]] 47%"
sleep 0.75
else
clr
echo "Instlation error code:003"
sleep 2.00
exit 1
fi
cat >> "run.sh" << EOF
<program>
EOF
clr
chmod +x "run.sh"
echo "[[=============================....]] 92%"
sleep 1.00
cd "/home/$(whoami)/EcoSmart AI Power/history"
if [[ "$(pwd)" == "/home/$(whoami)/EcoSmart AI Power/history" ]] ; then
clr
echo "[[===============================..]] 96%"
sleep 1.25
else
clr
echo "Instlation error code:004"
sleep 2.00
exit 1
fi
cat >> "EcoSmart AI Power installation Document.txt" << EOF
"EcoSmart AI Power"

version: 1.0
Released: Sep-2024

User: $(whoami)
Date: $(date)

Installed
-------------------

EOF
clr
echo "[[=================================]] 100%"
sleep 1.50
clr
echo Installed
spa
read -p "Press enter to go back and then exit: " enter
clr
}

uni()
{
clr
echo "EcoSmart AI Power"
spa
cd "/home/$(whoami)"
if [[ "$(pwd)" == "/home/$(whoami)" ]] ; then
clr
echo "[[=================................]] 50%"
sleep 0.25
else
clr
echo "Un-install error code:005"
sleep 2.00
exit 1
fi
cd "/home/$(whoami)/EcoSmart AI Power"
if [[ "$(pwd)" == "/home/$(whoami)/EcoSmart AI Power" ]] ; then
clr
echo "[[=======================..........]] 75%"
sleep 0.50
else
clr
echo "Un-install error code:009"
sleep 2
exit 1
fi
cd "/home/$(whoami)"
gio trash "EcoSmart AI Power"
clr
echo "[[=================================]] 100%"
sleep 0.75
clr
echo Un-installed
spa
read -p "Press enter to go back and then exit: " enter
clr
}

rei()
{
clr
echo "searching for old insatallation path"
spa
cd "/home/$(whoami)/EcoSmart AI Power/bin"
if [[ "$(pwd)" == "/home/$(whoami)/EcoSmart AI Power/bin" ]] ; then
clr
echo "Finding"
sleep 0.25
else
clr
echo "Re-instlation error code:006"
sleep 2
exit 1
fi
if [[ "$(ls)" == "run.sh" ]] ; then
echo "Uninstalling."
sleep 0.50
else
clr
echo "Re-instlation error code:007"
sleep 2
exit 1
clr
fi
gio trash "run.sh"
cat >> "run.sh" << EOF
<code>
EOF
clr
echo "Re-instlation.."
sleep 0.75
chmod +x "run.sh"
clr
echo "Re-instlation..."
sleep 1.00
cd "/home/$(whoami)/EcoSmart AI Power/history"
if [[ "$(pwd)" == "/home/$(whoami)/EcoSmart AI Power/history" ]] ; then
clr
echo "Finishing."
sleep 1.25
else
clr
echo "Re-instlation error code:008"
sleep 2
exit 1
fi
cat >> "EcoSmart AI Power installation Document.txt" << EOF
"EcoSmart AI Power"

version: 1.0
Released: Sep-2024

User: $(whoami)
Date: $(date)

Re-installed
-------------------

EOF
clr
echo "Finishing.."
sleep 1.50
clr
echo "Finishing..."
sleep 1.75
clr
echo Re-installed
spa
read -p "Press enter to go back and then exit: " enter
clr
}

err()
{
clr
scr
use
spa
read -p "Enter error code: " r
if [[ "$r" == "001" ]] ; then
echo "Can not locate /home/$(whoami) path on your system."
sleep 2
spa
read -p "Press enter to go back and exit: " enter
clr
elif [[ "$r" == "002" ]] ; then
echo "Can not locate /home/$(whoami)/EcoSmart AI Power path on your system."
echo "Or folder "EcoSmart AI Power" creation failed."
sleep 2
spa
read -p "Press enter to go back and then exit: " enter
clr
elif [[ "$r" == "003" ]] ; then
echo "Can not locate /home/$(whoami)/EcoSmart AI Power/bin path on your system."
echo "Or folder bin creation failed."
sleep 2
spa
read -p "Press enter to go back and then exit: " enter
clr
elif [[ "$r" == "004" ]] ; then
echo "Can not locate /home/$(whoami)/EcoSmart AI Power/history path on your system."
echo "Or folder history creation failed."
sleep 2
spa
echo "Press enter to go back and then exit:"
read enter
clr
elif [[ "$r" == "005" ]] ; then
echo "Can not locate /home/$(whoami) path on your system."
echo "Or installed folder path missing."
echo "This error may also occur in first time installation."
sleep 2
spa
read -p "Press enter to go back and exit: " enter
clr
elif [[ "$r" == "006" ]] ; then
echo "Can not locate /home/$(whoami)/EcoSmart AI Power/bin path on your system."
echo "Or installed folder missing."
echo "This error may also occur in first time installation."
sleep 2
spa
read -p "Press enter to go back and then exit: " enter
clr
elif [[ "$r" == "007" ]] ; then
echo "Can not find the file run.sh on your system."
echo "Or installed file missing."
echo "This error may also occur in first time installation."
sleep 2
spa
read -p "Press enter to go back and then exit: " enter
clr
elif [[ "$r" == "008" ]] ; then
echo "Can not find the file EcoSmart AI Power installation Document.txt on your system."
echo "Or installed file missing."
echo "This error may also occur in first time installation."
sleep 2
spa
read -p "Press enter to go back and then exit: " enter
clr
elif [[ "$r" == "009" ]] ; then
echo "Can not find the installed folder EcoSmart AI Power on your system."
echo "Or installed folder missing."
echo "This error may also occur in first time installation."
spa
read -p "Press enter to go back and then exit: " enter
clr
else
echo "Invalid input"
spa
read -p "Press enter to go back and then exit: " enter
clr
fi
clr
}

hlp()
{
clr
scr
use
spa
echo "Enter your choise between 1 to 7."
echo "Re-install will not work before installing."
echo "Un-install will not work before installing."
echo "Enter error code between 001 to 008."
echo "For some linux distribution root user may not work."
spa
read -p "Press enter to go back and then exit: " enter
clr
}

abo()
{
clr
scr
use
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
read -p "Press enter to go back and then exit: " enter
clr
}

men()
{
clr
spa
use
spa
echo "1.Install"
echo "2.Re-install"
echo "3.Un-install"
echo "4.Error code"
echo "5.Help"
echo "6.About"
echo "7.Exit"
spa
read -p "Enter your choice: " a
if [[ "$a" == "1" ]] ; then
ins
elif [[ "$a" == "2" ]] ; then
rei
elif [[ "$a" == "3" ]] ; then
uni
elif [[ "$a" == "4" ]] ; then
err
elif [[ "$a" == "5" ]] ; then
hlp
elif [[ "$a" == "6" ]] ; then
abo
elif [[ "$a" == "7" ]] ; then
clr
exit 1
else
echo "Invalid input"
sleep 2
spa
read -p "Press enter to restart and then exit:" enter
clr
fi
clr
}

while : then
do
chk
done
