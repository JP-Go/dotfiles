#!/bin/bash
polybar-msg cmd quit

polybar bar 2>&1 | tee -a /tmp/polybar.log & disown
