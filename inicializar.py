import random
import os

# file_to_write = open("inicial.txt", "w")
ins_mem = open("ins_mem.txt", "w")
ins_regs = open("ins_regs.txt", "w")
# data_mem = open("data_mem.txt","w")
# for i in range(32):
#     if(i==31):
#         file_to_write.write('{0:064b}'.format(i))
#     else:
#         file_to_write.write('{0:064b}\n'.format(i))

for i in range(64):
    ins_mem.write('0'*2+'\n')
    # data_mem.write('0'*8+'\n')

for i in range(32):
    ins_regs.write('0'*8+'\n')

# file_to_write.close()
# ins_mem.close()
ins_regs.close()
# data_mem.close()


