notify () {
    notify-send "VPN Message" "$1" -t 5000
}
export notify 

IP=$(curl ifconfig.me)

ip_to_check () {
    IP_TO_CHECK=$(curl ifconfig.me)
    if [ "$IP_TO_CHECK" == "$IP" ]
    then echo ""
    elif [ "$IP_TO_CHECK" == ""  ]
    then notify "Can't connect to internet\nPlease check your settings" && exit 0
    else notify "Exit node changed\nCheck your settings"
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
