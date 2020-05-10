#! /usr/bin/python3

import os
import sys
import codecs

if os.path.exists(sys.argv[1]):
    htmlText = codecs.open(sys.argv[1], encoding='utf-8').read()
    print(htmlText.replace("\"","\\\"").replace("\n",""),end='')

