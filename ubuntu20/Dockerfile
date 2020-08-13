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

# set up zsh
ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

RUN apt install -y zsh && \
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh


RUN sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/" ~/.zshrc && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    sed -i "s/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/" ~/.zshrc

RUN chsh -s /bin/zsh

CMD [ "/bin/zsh" ]
