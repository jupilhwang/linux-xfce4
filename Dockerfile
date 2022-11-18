FROM ubuntu:latest

LABEL maintainer="Jhwang <jupil.hwang@gmail.com>"

RUN apt-get update && apt-get -y upgrade \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install bash xfce4 xfce4-terminal python3 firefox git tigervnc-standalone-server \
  && rm -rf /var/lib/apt && rm -rf /var/cache/apt && rm -rf /var/lib/dpkg \
  && adduser ubuntu && echo "ubuntu:ubuntu" | chpasswd \
  && echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
  && git clone https://github.com/novnc/noVNC /opt/noVNC \
  && git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify 

EXPOSE 6080
USER ubuntu
WORKDIR /home/ubuntu

RUN mkdir -p /home/ubuntu/.vnc \
  && echo -e "$!/bin/bash\nstartxfce4 &" > /home/ubuntu/.vnc/xstartup \
  && chmod a+x /home/ubuntu/.vnc/xstartup \
  && /bin/bash -c "echo -e 'ubuntu\nubuntu\nn\n' | vncpasswd"; echo ; 

COPY entry.sh /entry.sh
CMD ["/bin/bash", "/entry.sh"]
