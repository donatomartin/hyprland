#!/bin/bash

# Direction passed as argument: left/right/up/down
direction=$1

echo $direction

# Map directions to tmux pane directions and Hyprland ones
declare -A tmux_dirs=( ["left"]="L" ["right"]="R" ["up"]="U" ["down"]="D" )
declare -A hypr_dirs=( ["left"]="l" ["right"]="r" ["up"]="u" ["down"]="d" )

# Try sending direction to tmux pane
tmux select-pane -${tmux_dirs[$direction]}
if [ $? -ne 0 ]; then
  # If tmux can't move pane, fall back to Hyprland window movement
  hyprctl dispatch movefocus "${hypr_dirs[$direction]}"
fi

