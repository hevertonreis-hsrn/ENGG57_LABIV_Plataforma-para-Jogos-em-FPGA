class Memory:
    def __init__(self, size: int):
        self._mem = bytearray(size)

    def read(self, addr: int) -> int:
        if 0 <= addr < len(self._mem):
            return self._mem[addr]
        raise IndexError("Memory read out of bounds")

    def write(self, addr: int, val: int):
        if 0 <= addr < len(self._mem):
            self._mem[addr] = val & 0xFF
        else:
            raise IndexError("Memory write out of bounds")
        
    def read_block(self, addr: int, size: int) -> bytes:
        if not (0 <= addr < len(self._mem)) or addr + size > len(self._mem):
            raise IndexError("Memory block read out of bounds")
        return bytes(self._mem[addr:addr + size])

    def write_block(self, addr: int, data: bytes):
        if not (0 <= addr < len(self._mem)) or addr + len(data) > len(self._mem):
            raise IndexError("Memory block write out of bounds")
        self._mem[addr:addr + len(data)] = data

    def __len__(self):
        return len(self._mem)

    def dump(self) -> bytes:
        return bytes(self._mem)
