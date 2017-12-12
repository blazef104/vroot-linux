#!/bin/bash
set -e
source /build/buildconfig
set -x

## Often used tools.
$minimal_apt_get_install curl less nano vim psmisc tcpdump iputils-ping \
iputils-arping iputils-tracepath net-tools file telnet isc-dhcp-client nmap \
dnsutils netcat man dsniff traceroute ettercap-text-only tcpreplay hping3 p0f \
lsof strace elinks iperf iftop scapy bsd-mailx ndisc6 radvd iptables tayga ftp \
flex bison g++ wget libpcap-dev make libpcre3-dev zlib1g-dev

wget https://www.snort.org/downloads/snort/daq-2.0.6.tar.gz --no-check-certificate
wget https://www.snort.org/downloads/snort/snort-2.9.11.tar.gz --no-check-certificate
wget http://prdownloads.sourceforge.net/libdnet/libdnet-1.11.tar.gz --no-check-certificate

tar xvfz daq-2.0.6.tar.gz
cd daq-2.0.6
./configure && make && make install
cd ..
rm daq-2.0.6.tar.gz
rm -rf daq-2.0.6

tar xvfz libdnet-1.11.tar.gz
cd libdnet-1.11
./configure && make && make install
cd ..
rm libdnet-1.11.tar.gz
rm -rf libdnet-1.11.tar.gz

tar xvfz snort-2.9.11.tar.gz
cd snort-2.9.11
./configure --enable-sourcefire && make && make install
cd ..
rm snort-2.9.11.tar.gz
rm -rf snort-2.9.11

ln -s /usr/local/lib/libdnet.1.0.1 /usr/lib/libdnet.1
