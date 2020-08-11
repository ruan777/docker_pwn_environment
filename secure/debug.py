from pwn import *

context.terminal = ['tmux', 'splitw', '-h']

p = process("./main")

gdb.attach(p)

p.interactive()
