1) DNS:
- Get all DNS records for domain epam.com. 
```
vagrant@EPUAKHAWO13DT111:~$ dig epam.com any

; <<>> DiG 9.11.3-1ubuntu1.11-Ubuntu <<>> epam.com any
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 50467
;; flags: qr rd ra; QUERY: 1, ANSWER: 185, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;epam.com.                      IN      ANY

;; ANSWER SECTION:
epam.com.               600     IN      A       10.12.0.2
epam.com.               1296000 IN      NS      evbyminsa0000.saratov.epam.com.
epam.com.               1296000 IN      SOA     evuakhasa0003.epam.com. hostmaster.epam.com. 2141654027 900 600 86400 1296000
epam.com.               3600    IN      MX      0 epam-com.mail.protection.outlook.com.
epam.com.               3600    IN      TXT     "/Kt9hPTHTiW3kgtYuqrF/GT/igWbGBXgvwEPAP0oXNuutrZTxAFFzW0opkhpaol4dvEQvxuPY46tQVFte5zFhQ=="

;; Query time: 14 msec
;; SERVER: 127.0.0.53#53(127.0.0.53)
;; WHEN: Thu Apr 30 08:15:29 UTC 2020
;; MSG SIZE  rcvd: 4674
```
- Provide short explanation about each type of DNS records you find.
```
A (Address Mapping) - stores a hostname and its corresponding IPv4 address;
NS (Name Server) - specifies that a DNS Zone, such as "example.com" is delegated to a specific Authoritative Name Server, and provides the address of the name server;
SOA (Start of Authority) - this record appears at the beginning of a DNS zone file, and indicates:
- serial number - used by secondary DNS servers to check if the zone has changed. If the serial number is higher than what the secondary server has, a zone transfer will be initiated;
- refresh Interval - how often secondary DNS servers should check if changes are made to the zone;
- retry Interval - how often secondary DNS server should retry checking if changes are made - if the first refresh fails;
- expire Interval - how long the zone will be valid after a refresh;
- negative cache TTL - used to cache negative responses (such as record does not exist etc.).
MX (Mail exchanger) - specifies an SMTP email server for the domain, used to route outgoing emails to an email server.
TXT (Text) - typically carries machine-readable data such as opportunistic encryption, sender policy framework, etc.
```
2) TELNET: 
Create bash script that interact with mail server via telnet. The script should receive message and recipient as parameters.
- Enable sudo for user comands: iptables, cat, adduser:
```
vagrant@EPUAKHAWO13DT100:~$ sudo bash enable_sudo.sh user "iptables cat adduser"
```
- Enable sudo for user all comands
```
vagrant@EPUAKHAWO13DT100:~$ sudo bash enable_sudo.sh user ANY
```
3) SUDO: Create script that enables sudo permissions for any user I want. Script should receive username and commands that should be allowed as parameters. Special case ANY - means allow everything.

4) ROOT: How to disable switch to root with sudo. I want to disable switch to root with sudo su and similar commands. So all users can run commands only with sudo but can't become root.

5) MVNSET: I want to have new command in system that allows me to set default version of Maven. Example: mvnset 3.6.1 . If version is missing in system the script should install this version and set as default.

6) LOG: Create additional log that includes average system load. You can save this metric every minute, but fell free if you have own suggestions.

