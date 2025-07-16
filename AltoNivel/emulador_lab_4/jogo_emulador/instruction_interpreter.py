if __name__ == "__main__":
    import sys
    from instruction_interpreter import InstructionInterpreter

    if len(sys.argv) < 2:
        print("Usage: python instruction_interpreter.py <instruction>")
        sys.exit(1)

    instruction = sys.argv[1]
    interpreter = InstructionInterpreter()
    result = interpreter.interpret(instruction)
    print(result)
