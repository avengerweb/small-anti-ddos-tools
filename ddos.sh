#!/bin/sh
while(true) do
# находим все соединения и записываем их во временный файл ddos.iplist в каталоге tmp
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n > /tmp/ddos.iplist

# очищаем скрипт бана айпишников
cat /dev/null > /tmp/iptables_ban.sh

# создаем DROP правила для 50 самых агрессивных ботов
awk '{if ($1 > 60 && $2 != "127.0.0.1" && $2 != "94.141.162.19") {print "ipset -A ipban " $2 }}' /tmp/ddos.iplist >> /tmp/iptables_ban.sh

# следующая строка нужна только для того, чтобы создавался файл с просмотром всех правил iptables
#echo "/sbin/iptables -L INPUT -v -n > /tmp/iptables.log" >> /tmp/iptables_ban.sh
echo "#$(date +%d_%m_%Y_%H_%M_%S)" >>  /tmp/iptables_ban.sh
# запускаем скрипт бана айпишников
bash /tmp/iptables_ban.sh
cat /tmp/iptables_ban.sh
echo "NEXT\n"
sleep 10
done
