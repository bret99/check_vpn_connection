ps -ef | grep "check_vpn_start.sh" | awk '{print $2}'| xargs kill 9
