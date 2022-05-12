#!/bin/bash



function iamblueDaDaBee () {

	cls; rfkill unblock bluetooth; 
	rfkill && sleep 3; 
	bluetoothctl power on; 
	bluetoothctl agent on;

	if [ ! $# -eq 0 ] ; then
	   if [ "$1" = 'headset' ] ; then
	        f(){ while ! $ bluetoothctl scan on | grep -q "74:45"; do true; done };
			echo -e "\n ---  I'm blue! Da ba dee, da ba daa!  --- \n"; 
	        bluetoothctl connect 74:45:CE:7E:90:04;
	   elif [ ! "$1" = 'headset' ] && [ ! $# -eq 0 ] ; then
	        {  f(){ while ! $ bluetoothctl scan on | grep -q "$1"; do true; done };
	          echo "Pink fluffy unicorn!"; 
	          bluetoothctl connect "$1";
	        } || {
	           echo "error"
	        }
	        echo "woop woop"
	        f () { while $ sleep 10; do echo bluetoothctl scan on; done };
           fi
        else
	    echo "old mcdonald had a farm, heyo heyo oh!";
	    timeout 10 bluetoothctl scan on; 
	    
	    # f () { while $  sleep 10; do echo bluetoothctl scan on; done };
	fi       
	   
}



