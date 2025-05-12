# Installation Guide for Expedition 33 Camera Mod

## Prerequisites

1. Expedition 33 installed via Steam on Manjaro Linux
2. Proton configured in Steam (Proton Experimental recommended)

## Installation Steps

1. Extract the `E33_CameraMod.tar.gz` archive:
   ```bash
   tar -xzvf E33_CameraMod.tar.gz
   ```

2. Navigate to the extracted directory:
   ```bash
   cd Expedition33_CameraMod
   ```

3. Run the installation script:
   ```bash
   ./install.sh
   ```

4. Launch Expedition 33 through Steam

## UE4SS Installation (Required for Full Functionality)

For complete mod functionality, UE4SS needs to be installed. Follow these steps:

1. Download UE4SS from [https://github.com/UE4SS-RE/RE-UE4SS/releases](https://github.com/UE4SS-RE/RE-UE4SS/releases)
2. Extract the UE4SS files to your Expedition 33 game directory
3. Configure UE4SS to load at game startup:
   ```
   ~/.steam/steam/steamapps/common/Expedition 33/UE4SS.ini
   ```
   Set `EnableCustomLogicMods` to `true`

## Manual Installation (If the Script Fails)

If the installation script fails, you can install manually:

1. Create the mods directory:
   ```bash
   mkdir -p ~/.steam/steam/steamapps/common/Expedition\ 33/Sandfall/Content/Paks/~mods/E33_CameraMod/Sandfall/Config
   ```

2. Copy the config files:
   ```bash
   cp Sandfall/Config/* ~/.steam/steam/steamapps/common/Expedition\ 33/Sandfall/Content/Paks/~mods/E33_CameraMod/Sandfall/Config/
   ```

3. Set up UE4SS and copy the script files:
   ```bash
   mkdir -p ~/.steam/steam/steamapps/common/Expedition\ 33/Sandfall/Content/Paks/LogicMods/E33_CameraMod/Scripts
   cp Sandfall/Content/Paks/LogicMods/E33_CameraMod/Scripts/main.lua ~/.steam/steam/steamapps/common/Expedition\ 33/Sandfall/Content/Paks/LogicMods/E33_CameraMod/Scripts/
   cp Sandfall/Content/Paks/LogicMods/E33_CameraMod/mod.json ~/.steam/steam/steamapps/common/Expedition\ 33/Sandfall/Content/Paks/LogicMods/E33_CameraMod/
   ```

## Troubleshooting

If you experience issues:

1. Verify your Proton version
2. Clear the shader cache:
   ```bash
   rm -rf ~/.steam/steam/steamapps/shadercache/2321950/
   ```
3. Make sure file permissions are correct:
   ```bash
   chmod -R 755 ~/.steam/steam/steamapps/common/Expedition\ 33/Sandfall/Content/Paks/~mods
   chmod -R 755 ~/.steam/steam/steamapps/common/Expedition\ 33/Sandfall/Content/Paks/LogicMods
   ```

## Controls

- Press `V` to toggle between first and third person views
- Use mouse wheel to adjust camera distance
- Press `Shift+R` to reset camera to default position