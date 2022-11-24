# linux-xfce4

## Ubuntu version did not work with blow errrors
```
New Xtigervnc server '528a4013f611:99 (ubuntu)' on port 5999 for display :99.
Use xtigervncviewer -SecurityTypes VncAuth -passwd /home/ubuntu/.vnc/passwd :99 to connect to the VNC server.


=================== tail /home/ubuntu/.vnc/528a4013f611:5999.log ===================
/home/ubuntu/.vnc/xstartup: 1: -e: not found
====================================================================================

Session startup via '/home/ubuntu/.vnc/xstartup' cleanly exited too early (< 3 seconds)!

Maybe try something simple first, e.g.,
	tigervncserver -xstartup /usr/bin/xterm
The X session cleanly exited!
Killing Xtigervnc process ID 25... success!
```

