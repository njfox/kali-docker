FROM kalilinux/kali-linux-docker

RUN apt-get update && apt-get dist-upgrade -y && apt autoremove -y

RUN apt-get install -y metasploit-framework man-db exploitdb sqlmap virtualenv python-pip \
    net-tools dnsutils netcat

# SSLyze
RUN pip install --upgrade setuptools \
    && pip install --upgrade sslyze

# CrackMapExec
RUN apt-get install -y libssl-dev libffi-dev python-dev build-essential \
    && mkdir ~/tools && cd ~/tools \
    && git clone --recursive https://github.com/byt3bl33d3r/CrackMapExec.git \
    && cd CrackMapExec \
    && python setup.py install

# Empire
RUN cd ~/tools \
    && git clone https://github.com/EmpireProject/Empire \
    && cd Empire && printf '\n' | ./setup/install.sh \
    && echo 'alias empire="cd ~/tools/Empire && ./empire"' >> /root/.bashrc

# GDB PEDA
RUN cd ~/tools \
    && git clone https://github.com/longld/peda \
    && echo "source ~/tools/peda/peda.py" >> ~/.gdbinit

# MSF Database
RUN echo 'alias msfconsole="msfconsole --quiet -x \"db_connect msf@msf\""' >> /root/.bashrc
