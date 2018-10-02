FROM kalilinux/kali-linux-docker

RUN apt-get update && apt-get dist-upgrade -y && apt autoremove -y

RUN apt-get install -y metasploit-framework man-db exploitdb sqlmap virtualenv python-pip \
    net-tools dnsutils netcat python3-venv vim

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
#RUN cd ~/tools/venvs && virtualenv empire \
#    && . empire/bin/activate \
#    && cd ~/tools && git clone https://github.com/EmpireProject/Empire \
#    && cd Empire && printf '\n' | ./setup/install.sh \
#    && echo 'alias empire=". ~/tools/venvs/empire/bin/ && cd ~/tools/Empire && ./empire"' >> /root/.bashrc \
#    && deactivate

# GDB PEDA
RUN cd ~/tools \
    && apt-get install -y gdb \
    && git clone https://github.com/longld/peda \
    && echo "source ~/tools/peda/peda.py" >> ~/.gdbinit

# MSF Database
RUN echo 'alias msfconsole="msfconsole --quiet -x \"db_connect msf@msf\""' >> /root/.bashrc
