#!/bin/sh

curl -l -s $1 | grep -i "href=" | cut -d "\"" -f 2