Are you tired of Vencord disappearing after a new Discord update? Going on the Vencord website, downloading the file, and running the visual installer can get tedious when doing it after every Discord update. This is an expanded version of [maxlid3](https://github.com/maxlid3)'s original script that aims to be even more convenient.

# Automatic Vencord Reinstaller

This repository contains a batch script that automates the process of downloading, running, and cleaning up the latest version of the [Vencord CLI](https://github.com/Vendicated/Vencord).

## Features

- Automatically detects when a Discord update breaks Vencord and reinstalls it.
- Automatically downloads the latest version of Vencord CLI.
- Executes the Vencord CLI to install or update Vencord.
- Cleans up temporary files after execution.

## Usage

1. Download the batch script from this repo (or from the releases page).  
2. Run the script (`InstallVencord.bat`) by double-clicking it or executing it from a terminal:  
   ```bash
   InstallVencord.bat
   ```

⚠️ **Important:** This script is intended to **replace your normal Discord shortcut**.  
- If you normally launch Discord from the taskbar, desktop, or start menu, update those shortcuts to point to this script instead.  
- If you have Discord set to autostart with Windows, disable that option in Discord’s settings and configure this script to run at startup instead.  




## How It Works
1. **Update**: The script runs the Discord Updater, in case the newest update breaks Vencord.
2. **Check**: Then it checks your Discord installation(s) if an update has broken Vencord. If that’s the case, it does the following:
    - **Download**: The script fetches the latest Vencord CLI executable from its official source.
    - **Run**: It executes the Vencord CLI to perform the installation.
    - **Cleanup**: After execution, the script removes the downloaded files to keep your system clean.
3. **Final**: It starts Discord for you (configurable).

## Requirements

- Windows operating system.
- Internet connection to download the Vencord CLI.

## Disclaimer

This script is provided as-is. Use it at your own risk. Ensure you trust the source of the Vencord CLI before running the script. I have no affiliation with Discord or Vencord.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details. 
