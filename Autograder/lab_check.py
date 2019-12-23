def run_lab_check(filepath, secret_codeword):
    with open(filepath) as f:
        line = f.read()
        line = line.strip().replace(" ", "").lower()
        print(line == secret_codeword)
        f.close()


if __name__ == "__main__":
    import sys
    filepath = sys.argv[1]
    secret_codeword = sys.argv[2]
    run_lab_check(filepath, secret_codeword)
