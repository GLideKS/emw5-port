# script to sync a single FD Character Library core files to all EMW5 characters
#!/bin/bash

FDLIB_DIRECTORY='FD-CharacterLib/src' # FD Character Lib's directory in the repository
FDLIBROOT='Libraries/FDCharLib' # FDLib in each character (Lua folder)

# names MUST match the folder name in characters folder
CHARACTERS=("amy" "sonic" "vector" "tails" "shadow" "shade" "metal" "knuckles" "espio" "brad")

for CHAR in "${CHARACTERS[@]}"; do
    echo "Synching FD Character Library for : $CHAR..."
    
    CHAR_LUADIR="characters/$CHAR/Lua"

    mkdir -p "characters/$CHAR/Graphics"
    mkdir -p "$CHAR_LUADIR/$FDLIBROOT"
    cp -r "$FDLIB_DIRECTORY/lua/"* "$CHAR_LUADIR/$FDLIBROOT/"
    cp -r "$FDLIB_DIRECTORY/Graphics" "characters/$CHAR"
    cp -r "$FDLIB_DIRECTORY/init.lua" "$CHAR_LUADIR/$FDLIBROOT/exec.lua"
    sed -i "s|FDCharLib_root = \"\"|FDCharLib_root = \"$FDLIBROOT/\"|g" "$CHAR_LUADIR/$FDLIBROOT/exec.lua"
done

echo "Completed!"
