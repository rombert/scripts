#!/bin/sh

adb shell dumpsys battery | awk '/level/ { print $2}'

