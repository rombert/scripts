#!/bin/sh
# courtesy of http://it.slashdot.org/comments.pl?sid=1119941&cid=26767103
dd status=noxfer if=/dev/random bs=1 count=24 | base64 
