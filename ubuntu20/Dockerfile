FROM ubuntu:20.04
ARG APT=mirrors.tuna.tsinghua.edu.cn

WORKDIR root

RUN sed -i "s/security.ubuntu.com/$APT/g" /etc/apt/sources.list && sed -i "s/archive.ubuntu.com/$APT/g" /etc/apt/sources.list && \
    mkdir /root/.pip && echo "[global]\ntrusted-host = mirrors.ustc.edu.cn\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple" > /root/.pip/pip.conf && \
    apt-get update 

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y  gdb git wget python3 python3-pip ruby-dev  \
    tmux strace net-tools vim nano 

# set up pwn environment
RUN pip3 install pwntools

RUN git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && ./setup.sh 
RUN gem install seccomp-tools && \
    pip3 install ropper && \
    pip3 install one_gadget

# run git clone https://github.com/longld/peda.git ~/peda && \
    # echo "source ~/peda/peda.py" >> ~/.gdbinit

CMD [ "/bin/bash" ]
