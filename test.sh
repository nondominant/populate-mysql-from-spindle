#!/bin/bash

mkdir "ham/goose"
while [ $? -ne 0 ] ; 
do
  echo "yes"
  sleep 1
  mkdir "ham/goose"
done
