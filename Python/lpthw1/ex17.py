from sys import argv
from os.path import exists

script, from_filename, to_filename = argv

print(f"Copying from {from_filename} to {to_filename}")

# we could do these two on one line, how?
# read()一旦运行，文件就会被关闭
indata = open(from_filename).read()

print(f"The input file is {len(indata)} bytes long")

print(f"Does the output file exist? {exists(to_filename)}")

print("Ready, hit RETURN to continue, CTRL-C to abort.")
input()

out_file = open(to_filename, 'w')
out_file.write(indata)

print("Alright, all done.")

out_file.close()
