#!/bin/bash
NC='\033[37m'
RED='\033[1;38;5;196m'
GREEN='\033[1;38;5;040m'
ORANGE='\033[1;38;5;202m'
BLUE='\033[1;38;5;012m'
BLUE2='\033[1;38;5;032m'
PINK='\033[1;38;5;013m'
GRAY='\033[1;38;5;004m'
NEW='\033[1;38;5;154m'
YELLOW='\033[1;38;5;214m'
CG='\033[1;38;5;087m'
CP='\033[1;38;5;221m'
CPO='\033[1;38;5;205m'
CN='\033[1;38;5;247m'
CNC='\033[1;38;5;051m'

function banner(){  
echo -e ${RED}""                                                 
echo -e ${RED}"   ███████╗███╗   ███╗███████╗      ███████╗███████╗███╗   ██╗██████╗ ███████╗██████╗ "
echo -e ${RED}"   ██╔════╝████╗ ████║██╔════╝      ██╔════╝██╔════╝████╗  ██║██╔══██╗██╔════╝██╔══██╗"
echo -e ${RED}"   ███████╗██╔████╔██║███████╗█████╗███████╗█████╗  ██╔██╗ ██║██║  ██║█████╗  ██████╔╝"
echo -e ${RED}"   ╚════██║██║╚██╔╝██║╚════██║╚════╝╚════██║██╔══╝  ██║╚██╗██║██║  ██║██╔══╝  ██╔══██╗"
echo -e ${RED}"   ███████║██║ ╚═╝ ██║███████║      ███████║███████╗██║ ╚████║██████╔╝███████╗██║  ██║"
echo -e ${RED}"   ╚══════╝╚═╝     ╚═╝╚══════╝      ╚══════╝╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═╝"
echo -e ${RED}"                                                                                      "
echo -e ${RED}""                                              
echo -e ${RED}" [${NC}-${RED}]${BLUE} Tool Created by Alb[E]rTTz"
echo -e ${BlUE}""
echo -e ${RED}" [${NC}-${RED}]${GREEN} https://github.com/UQK-ja-E-Drenicess"

}
resize -s 38 70 > /dev/null
function dependencies(){
echo -e ${PINK}
cat /etc/issue.net


echo " Checking dependencies configuration " 
sleep 1
if [[ "$(ping -c 1 8.8.8.8 | grep '100% packet loss' )" != "" ]]; then
  echo ${RED}" Nuk ka lidhje interneti"
  exit 1
  else
  echo -e ${GREEN} "\n[ ✔ ] Internet.............${GREEN}[ working ]"
fi
sleep 1
which curl > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] curl.............${GREEN}[ found ]"
else
echo -e $red "[ X ] curl  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing curl "
sudo apt-get install curl
echo -e ${BLUE} "[ ✔ ] Done installing ...."
fi
sleep 1
which git > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] git.............${GREEN}[ found ]"
else
echo -e $red "[ X ] git  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing git "
pkg update && pkg upgrade  > /dev/null 2>&1
pkg install git > /dev/null 2>&1
echo -e ${BLUE} "[ ✔ ] Done installing ...."
which git > /dev/null 2>&1
sleep 1
fi
sleep 1
}

function printmsg(){
echo  -e ${RED}" Ju po dilni nga DËRGUESI FAKE-SMS... "
sleep 1
echo -e ${ORANGE}" Shihemi heren tjeter!............."
exit
}

function instruction(){

echo -e ${YELLOW}"\n 1. Kodi juaj i shtetit duhet të jetë pa "+"\n"
sleep 0.5
echo -e ${BLUE}" 2. Shembull Kodi i Shtetit: 92\n"
sleep 0.5
echo -e ${ORANGE}" 3. Numri juaj i telefonit duhet të fillojë pa 0\n"
sleep 0.5
echo -e ${CNC}" 4. Shembull përdorimi i plotë: 923443210111\n"
sleep 0.5
echo -e ${RED}"  ..........NOTE: Lejohet vetëm një mesazh me tekst në ditë...........\n"
sleep 0.5
echo -e -n ${BLUE}"\n Kthehu te OPSIONI SENDSMS: [y/n]:${NC} "
read back_press
if [ $back_press = "y"  ]; then
         SENDSMS
elif [ $back_press = "n" ]; then
              exit
     fi


}

function SENDSMS() {
    clear
    banner
    echo ""
   echo -e ${ORANGE}" Shkruani Numrin e Telefonit me kodin e shtetit psh (923441212012)\n"
   echo -e -n ${CP}" Shkruani Numrin e Telefonit me kodin e shtetit:${NC} "
   
   read num
   
   echo "  "
   echo -e -n ${BLUE}" Shkruaj mesazhin:${NC} "
   
   read msg


   SMSVERIFY=$(curl -# -X POST https://textbelt.com/text --data-urlencode phone="$num" --data-urlencode message="$msg" -d key=textbelt)
   
   if grep -q true <<<"$SMSVERIFY"
   
   then
      
      echo "  "
      echo -e ${CNC}" .....Sukses "
      echo "  "
      echo -e ${CNC}" ---------------------------------------------- "
      echo "$SMSVERIFY"
      echo -e ${CNC}" ---------------------------------------------- "
      echo "  "
      printmsg
   else
      
      echo "  "
      echo -e ${RED}" Deshtoi "
      echo "  "
      echo -e ${CNC}" ---------------------------------------------- "
      echo "$SMSVERIFY"
      echo -e ${CNC}" ---------------------------------------------- "
      echo " "
      printmsg
   fi
}
function STATUSCHECK(){
echo -e -n ${ORANGE}"\n Shkruaj id'n e Textit (psh 123456):${NC} "
read ID
STATUSCONFIRM=$(curl -# https://textbelt.com/status/"$ID")
echo -e ${PINK}" Përgjigja përfundimtare (JSON): "
   echo " "
   echo -e ${PINK}" ---------------------------------------------- $NC"
   echo "$STATUSCONFIRM"
   echo -e ${PINK}"------------------------------------------------- $NC"
}
trap ctrl_c INT
ctrl_c() {
clear
echo -e ${RED}" [*] (Ctrl + C ) U zbulua, duke u përpjekur të dilni... "
echo -e ${RED}" [*] Ndalimi i shërbimeve... "
sleep 1
echo ""
echo -e ${YELLOW}" [*] Faleminderit për përdorimi FAKE-SMS  :)"
exit
}


menu(){

clear
dependencies
clear
banner


echo -e " \n ${RED}[${NC}01${RED}]${BLUE} SHIKO PËRDORIMIN "
echo -e " ${RED}[${NC}02${RED}]${BLUE} DERGO NJE SMS"
echo -e " ${RED}[${NC}03${RED}]${BLUE} SHIKO STATUSIN E SMS "
echo -e " ${RED}[${NC}04${RED}]${BLUE} DIL "
echo -n -e ${RED}"\n [${GREEN}+${RED}] ${GREEN}ZGJEDH:${NC} "
read play
   if [ $play -eq 1 ]; then
          instruction
   elif [ $play -eq 2 ]; then
          SENDSMS
   elif [ $play -eq 3 ]; then
          STATUSCHECK
   elif [ $play -eq 4 ]; then
          exit
         
      fi
}
menu
