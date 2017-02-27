#!/bin/bash

if [[ -z "$1" ]]; then
  INTERFACE=(en0)
else
  INTERFACE=$1
fi
for ITEM in ${INTERFACE[*]}; do
  echo "Trying interface ${ITEM}"
  LOCAL_IP=$(ifconfig ${ITEM} | grep inet | grep -v inet6 | awk '{print $2}')
  if [[ -n ${LOCAL_IP} ]]; then
    echo "Using interface ${ITEM}"
    break
  fi
done
REMOTE_IP=166.111.21.1
LINK_PREFIX=fe80::200:5efe
GLOBAL_PREFIX=2402:f000:1:1501:200:5efe
ifconfig gif0 destroy 2> /dev/null
PUBLIC_IP=$(curl -s -4 icanhazip.com)
echo "Public IP: ${PUBLIC_IP}, Local IP: ${LOCAL_IP}"
ifconfig gif0 create
ifconfig gif0 tunnel ${LOCAL_IP} ${REMOTE_IP}
ifconfig gif0 inet6 ${LINK_PREFIX}:${PUBLIC_IP} prefixlen 64
ifconfig gif0 inet6 ${GLOBAL_PREFIX}:${PUBLIC_IP} prefixlen 64
route delete -inet6 default &> /dev/null
route add -inet6 default ${GLOBAL_PREFIX}:${REMOTE_IP} > /dev/null
