#!/bin/bash
cliphist list | wofi --dmenu --pre-display-cmd "echo '%s' | cut -f 2" | cliphist decode | wl-copy
