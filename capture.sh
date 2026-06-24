#!/bin/bash

FILE=~/AI_WORKSPACE/inbox/$(date +%Y-%m-%d).md

echo "" >> $FILE
echo "## $(date '+%H:%M:%S')" >> $FILE
echo "$1" >> $FILE
