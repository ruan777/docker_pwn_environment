手贱升级了下自己的Ubuntu18.04，导致环境直接崩了，所以搞了个简单的docker环境

## run

```bash
git clone https://github.com/ruan777/docker_pwn_environment.git
# copy challenge to this directory
# such as:
# cp -r /tmp/secure ./
./run.sh
```

进入docker后先执行下`tmux`命令进入到`tmux`，然后就可以和平常一样写脚本，调试了，例子可以见`secure`目录
