#!/bin/bash

while [ $# -ne 0 ]
do
    (docker logs -f -t --tail=10 $1|sed -e "s/^/$1: /")&
    shift
done
wait

