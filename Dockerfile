FROM ubuntu:22.04

# Setup
RUN DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Ho_Chi_Minh
RUN apt-get update && apt-get install -y tzdata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y python3 python3-pip python3-dev build-essential libssl-dev libffi-dev gnutls-dev curl wget git openssh-server sudo

# Start SSH service
RUN service ssh start
# SSH root login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN service ssh restart

# AApanel
RUN wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh 
RUN echo 'echo -e "y\nn\n" | bash install.sh aapanel' > inst.sh
RUN bash inst.sh
RUN /www/server/panel/pyenv/bin/python3.7 -m pip install --upgrade pip

# Entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
COPY restart.sh /restart.sh
RUN ["chmod", "+x", "/restart.sh"]
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

# Expose
EXPOSE 7800 21 22 443 80 888
