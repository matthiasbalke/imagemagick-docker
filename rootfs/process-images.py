import subprocess
import sys

arguments = sys.argv[1:]

subprocess.call(['magick'] + arguments)
