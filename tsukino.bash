#!/bin/bash
# Save the current working directory
MY_DIR=$(pwd)

# Move to the script directory to run it
cd ~/Documents/GitHub/rad-tui-BASIC/

# Run the script with the correct relative path for the json and absolute path for your file
python3 rad-tui-py.py -run projects/examples/tsukino.json "$MY_DIR/$1"

# Return to the original directory
cd "$MY_DIR"
