#!/usr/bin/env bash
# Scott Galloway
# Firewall Script

ipt="/sbin/iptables"
ip6t="/sbin/ip6tables"

# Set Drop Policies as default
"${ipt}" -P OUTPUT DROP
"${ipt}" -P INPUT DROP
"${ipt}" -p FORWARD DROP

"${ip6t}" -P OUTPUT DROP
"${ip6t}" -P INPUT DROP
"${ip6t}" -p FORWARD DROP

# Create Filter Chains
"${ipt}" -N LOG
"${ipt}" -F LOG




# Log remaining packets

