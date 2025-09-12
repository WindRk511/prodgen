#!/bin/bash

file=$(ls | grep -v "$0" )
git add $file
git commit -m "0"
git push
