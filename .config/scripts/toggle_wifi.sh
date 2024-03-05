#!/bin/bash
IS_WIFI_OFF=$(nmcli radio| awk '{ print $2 }' | grep desabilitado 2>/dev/null)
if ! [[ $IS_WIFI_OFF ]] ; then
  nmcli radio wifi off
else 
  nmcli radio wifi on
fi