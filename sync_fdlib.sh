# script to sync a single FD Character Library core files to all EMW5 characters
#!/bin/bash

FDLIBROOT='Libraries/FDCharLib'
# names MUST match the folder name in characters folder
CHARACTERS=("amy" "sonic" "vector" "tails" "shadow" "shade" "metal" "knuckles" "espio" "brad")

for CHAR in "${CHARACTERS[@]}"; do
    echo "Synching FD Character Library for : $CHAR..."

    mkdir -p "characters/$CHAR/Graphics"
    mkdir -p "characters/$CHAR/Lua/$FDLIBROOT"
    cp -r "libraries/FDCharLib/lua/"* "characters/$CHAR/Lua/$FDLIBROOT/"
    cp -r "libraries/FDCharLib/Graphics" "characters/$CHAR"
    cp -r "libraries/FDCharLib/init.lua" "characters/$CHAR/Lua/$FDLIBROOT/exec.lua"
    sed -i "s|FDCharLib_root = \"\"|FDCharLib_root = \"$FDLIBROOT/\"|g" "characters/$CHAR/Lua/$FDLIBROOT/exec.lua"
done

echo "Completed!"