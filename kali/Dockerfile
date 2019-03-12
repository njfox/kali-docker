FROM kalilinux/kali-linux-docker

RUN apt-get update && apt-get dist-upgrade -y && apt autoremove -y

RUN apt-get install -y metasploit-framework man-db exploitdb sqlmap virtualenv python-pip \
    net-tools dnsutils netcat python3-venv vim wpscan proxychains tcpdump dnschef python-ipy \
    theharvester cmake responder

# SSLyze
RUN mkdir -p ~/tools/venvs && cd ~/tools/venvs \
    && python3 -m venv sslyze \
    && . sslyze/bin/activate \
    && pip install --upgrade setuptools \
    && pip install --upgrade sslyze \
    && echo 'alias sslyze="~/tools/venvs/sslyze/bin/sslyze"' >> /root/.bashrc \
    && deactivate

# CrackMapExec
RUN apt-get install -y libssl-dev libffi-dev python-dev build-essential \
    && cd ~/tools/venvs && virtualenv cme \
    && . cme/bin/activate \
    && cd ~/tools && git clone --recursive https://github.com/byt3bl33d3r/CrackMapExec.git \
    && cd CrackMapExec \
    && python setup.py install \
    && deactivate \
    && echo 'alias cme="~/tools/venvs/cme/bin/cme"' >> /root/.bashrc

# Empire
RUN cd ~/tools && git clone https://github.com/EmpireProject/Empire \
    && cd Empire && printf '\n' | ./setup/install.sh \
    && echo 'alias empire="cd ~/tools/Empire && ./empire"' >> /root/.bashrc

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
    && echo 'alias dirsearch="cd ~/tools/dirsearch && python3 ./dirsearch.py"' >> /root/.bashrc

# fuzz.txt
RUN mkdir -p ~/wordlists && cd ~/wordlists \
    && git clone https://github.com/Bo0oM/fuzz.txt
    
# SecLists
RUN mkdir -p ~/wordlists && cd ~/wordlists \
    && git clone https://github.com/danielmiessler/SecLists

WORKDIR /root
