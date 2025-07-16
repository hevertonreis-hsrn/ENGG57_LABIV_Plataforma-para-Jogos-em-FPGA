def load_from_file(filename):
    program = []
    with open(filename, "r") as f:
        for line in f:
            if "#" in line:
                line = line[: line.index("#")]
            line = line.strip()
            if not line:
                continue
            program.append(line)
    print(f"Loaded {len(program)} instructions from {filename}")
    return program
