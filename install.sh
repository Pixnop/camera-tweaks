#!/bin/bash

# Expedition 33 Camera Mod - Installation Script
echo "Installing Expedition 33 Camera Mod..."

# Define paths
GAME_DIR="$HOME/.steam/steam/steamapps/common/Expedition 33"
MOD_DIR="$GAME_DIR/Sandfall/Content/Paks/~mods"
CONFIG_DIR="$MOD_DIR/E33_CameraMod"
LOGIC_MOD_DIR="$GAME_DIR/Sandfall/Content/Paks/LogicMods/E33_CameraMod"

# Create mod directories
mkdir -p "$MOD_DIR"
mkdir -p "$CONFIG_DIR/Sandfall/Config"
mkdir -p "$LOGIC_MOD_DIR/Scripts"

# Copy configuration files
cp -f ./Sandfall/Config/Engine.ini "$CONFIG_DIR/Sandfall/Config/"
cp -f ./Sandfall/Config/Input.ini "$CONFIG_DIR/Sandfall/Config/"
cp -f ./Sandfall/Config/Game.ini "$CONFIG_DIR/Sandfall/Config/"

# Copy UE4SS script files
cp -f ./Sandfall/Content/Paks/LogicMods/E33_CameraMod/Scripts/main.lua "$LOGIC_MOD_DIR/Scripts/"
cp -f ./Sandfall/Content/Paks/LogicMods/E33_CameraMod/mod.json "$LOGIC_MOD_DIR/"

# Copy README
cp -f ./README.md "$CONFIG_DIR/"

echo "Mod installation completed!"
echo "Launch Expedition 33 through Steam to use the mod."
echo ""
echo "Camera Controls:"
echo "- Press V to toggle between first and third person views"
echo "- Use mouse wheel to adjust camera distance"
echo "- Press Shift+R to reset camera to default position"