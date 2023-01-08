# osbot-kasmvnc

## Run example
```bash
docker run --rm  -it --shm-size=512m -p 6901:6901 -e VNC_PW=password \
-e osbot_username=<username> -e osbot_password=<password> \
-e bot_username=<rsusername> -e bot_password=<rspassword> -e bot_pin=<pin/blank> -e bot_world=<worldnumber> \
-e proxy_host=<proxyaddress> -e proxy_port=<proxyport> -e proxy_username=<proxyusername/blank> -e proxy_password=<proxypassword/blank> \
-e script_name=<script SDN ID> -e script_parameters=<script parameters/blank> \
-e norender=0 -e lowcpu=1 \
v3xl/osbot-kasmvnc:latest
```


View the container by visiting https://container:6901

Username: kasm_user

Password: defined by the VNC_PW variable above. 


If you need to run a local script you'll need to mount a volume to the folder /home/kasm-user/OSbot/Scripts 


## Docker compose example

```yaml
version: '3.8'
services:
  osbot:
    image: v3xl/osbot-kasmvnc:latest
    hostname: osbot  
    environment:
    
    #VNC
      - VNC_PW=password
  
    #OSBot login details
      - osbot_username=<USERNAME>
      - osbot_password=<PASSWORD>
 
    #OSRS details
      - bot_username=
      - bot_password=
      - bot_pin=<BANKPIN> #remove this if not using PIN
      - bot_world=<WORLD>
 
    #Proxy (SOCKS5) details (optional)
      - proxy_host=<PROXY_IP_ADDRESS> 
      - proxy_port=<PROXY_PORT>		   
      - proxy_username=<PROXY_USER>	
      - proxy_password=<PROXY_PASSWORD>	

    #Script details
      - script_name=<SCRIPT NAME for a local script or a SDN ID for a SDN script>
      - script_parameters=<PARAMETERS> #Optional depending on the script

    #Misc 
      - norender=0 #whether to render client or not. 0 = render, 1 = no render 
      - lowcpu=1 #whether or not to use low CPU mode 1 = lowcpu, 0 = normal
 
    ports:
      - 6901:6901
    volumes:
      - /some/folder:/home/kasm-user/OSBot/Scripts:ro #Required if needing to run local scripts

```
