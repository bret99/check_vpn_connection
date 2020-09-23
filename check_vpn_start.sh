notify () {
    notify-send "VPN Message" "$1" -t 5000
}
export notify 

IP=$(curl ifconfig.me)

ip_to_check () {
    IP_TO_CHECK=$(curl ifconfig.me)
    if [ "$IP_TO_CHECK" == "$IP" ]
    then echo ""
    else notify "Exit node changed\nCheck your settings"
    fi
    if [ "$IP_TO_CHECK" == "" ]
    then notify "Can't connect to network" && exit 0
    fi
}

main () {
    while true
    do 
        ip_to_check
        sleep 1.0
    done
}

main
