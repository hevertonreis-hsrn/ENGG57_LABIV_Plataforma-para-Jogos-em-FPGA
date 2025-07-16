# core/processor.py


class Processor:
    def __init__(self, memory):
        self.registers = [0] * 32  # R0-R31
        self.flags = {
            "overflow": 0,
            "above": 0,
            "equal": 0,
            "below": 0,
            "between": 0,
            "collision": 0,
            "error": 0,
            "interrupt": 0,
        }
        self.PC = 0
        self.memory = memory
        self.halted = False
        self.stack = []
        # Interrupções 
        self.interrupt_vector = [0] * 16  # vetor da interrupção
        self.interrupt_enabled = True  # status da interrupção

    def reset(self):
        self.registers = [0] * 32
        self.PC = 0
        self.halted = False
        for key in self.flags:
            self.flags[key] = 0

    def step(self):
        instr = self.memory.get_instruction(self.PC)
        self.execute(instr)
        self.PC += 1

    def run(self, max_steps=1000):
        steps = 0
        while not self.halted and steps < max_steps:
            self.step()
            steps += 1
        if steps == max_steps:
            print("Warning: Max steps reached. Possible infinite loop.")

    def execute(self, instr):
        opcode, *args = instr.strip().split()
        print(f"PC: {self.PC}, Executing: {opcode} {args}")

        # Types of instructions
        match opcode:
            # Data transfer instructions
            case "LW":
                rd = self._reg_index(args[0])
                offset, rb = self._parse_mem_ref(args[1])
                addr = self.registers[rb] + offset
                self.registers[rd] = self.memory.load(addr)

            case "SW":
                rs = self._reg_index(args[0])
                offset, rb = self._parse_mem_ref(args[1])
                addr = self.registers[rb] + offset
                self.memory.store(addr, self.registers[rs])

            case "MOV":
                rd, rs = map(self._reg_index, args)
                self.registers[rd] = self.registers[rs]

            # Arithmetic instructions
            case "ADD":
                rd, rs = map(self._reg_index, args)
                self.registers[rd] += self.registers[rs]

            case "SUB":
                rd, rs = map(self._reg_index, args)
                self.registers[rd] -= self.registers[rs]

            case "MUL":
                rd, rs = map(self._reg_index, args)
                self.registers[rd] *= self.registers[rs]

            case "DIV":
                rd, rs = map(self._reg_index, args)
                if self.registers[rs] == 0:
                    print("Division by zero error")
                    self.flags["error"] = 1
                    self.halted = True
                else:
                    self.registers[rd] //= self.registers[rs]

            # Logical instructions
            case "AND":
                rd, rs = map(self._reg_index, args)
                self.registers[rd] &= self.registers[rs]

            case "OR":
                rd, rs = map(self._reg_index, args)
                self.registers[rd] |= self.registers[rs]

            case "SHL":
                rd, rs = map(self._reg_index, args)
                self.registers[rd] <<= self.registers[rs]

            case "SHR":
                rd, rs = map(self._reg_index, args)
                self.registers[rd] >>= self.registers[rs]

            case "CMP":
                rd, rs = map(self._reg_index, args)
                if self.registers[rd] == self.registers[rs]:
                    self.flags["equal"] = 1
                elif self.registers[rd] > self.registers[rs]:
                    self.flags["above"] = 1
                else:
                    self.flags["below"] = 1

            case "NOT":
                rd, rs = map(self._reg_index, args)
                self.registers[rd] = ~self.registers[rs]

            # Transfer of Control
            case "JR":
                offset = int(args[0])
                self.PC = (
                    self.registers[self._reg_index(offset)] - 1
                )  # -1 because the PC is incremented after fetch

            case "JPC":
                offset = int(args[0])
                self.PC += offset - 1  # -1 because the PC is incremented after fetch

            case "BRFL":
                r = self._reg_index(args[0])
                i7 = int(args[1], 2)  # Expected flags
                m7 = int(args[2], 2)  # Mask
                rflags_value = self._rflags_to_int()
                print(f"rflags_value: {rflags_value}, i7: {i7}, m7: {m7}")
                if (rflags_value & m7) == (i7 & m7):
                    self.PC = self.registers[r] - 1  # Jump to address in register r
                    return

            case "CALL":
                r = self._reg_index(args[0])
                self.stack.append(self.PC)  # Salva posição atual (sem incremento)
                self.PC = self.registers[r] - 1

            case "RET":
                if self.stack:
                    self.PC = self.stack.pop()
                else:
                    print("Stack underflow on RET")
                    self.halted = True

            case "NOP":
                pass
            
            case "HALT":
                # Halt the processor
                print("Program halted")
                self.halted = True
            # Software interrupts 
            case "INT":
                int_num = int(args[0]) # Qual interrupção chamar
                self.trigger_interrupt(int_num)

            case "IRET":
                # retorna de uma interrupção
                if self.restore_context():
                    self.flags["interrupt"] = 0
                else:
                    print("Stack underflow on IRET")
                    self.flags["error"] = 1
                    self.halted = True

            case "CLI": # clear na interrupção
                self.interrupt_enabled = False

            case "STI": #set na interrupção
                self.interrupt_enabled = True

            case "SVEC":
                int_num = int(args[0])
                reg = self._reg_index(args[1])
                if 0 <= int_num < 16:
                    self.interrupt_vector[int_num] = self.registers[reg]

            # Default case for unknown instructions
            case _:
                print(f"Unknown instruction: {opcode}")
                self.flags["error"] = 1
                self.halted = True

    def _reg_index(self, reg):
        return int(reg.replace("R", ""))

    def _parse_mem_ref(self, ref):
        # Formato: I16(RB)
        offset, rb = ref.replace(")", "").split("(")
        return int(offset), self._reg_index(rb)

    def _rflags_to_int(self):
        bits = [
            self.flags["overflow"],
            self.flags["above"],
            self.flags["equal"],
            self.flags["below"],
            self.flags["between"],
            self.flags["collision"],
            self.flags["error"],
        ]
        value = 0
        for bit in bits:
            value = (value << 1) | bit
        return value
    
    def trigger_interrupt(self, interrupt_num):
        if not self.interrupt_enabled:
            return False
        
        if 0 <= interrupt_num < 16:
            # Save context
            self.save_context()
            
            # Jump to handler address
            handler_addr = self.interrupt_vector[interrupt_num]
            if handler_addr != 0:
                self.flags["interrupt"] = 1
                self.PC = handler_addr - 1  
                return True
        return False
    
    def save_context(self):
        flag_value = self._rflags_to_int()
        self.stack.append(flag_value)  
        self.stack.append(self.PC) 


    def restore_context(self):
        if len(self.stack) >= 2:
            self.PC = self.stack.pop()    
            flag_value = self.stack.pop()  
            self._int_to_rflags(flag_value)
            return True
        return False
    
    def _int_to_rflags(self, value):
        self.flags["error"] = value & 1
        value >>= 1
        self.flags["collision"] = value & 1
        value >>= 1
        self.flags["between"] = value & 1
        value >>= 1
        self.flags["below"] = value & 1
        value >>= 1
        self.flags["equal"] = value & 1
        value >>= 1
        self.flags["above"] = value & 1
        value >>= 1
        self.flags["overflow"] = value & 1
        value >>= 1
        self.flags["interrupt"] = value & 1