FROM alpine:latest

LABEL maintainer="Jhwang <jupil.hwang@gmail.com>"

RUN apk update && apk upgrade \
  && apk add --no-cache bash xfce4 xfce4-terminal python3 firefox git tigervnc \
  #&& rm -rf /var/lib/apt && rm -rf /var/cache/apt && rm -rf /var/lib/dpkg \
  && adduser -h /home/alpine -s /bin/bash -S -D alpine \
  && echo -e "alpine\nalpine" | passwd alpine \
  && echo 'alpine ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
  && git clone https://github.com/novnc/noVNC /opt/noVNC \
  && git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify 

EXPOSE 6080
USER alpine
WORKDIR /home/alpine

RUN mkdir -p /home/alpine/.vnc \
  && echo -e "$!/bin/bash\nstartxfce4 &" > /home/alpine/.vnc/xstartup \
  && chmod a+x /home/alpine/.vnc/xstartup \
  && /bin/bash -c "echo -e 'alpine\nalpine\nn\n' | vncpasswd"; echo ; 

COPY entry.sh /entry.sh
CMD ["/bin/bash", "/entry.sh"]
