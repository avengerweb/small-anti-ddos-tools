#!/bin/sh
while(true) do
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n > /tmp/ddos.iplist
cat /dev/null > /tmp/iptables_ban.sh
awk '{if ($1 > 9 && $2 != "127.0.0.1" && $2 != "94.141.162.19") {print "ipset -A ipban " $2 }}' /tmp/ddos.iplist >> /tmp/iptables_ban.sh
echo "#$(date +%d_%m_%Y_%H_%M_%S)" >>  /tmp/iptables_ban.sh
bash /tmp/iptables_ban.sh
cat /tmp/iptables_ban.sh
echo "NEXT\n"
sleep 10
done
