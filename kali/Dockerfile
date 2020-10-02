FROM kalilinux/kali-linux-docker

RUN apt-get update && apt-get dist-upgrade -y && apt autoremove -y

RUN apt-get install -y metasploit-framework man-db exploitdb sqlmap virtualenv \
    net-tools dnsutils netcat python3-venv vim wpscan proxychains tcpdump dnschef python3-ipy \
    theharvester cmake responder nikto python3-libnmap snmpcheck screen ike-scan gobuster hydra \
    brutespray sslyze dirbuster mlocate smbclient ntp mitmproxy

RUN mkdir -p /root/tools/venvs

# CrackMapExec
RUN python3 -m pip install pipx \
  && pipx install crackmapexec \
  && /bin/bash -c "echo -e 'export PATH=$PATH:/root/.local/bin' >> ~/.bashrc" 

# GDB PEDA
RUN cd ~/tools \
    && apt-get install -y gdb \
    && git clone https://github.com/longld/peda \
    && echo "source ~/tools/peda/peda.py" >> ~/.gdbinit

# Golang
RUN apt-get install -y golang \
    && /bin/bash -c "echo -e 'export GOPATH=$HOME/go' >> ~/.bashrc" \
    && /bin/bash -c "echo -e 'export PATH=${PATH}:$HOME/go/bin' >> ~/.bashrc"

# digcaa
RUN /bin/bash -c "source ~/.bashrc && go get github.com/weppos/dnscaa/cmd/digcaa"

# Interlace
RUN cd ~/tools \
    && git clone https://github.com/codingo/interlace \
    && cd interlace && python3 setup.py install

# Dirsearch
RUN cd ~/tools \
    && git clone https://github.com/maurosoria/dirsearch \
    && echo '#!/bin/bash' >> /usr/local/bin/dirsearch \
    && echo 'cd ~/tools/dirsearch && python3 ./dirsearch.py "$@"' >> /usr/local/bin/dirsearch \
    && chmod +x /usr/local/bin/dirsearch

# Unicorn
RUN cd ~/tools \
    && git clone https://github.com/trustedsec/unicorn \
    && echo '#!/bin/bash' >> /usr/local/bin/unicorn \
    && echo 'cd ~/tools/unicorn && python3 ./unicorn.py "$@"' >> /usr/local/bin/unicorn \
    && chmod +x /usr/local/bin/unicorn

# rdp-sec-check
RUN apt-get update && apt-get install -y perl build-essential \
    && /bin/bash -c "PERL_MM_USE_DEFAULT=1 cpan install Encoding::BER" \
    && cd ~/tools && git clone https://github.com/portcullislabs/rdp-sec-check \
    && cp rdp-sec-check/rdp-sec-check.pl /usr/local/bin/rdp-sec-check \
    && chmod +x /usr/local/bin/rdp-sec-check

# fuzz.txt
RUN mkdir -p ~/wordlists && cd ~/wordlists \
    && git clone https://github.com/Bo0oM/fuzz.txt
    
# SecLists
RUN mkdir -p ~/wordlists && cd ~/wordlists \
    && git clone https://github.com/danielmiessler/SecLists

# aquatone
RUN apt-get update && apt-get install -y chromium \
    && cd ~/tools \
    && git clone https://github.com/michenriksen/aquatone \
    && cd aquatone \
    && /bin/bash -c "source ~/.bashrc && go get -d ./..." \
    && /bin/bash -c "source ~/.bashrc && GOOS=linux GOARCH=amd64 go build -o aquatone ." \
    && mv aquatone /usr/local/bin

# tmux
RUN apt-get update && apt-get install -y tmux \
    && echo 'set -g mouse on' >> /root/.tmux.conf

# LUCKYMINUS20 POC/Scanner
RUN /bin/bash -c "source ~/.bashrc && go get github.com/FiloSottile/CVE-2016-2107"

# mitm6
RUN python3 -m pip install mitm6

# impacket
RUN apt-get update && apt-get install -y python3-pyasn1 python3-pycryptodome python3-openssl python3-ldap3 python3-flask python3-ldapdomaindump \
    && cd ~/tools && git clone https://github.com/SecureAuthCorp/impacket \
    && cd impacket \
    && pip3 install .

# boofuzz
RUN python3 -m pip install boofuzz

# snmpwn
RUN apt-get install -y snmp \
    && cd ~/tools && git clone https://github.com/hatlord/snmpwn.git \
    && cd snmpwn \
    && gem install bundler && bundle install \
    && ln -s snmpwn.rb /usr/local/bin/snmpwn

WORKDIR /root
