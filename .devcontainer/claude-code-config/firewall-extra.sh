#!/bin/sh

# extra firewall rules here, to tweak post - https://github.com/anthropics/claude-code/blob/main/.devcontainer/init-firewall.sh

# don't allow SSH out
echo "not accepting SSH out"
iptables -D OUTPUT -p tcp --dport 22 -j ACCEPT
iptables -D INPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

# allow DNS only to our nameserver
NS_IP=$(grep nameserver /etc/resolv.conf | awk '{ print $2 }')
echo "permitting DNS only to our nameserver ${NS_IP}"
iptables -D OUTPUT -p udp --dport 53 -j ACCEPT
iptables -D INPUT -p udp --sport 53 -j ACCEPT
iptables -I OUTPUT 1 -p udp -d ${NS_IP} --dport 53 -j ACCEPT
iptables -I INPUT 1 -p udp -s ${NS_IP} --sport 53 -j ACCEPT

# list all the rules in the tables we are concerned with
for table in filter nat mangle; do echo "====${table}====" ; iptables -t ${table} -L -n -v --line-numbers ; done
