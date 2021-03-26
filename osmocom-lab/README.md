# osmocom-lab
2.5G 3G Network LAB - OSMOCOM

# Ubuntu 18.04

## Install


add OSMOCOM Repo
```
apt update && apt upgrade -y
wget https://download.opensuse.org/repositories/network:/osmocom:/latest/Debian_10/Release.key
sudo apt-key add Release.key && rm Release.key
sudo echo "deb https://download.opensuse.org/repositories/network:/osmocom:/latest/xUbuntu_18.04/ ./" > /etc/apt/sources.list.d/osmocom-latest.list
sudo apt-get update
apt-get install libsctp-dev libosmoctrl0 osmo-bsc osmo-stp osmo-msc osmo-hlr osmo-bts-virtual telnet osmo-msc osmo-mgw osmo-stp osmo-bsc osmo-ggsn osmo-sgsn osmo-sip-connector
```
## Configuration
Copy all the ```*.cfg``` file into ```/etc/osmocom/```
Thene disable all services:
```
sudo systemctl disable osmo-hlr osmo-msc osmo-mgw osmo-stp osmo-bsc osmo-ggsn osmo-sgsn osmo-sip-connector osmo-bts-virtual
```
## Run
To start all, don't use ```systemctl restart``` command, use only stop and start:
```
sudo systemctl stop osmo-hlr osmo-msc osmo-mgw osmo-stp osmo-bsc osmo-ggsn osmo-sgsn osmo-sip-connector osmo-bts-virtual
sudo systemctl start osmo-hlr osmo-msc osmo-mgw osmo-stp osmo-bsc osmo-ggsn osmo-sgsn osmo-sip-connector osmo-bts-virtual
```
Check if osmocm is running by using ```ps aux```, there should be all the network elements in the processes list. Otherwise restart them manually:
```
docker exec -it CONTAINER_ID /bin/bash  #Open a bash shell in the container
root@98a94eeee5ac:~# /root/start_osmocom.sh
```


# Installation - Docker

Build a new docker image.

Change dir in osmocom-lab, where the Dockerfile is located, and run:
```
docker build -t "osmocom-lab" .
```
## Run

```
#docker start
docker run -dit --cap-add=NET_ADMIN --device /dev/net/tun:/dev/net/tun "osmocom-lab"
```





# OSMOCOM Config

## STP
```
telnet localhost 4239
```
## HLR
```
telnet localhost 4258
```
### Enable EIR functionality in HLR
```
telnet localhost 4258
OsmoHLR> enable
OsmoHLR# configure terminal
OsmoHLR(config)# hlr
OsmoHLR(config-hlr)# store-imei
OsmoHLR(config-hlr)# exit
OsmoHLR(config)# exit
OsmoHLR# copy running-config startup-config
```

### Add test IMSI and ISDN to HLR
```
telnet localhost 4258
subscriber imsi 001010000666601 create
subscriber imsi 001010000666601 update msisdn 33512341111
subscriber imsi 001010000666601 update aud2g comp128v3 ki 465B5CE8B199B49FAA5F0A2EE238A6BC
subscriber imsi 001010000666602 create
subscriber imsi 001010000666601 update msisdn 33512342222
subscriber imsi 001010000666602 update aud2g comp128v3 ki 465B5CE8B199B49FAA5F0A2EE238A6BC
subscriber imsi 001010000666603 create
subscriber imsi 001010000666603 update msisdn 33512343333
subscriber imsi 001010000666603 update aud2g comp128v3 ki 465B5CE8B199B49FAA5F0A2EE238A6BC
subscriber imsi 001010000666604 create
subscriber imsi 001010000666604 update msisdn 33512344444
subscriber imsi 001010000666604 update aud2g comp128v3 ki 465B5CE8B199B49FAA5F0A2EE238A6BC
```

## BTS-virtual
```
telnet 127.0.0.1 4241
```
## BSC
```
telnet localhost 4242
```
## MSC 
```
telnet localhost 4254
```
## Enable output real time logging
```
enable
logging enable
logging filter all 1
logging color 1
```



