#!/bin/bash
qhost | grep -v global | sed "s: \{13\}::" | sed "s: \{5\}: :" | sed "s:-\{17\}$::"
