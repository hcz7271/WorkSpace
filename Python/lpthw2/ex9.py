import sys

script = sys.argv[1]
files = sys.argv[2:]

print(script, files)

if script[0] == "s":
    print(">>>> script:", script.split("/"))
    pattern, replace = script.split("/")[1:3]
else:
    print("Error, only s supported")
    sys.exit(1)

for file_name in files:
    with open(file_name) as f:
        lines = f.readlines()
        for line in lines:
            line.replace(pattern, replace)
            print(line, end="")
