#!/bin/sh

curl -l -s $1 | grep "href" | cut -d "\"" -f 2