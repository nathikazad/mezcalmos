from sys import argv
import os
import json

assert argv.__len__() > 1, "Make sure to pass the file to format, an example would be dep.txt"
assert os.path.exists(argv[1]), f"No such file found at : {argv[1]}"
pdeps = open(argv[1], 'r').readlines()

_formatted = {}
for line in pdeps:
	line = line.replace(' ','').replace('\n','')
	if line.startswith('#'):
		print(f"[!] Skipping {line}, because it is a comment.")
	elif ':' not in line:
		print(f"[!] Skipping {line} -> no : found.")
	else:
		splitted = line.split(':')
		_formatted[splitted[0]]= '' if splitted[1].__len__() <= 1 else splitted[1]



if _formatted.keys().__len__() > 1:
	open('output.json' , 'w+').write(json.dumps(_formatted))

else:
	print("[!] No valid dependencies to format!")
