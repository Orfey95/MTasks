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
Create bash script that interact with mail server via telnet. The script should receive message and recipient as parameters. <br>
Script parameters:
- SMTP mail server. Example: mail_server;
- Email of recipient. Example: recipient@gmail.com;
- Text of email. Example: "Hello world!".
```
vagrant@EPUAKHAWO13DT100:~$ bash telnet_mail.sh mail_server recipient@gmail.com "Hello world!"
```
3) SUDO: Create script that enables sudo permissions for any user I want. Script should receive username and commands that should be allowed as parameters. Special case ANY - means allow everything. <br>
Script parameters:
- Username. Example: user;
- Commands. Example: "iptables cat adduser". 

Example 1. Enable sudo for commands: iptables, cat, adduser:
```
vagrant@EPUAKHAWO13DT100:~$ sudo bash enable_sudo.sh user "iptables cat adduser"
```
Example 2. Enable sudo for all commands
```
vagrant@EPUAKHAWO13DT100:~$ sudo bash enable_sudo.sh user ANY
```
4) ROOT: How to disable switch to root with sudo. I want to disable switch to root with sudo su and similar commands. So all users can run commands only with sudo but can't become root.
Script parameters:
- Username. Example: user.
```
vagrant@EPUAKHAWO13DT100:~$ sudo bash disenable_su_root.sh user
```
5) MVNSET: I want to have new command in system that allows me to set default version of Maven. Example: mvnset 3.6.1 . If version is missing in system the script should install this version and set as default.

### Required Installed:
- Java (jdr or jre);
- Maven.

### MVNSET version 1 ($PATH)

- Install mvnset version 1
```
curl https://raw.githubusercontent.com/Orfey95/MTasks/master/Task1/mvnset_install.sh | sudo bash -s 1
```
- Set Maven version
```
vagrant@EPUAKHAWO13DT100:~$ sudo mvnset -m 3.6.1
```
- Set Maven version and skip answer
```
vagrant@EPUAKHAWO13DT100:~$ sudo mvnset -m 3.6.1 -y
```
- Get help
```
vagrant@EPUAKHAWO13DT100:~$ mvnset -h

NAME
                mvnset - set default maven version

SYNOPSIS
                -m, --mvn_version
                                choose Maven version
                -y, --yes
                                set answer install required version in YES
                -h, --help
                                get command help
                -v, --version
                                get mvnset version

DESCRIPTION
                This utility sets the default value of maven.
                For the changes made by the team to take effect, you must reload the shell
                or run the command: source $HOME/.profile
```
- Get mvnset version
```
vagrant@EPUAKHAWO13DT100:~$ mvnset -v
mvnset version 1.0.0
```
### MVNSET version 2 (update-alternatives)

- Install mvnset version 2
```
curl https://raw.githubusercontent.com/Orfey95/MTasks/master/Task1/mvnset_install.sh | sudo bash -s 2
```
- Set Maven version
```
vagrant@EPUAKHAWO13DT100:~$ sudo mvnset2 -m 3.6.1
```
- Set Maven version and skip answer
```
vagrant@EPUAKHAWO13DT100:~$ sudo mvnset2 -m 3.6.1 -y
```
- Get help
```
vagrant@EPUAKHAWO13DT100:~$ mvnset2 -h

NAME
                mvnset - set default maven version

SYNOPSIS
                -m, --mvn_version
                                choose Maven version
                -y, --yes
                                set answer install required version in YES
                -h, --help
                                get command help
                -v, --version
                                get mvnset version

DESCRIPTION
                This utility sets the default value of maven.
```
- Get mvnset version
```
vagrant@EPUAKHAWO13DT100:~$ mvnset2 -v
mvnset version 2.0.0
```
6) LOG: Create additional log that includes average system load. You can save this metric every minute, but fell free if you have own suggestions.
```
vagrant@EPUAKHAWO13DT100:~$ echo "*/1 * * * * root uptime > /dev/null 2>&1 >> /var/log/avg_load.log" | sudo tee -a /etc/crontab
```
Result:
```
vagrant@EPUAKHAWO13DT100:~$ cat /var/log/avg_load
 13:02:01 up 13 min,  1 user,  load average: 0.01, 0.02, 0.03
 13:03:01 up 14 min,  1 user,  load average: 0.00, 0.02, 0.02
 13:04:01 up 15 min,  1 user,  load average: 0.00, 0.01, 0.01
 13:05:01 up 16 min,  1 user,  load average: 0.00, 0.01, 0.01
 13:06:01 up 17 min,  1 user,  load average: 0.00, 0.00, 0.00
 13:07:01 up 18 min,  1 user,  load average: 0.00, 0.00, 0.00
 13:08:01 up 19 min,  1 user,  load average: 0.00, 0.00, 0.00
 13:09:01 up 20 min,  1 user,  load average: 0.00, 0.00, 0.00
```

