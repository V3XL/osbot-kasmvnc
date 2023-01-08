FROM kasmweb/core-centos-7:1.12.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### User defined variables ############

# OSBot account details
ENV osbot_username=""
ENV osbot_password=""
ADD . $osbot_username
ADD . $osbot_password

# Bot details
ENV bot_username=""
ENV bot_password=""
ENV bot_pin=0
ENV bot_world=""
ADD . $bot_username
ADD . $bot_password
ADD . $bot_pin
ADD . $bot_world

# Proxy details
ENV proxy_host=""
ENV proxy_port=""
ENV proxy_userame=""
ENV proxy_password=""
ADD . $proxy_username
ADD . $proxy_password

# Script name & parameters
ENV script_name=""
ENV script_parameters=""
ADD . $script_name
ADD . $script_parameters

# Misc settings
ENV norender=0
ENV lowcpu=1
ADD . $norender
ADD . $lowcpu


######### Customize Container Here ###########

# Copy in our custom launch.sh script
ADD launch.sh /home/kasm-user/
RUN chmod +x /home/kasm-user/launch.sh

# Install required packages
RUN yum update -y; yum install curl -y; yum install java-1.8.0-openjdk-devel -y

# Remove GUI panel
#RUN yum remove -y xfce4-panel

# Build the launch command
RUN echo "/usr/bin/desktop_ready && bash /home/kasm-user/launch.sh" > $STARTUPDIR/custom_startup.sh \
&& chmod +x $STARTUPDIR/custom_startup.sh


######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
