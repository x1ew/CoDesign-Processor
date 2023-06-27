import re

inputs = []
while True:
    line = input()
    if line:
        inputs.append(line)
        if line.lower() == 'hlt':
            break
    else:
        break
reg = r"^(\w+:)?\s*(\w+)\s+(\w+)\s*,\s*(-?\d+|\w+)$"
outputs = []
dict = {}
for i in inputs:
    match = re.match(reg, i)
    if match:
        groups = list(match.groups())
        f_groups = list(filter(None, groups))
        opcode = f_groups[1] if ":" in f_groups[0] else f_groups[0]
        arg1 = f_groups[2] if ":" in f_groups[0] else f_groups[1]
        arg2 = f_groups[3] if ":" in f_groups[0] else f_groups[2]
        lable = f_groups[0] if ":" in f_groups[0] else None
    else:
        if i.lower() == 'hlt':
            opcode = 'hlt'
        else:
            print('ajghal')
    if lable != None:
        lable = lable[:-1]
        dict[lable] = len(outputs)
    if opcode.lower() == 'load':
        outputs.append('000' + str(bin(int(arg1[1]))[2:].zfill(2)) + '11')
        outputs.append(str(bin(int(arg2))[2:].zfill(7)))
    elif opcode.lower() == 'add':
        outputs.append('001' + str(bin(int(arg1[1]))[2:].zfill(2)) + str(bin(int(arg2[1]))[2:].zfill(2)))
    elif opcode.lower() == 'sub':
        outputs.append('010' + str(bin(int(arg1[1]))[2:].zfill(2)) + str(bin(int(arg2[1]))[2:].zfill(2)))
    elif opcode.lower() == 'jnz':
        outputs.append('011' + str(bin(int(arg1[1]))[2:].zfill(2)) + '00')
        outputs.append(str(bin(int(dict[arg2]))[2:].zfill(7)))
    elif opcode.lower() == 'mul':
        outputs.append('100' + str(bin(int(arg1[1]))[2:].zfill(2)) + str(bin(int(arg2[1]))[2:].zfill(2)))
    elif opcode.lower() == 'hlt':
        outputs.append('0000000')
        
print('\n'.join(outputs))
    


    
    
    