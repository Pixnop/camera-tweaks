#!/bin/bash

# Launch script for Expedition 33 with Camera Mod

# Define paths
GAME_DIR="$HOME/.steam/steam/steamapps/common/Expedition 33"
MOD_DIR="$GAME_DIR/Sandfall/Content/Paks/~mods"
LOGIC_MOD_DIR="$GAME_DIR/Sandfall/Content/Paks/LogicMods"

# Check if mod files exist
if [ ! -d "$MOD_DIR/E33_CameraMod" ]; then
    echo "Error: Camera mod files not found!"
    echo "Please make sure you have installed the mod first."
    exit 1
fi

# Check if SteamAppId file exists, create if not
if [ ! -f "$GAME_DIR/steam_appid.txt" ]; then
    echo "2321950" > "$GAME_DIR/steam_appid.txt"
    echo "Created steam_appid.txt file"
fi

# Set Proton environment variables for better performance
export PROTON_LOG=1
export PROTON_USE_WINED3D=0
export WINEDLLOVERRIDES="dsound=n,b"

# Launch the game through Steam
echo "Launching Expedition 33 with Camera Mod..."
echo "Press V to toggle first/third person view"
echo "Use mouse wheel to adjust camera distance"
echo "Press Shift+R to reset camera"
echo ""
echo "Note: UE4SS is required for all features to work."
echo "If not already installed, please refer to the installation guide."
echo ""

steam -applaunch 2321950 

echo "Game launched. Enjoy your modded Expedition 33!"