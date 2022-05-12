#!/bin/bash

function iambluez () {

	cls; rfkill unblock bluetooth; 
	rfkill && sleep 3; 
	bluetoothctl power on; 
	bluetoothctl agent on;

	if [ ! $# -eq 0 ] ; then
	   # This part can be configured to your personal Bluetooth devices.
	   if [ "$1" = 'headset' ] ; then
		f(){ while ! $ bluetoothctl scan on | grep -q "00:00:00:00:00:00"; do true; done };
	        bluetoothctl connect 00:00:00:00:00:00;
	   elif [ ! "$1" = 'headset' ] && [ ! $# -eq 0 ] ; then
	        {  f(){ while ! $ bluetoothctl scan on | grep -q "$1"; do true; done };
	          bluetoothctl connect "$1";
	        } || {
	           echo "Error: Something went wrong."
	        }
	        f () { while $ sleep 10; do echo bluetoothctl scan on; done };
           fi
        else
	    timeout 10 bluetoothctl scan on; 
	fi       
	   
}



