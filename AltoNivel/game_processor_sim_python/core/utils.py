def print_register_state(processor):
    print("-" * 50)
    print("\nRegister State:")
    for i in range(0, 32, 4):
        regs = [f"R{j}={processor.registers[j]}" for j in range(i, min(i + 4, 32))]
        print(" | ".join(regs))

    print("\nFlags:", end=" ")
    for flag, value in processor.flags.items():
        if value:
            print(f"{flag}={value}", end=" ")
    print()
    print(f"PC: {processor.PC}")
    print(f"Stack: {processor.stack}")
    print("-" * 50)
