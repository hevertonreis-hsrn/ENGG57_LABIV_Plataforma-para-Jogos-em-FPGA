# core/memory.py

class Memory:
    def __init__(self, size=32768):  # 32K
        self.data = [0] * size
        self.instructions = []

    def load_program(self, program):
        self.instructions = program

    def get_instruction(self, pc):
        if pc < len(self.instructions):
            return self.instructions[pc]
        return 'NOP'

    def load(self, addr):
        return self.data[addr]

    def store(self, addr, value):
        self.data[addr] = value
