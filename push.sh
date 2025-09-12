#!/bin/bash

file=$(ls | grep -v "push.sh" )
git add $file
git commit -m "ui"
git push -u origin master
