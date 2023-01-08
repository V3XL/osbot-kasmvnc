#!/bin/bash


# Download the latest OSBot latest .jar
curl -L -o "/home/kasm-user/OSBot.jar" "http://osbot.org/mvc/get" 

# Set bot options
bot_options=""
if [[ ! -z "$bot_pin" ]]; then
	bot_options="-bot \$bot_username:\$bot_password:\$bot_pin"

else
	bot_options="-bot \$bot_username:\$bot_password:0000"
fi


# Set proxy options
proxy_options=""
if [[ ! -z "$proxy_host" ]] && [[ ! -z "$proxy_port" ]]; then
	proxy_options="-proxy $proxy_host:$proxy_port:$proxy_username:$proxy_password"
fi


# Set misc options
misc_options=""
if [[ "$norender" -eq 1 ]] && [[ "$lowcpu" -eq 0 ]]; then
	misc_options="-allow norender"
fi

if [[ "$norender" -eq 0 ]] && [[ "$lowcpu" -eq 1 ]]; then
        misc_options="-allow lowcpu"
fi

if [[ "$norender" -eq 1 ]] && [[ "$lowcpu" -eq 1 ]]; then
        misc_options="-allow norender,lowcpu"
fi


#Final command
command="/usr/bin/java -jar /home/kasm-user/OSBot.jar --allow nointerface \
-login \$osbot_username:\$osbot_password \
$bot_options \
$proxy_options \
-world \$bot_world \
-script \$script_name:\$script_parameters \
-debug 0 \
$misc_options \
&"


eval $command

