#! /bin/sh
#
# battery.sh
# Copyright (C) 2015 dershokus <dershokus@MacBook-Air-DerShokus.local>
#
# Distributed under terms of the MIT license.
#


ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf("%.2f%%", $10/$5 * 100)}'
