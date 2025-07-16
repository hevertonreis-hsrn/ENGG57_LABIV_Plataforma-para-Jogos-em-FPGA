from pathlib import Path
from enum import Enum


class Instruction(Enum):
    LW = "LW"
    SW = "SW"
    MOV = "MOV"
    ADD = "ADD"
    SUB = "SUB"
    MUL = "MUL"
    DIV = "DIV"
    AND = "AND"
    OR = "OR"
    SHL = "SHL"
    SHR = "SHR"
    CMP = "CMP"
    NOT = "NOT"
    JR = "JR"
    JPC = "JRPC"
    BRFL = "BRFL"
    CALL = "CALL"
    RET = "RET"
    NOP = "NOP"


class InstructionReader:
    list_of_instructions: list[str] = []
    current_instruction: str = ""
    current_instruction_index: int = 0
    registers: list[int] = [0] * 32  # Assuming 32 registers

    def __init__(self, file_path):
        self.file_path = file_path

    def read_instruction_file(self, filename: Path) -> None:
        with open(self.file_path, "r") as file:
            instructions = file.readlines()
        self.list_of_instructions = [
            line.strip() for line in instructions if line.strip()
        ]

    def get_next_instruction(self) -> str:
        if self.current_instruction_index < len(self.list_of_instructions):
            self.current_instruction = self.list_of_instructions[
                self.current_instruction_index
            ]
            self.current_instruction_index += 1
            return self.current_instruction
        else:
            return None

    def reset_instructions(self) -> None:
        self.current_instruction_index = 0
        self.current_instruction = ""
        self.list_of_instructions = []
        self.read_instruction_file(self.file_path)

    def get_current_instruction(self) -> str:
        return self.current_instruction if self.current_instruction_index > 0 else None

    def _get_parameters(self, instruction: str, amount_params: int) -> tuple[int]:
        parts = instruction.split(" ")
        if len(parts) < amount_params + 1:
            raise ValueError(
                f"Invalid instruction format: {instruction}. Expected  {amount_params + 1} parts."
            )
        params = tuple(int(part) for part in parts[1 : amount_params + 1])
        return params

    def instruction_lw(self, instruction: str) -> None:
        register, address = self._get_parameters(instruction, 2)
        if 0 <= register < len(self.registers):
            self.registers[register] = address

    def instruction_sw(self, instruction: str) -> None:
        register, address = self._get_parameters(instruction, 2)
        if 0 <= register < len(self.registers):
            self.registers[address] = self.registers[register]

    def instruction_mov(self, instruction: str) -> None:
        dest, val = self._get_parameters(instruction, 2)
        if 0 <= dest < len(self.registers):
            self.registers[dest] = val

    def instruction_add(self, instruction: str) -> None:
        dest, num = self._get_parameters(instruction, 2)
        if 0 <= dest < len(self.registers):
            self.registers[dest] += num

    def instruction_sub(self, instruction: str) -> None:
        dest, num = self._get_parameters(instruction, 2)
        if 0 <= dest < len(self.registers):
            self.registers[dest] -= num

    def instruction_mul(self, instruction: str) -> None:
        dest, num = self._get_parameters(instruction, 2)
        if 0 <= dest < len(self.registers):
            self.registers[dest] *= num

    def instruction_div(self, instruction: str) -> None:
        dest, num = self._get_parameters(instruction, 2)
        if 0 <= dest < len(self.registers) and num != 0:
            self.registers[dest] //= num

    def instruction_and(self, instruction: str) -> None:
        dest, num = self._get_parameters(instruction, 2)
        if 0 <= dest < len(self.registers):
            self.registers[dest] &= num

    def instruction_or(self, instruction: str) -> None:
        dest, num = self._get_parameters(instruction, 2)
        if 0 <= dest < len(self.registers):
            self.registers[dest] |= num

    def instruction_shl(self, instruction: str) -> None:
        dest, num = self._get_parameters(instruction, 2)
        if 0 <= dest < len(self.registers):
            self.registers[dest] <<= num

    def instruction_shr(self, instruction: str) -> None:
        dest, num = self._get_parameters(instruction, 2)
        if 0 <= dest < len(self.registers):
            self.registers[dest] >>= num

    def instruction_cmp(self, instruction: str) -> bool:
        reg1, reg2 = self._get_parameters(instruction, 2)
        if 0 <= reg1 < len(self.registers) and 0 <= reg2 < len(self.registers):
            return self.registers[reg1] == self.registers[reg2]
        return False

    def instruction_not(self, instruction: str) -> None:
        dest = self._get_parameters(instruction, 1)[0]
        if 0 <= dest < len(self.registers):
            self.registers[dest] = ~self.registers[dest]

    def instruction_jr(self, instruction: str) -> None:
        offset = self._get_parameters(instruction, 1)[0]
        if (
            0
            <= self.current_instruction_index + offset
            < len(self.list_of_instructions)
        ):
            self.current_instruction_index += offset
            self.current_instruction = self.list_of_instructions[
                self.current_instruction_index
            ]

    def instruction_jpc(self, instruction: str) -> None:
        condition, offset = self._get_parameters(instruction, 2)
        if condition and 0 <= self.current_instruction_index + offset < len(
            self.list_of_instructions
        ):
            self.current_instruction_index += offset
            self.current_instruction = self.list_of_instructions[
                self.current_instruction_index
            ]

    def instruction_brfl(self, instruction: str) -> None:
        condition, offset = self._get_parameters(instruction, 2)
        if not condition and 0 <= self.current_instruction_index + offset < len(
            self.list_of_instructions
        ):
            self.current_instruction_index += offset
            self.current_instruction = self.list_of_instructions[
                self.current_instruction_index
            ]

    def instruction_call(self, instruction: str) -> None:
        address = self._get_parameters(instruction, 1)[0]
        if 0 <= address < len(self.list_of_instructions):
            self.current_instruction_index = address
            self.current_instruction = self.list_of_instructions[
                self.current_instruction_index
            ]

    def instruction_ret(self, _instruction: str) -> None:
        if self.current_instruction_index > 0:
            self.current_instruction_index -= 1
            self.current_instruction = self.list_of_instructions[
                self.current_instruction_index
            ]

    def instruction_nop(self, _instruction: str) -> None:
        # No operation, simply do nothing
        pass

    def decipher_current_instruction(self) -> str:
        instruction = self.get_current_instruction().split(" ")[0]
        instruction = instruction.upper()
        instruction_enum = (
            Instruction[instruction] if instruction in Instruction.__members__ else None
        )

        if instruction_enum is None:
            raise ValueError(f"Unknown instruction: {instruction}")

        param_list = self.get_current_instruction().split(" ")[1:]

        instructions = {
            Instruction.LW: self.instruction_lw,
            Instruction.SW: self.instruction_sw,
            Instruction.MOV: self.instruction_mov,
            Instruction.ADD: self.instruction_add,
            Instruction.SUB: self.instruction_sub,
            Instruction.MUL: self.instruction_mul,
            Instruction.DIV: self.instruction_div,
            Instruction.AND: self.instruction_and,
            Instruction.OR: self.instruction_or,
            Instruction.SHL: self.instruction_shl,
            Instruction.SHR: self.instruction_shr,
            Instruction.CMP: self.instruction_cmp,
            Instruction.NOT: self.instruction_not,
            Instruction.JR: self.instruction_jr,
            Instruction.JPC: self.instruction_jpc,
            Instruction.BRFL: self.instruction_brfl,
            Instruction.CALL: self.instruction_call,
            Instruction.RET: self.instruction_ret,
            Instruction.NOP: self.instruction_nop,
        }
        if instruction_enum in instructions:
            instructions[instruction_enum](self.get_current_instruction())
            return f"Executed: {instruction_enum.value} with parameters {param_list}"
        else:
            raise ValueError(f"Instruction {instruction_enum} not implemented.")


if __name__ == "__main__":
    import sys
    from instruction_reader import InstructionReader

    if len(sys.argv) < 2:
        print("Usage: python instruction_reader.py <instruction_file>")
        sys.exit(1)

    file_path = sys.argv[1]
    reader = InstructionReader(file_path)
    reader.read_instruction_file(file_path)

    while True:
        instruction = reader.get_next_instruction()
        if instruction is None:
            break
        result = reader.decipher_current_instruction()
        print(result)

    print(reader.registers)  # Print the final state of registers
