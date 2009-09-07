#!/bin/sh

for i in ~/.mozilla/firefox/*.default/*.sqlite; do 
	sqlite3 $i "vacuum;"; 
done
