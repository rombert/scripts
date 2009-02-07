#!/bin/sh
# courtesy of http://it.slashdot.org/comments.pl?sid=1119941&cid=26765305
dd if=/dev/random bs=200 count=1 | tr -cd 'A-Za-z0-9!@#$%^&*()_+'; echo
