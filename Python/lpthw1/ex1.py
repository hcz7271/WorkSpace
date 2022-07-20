import hashlib

str1 = "chengzhu huang"
str2 = hashlib.sha256(hashlib.sha256(str1).hexdigest()).hexdigest()

print(str2)
