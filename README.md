# Expedition 33 Camera Mod for Manjaro Linux

## Overview

This mod enhances the camera experience in Expedition 33 by providing:

1. **Increased Field of View (FOV)**: Default FOV set to 95° for a wider perspective
2. **First/Third Person Toggle**: Switch between camera views with a key press
3. **Adjustable Camera Distance**: Control how close or far the camera is from your character
4. **Camera Reset Function**: Quickly return to default settings

## Installation

### Quick Installation
1. Extract the mod archive
2. Run the installation script:
   ```bash
   cd Expedition33_CameraMod
   ./install.sh
   ```

### Dependencies
The mod has two components:
1. **Configuration Files**: Basic FOV changes (works without additional tools)
2. **UE4SS Scripts**: Advanced features like view toggling and distance adjustment

For full functionality, you need to install UE4SS:
- Download from: https://github.com/UE4SS-RE/RE-UE4SS/releases
- Follow installation instructions in INSTALLATION_GUIDE.md

## Controls

- **Toggle View**: Press `V` to switch between first and third person
- **Adjust Distance**: Use the mouse wheel to zoom in/out
- **Reset Camera**: Press `Shift+R` to reset to default settings

## Troubleshooting

If the mod doesn't work:
1. Verify that it's installed in: `~/.steam/steam/steamapps/common/Expedition 33/Sandfall/Content/Paks/~mods/`
2. Check UE4SS is correctly installed for advanced features
3. Try clearing shader cache: `rm -rf ~/.steam/steam/steamapps/shadercache/2321950/`
4. Verify Proton compatibility (Proton Experimental recommended)

## Credits and License

Created based on UE5 modding documentation for Linux.
Mod is provided as-is under the MIT License.

## Feedback and Support

If you encounter issues, refer to the included INSTALLATION_GUIDE.md file for detailed troubleshooting.