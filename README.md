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


View the container by visiting https://<IPaddress>:6901

Username: kasm_user

Password: defined by the VNC_PW variable above. 

## Docker compose example

