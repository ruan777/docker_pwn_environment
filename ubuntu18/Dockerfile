FROM ubuntu:18.04
ARG APT=mirrors.aliyun.com

WORKDIR root

RUN sed -i "s/security.ubuntu.com/$APT/g" /etc/apt/sources.list && sed -i "s/archive.ubuntu.com/$APT/g" /etc/apt/sources.list && \
    mkdir /root/.pip && echo "[global]\ntrusted-host = mirrors.ustc.edu.cn\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple" > /root/.pip/pip.conf && \
    apt-get update 
RUN apt-get install -y python-pip gdb git wget python3 python3-pip ruby-dev  \
    tmux strace net-tools vim nano 

# set up pwn environment
RUN pip install pwntools && \
    git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && ./setup.sh && \ 
    gem install seccomp-tools && \
    pip install ropper && \
    pip install one_gadget

# run git clone https://github.com/longld/peda.git ~/peda && \
    # echo "source ~/peda/peda.py" >> ~/.gdbinit

CMD [ "/bin/bash" ]