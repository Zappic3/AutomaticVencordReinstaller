Are you tired of Vencord disappearing after a new Discord Update? Going on the Vencord website, downloading the file and running the visual installer can get tedius when doing it after every Discord update.

# Automatic Vencord Installer

This repository contains a Batch Script that automates the process of downloading, running, and cleaning up the [Vencord CLI](https://github.com/Vendicated/Vencord).

## Features

- Automatically downloads the latest version of Vencord CLI.
- Executes the Vencord CLI to install or update Vencord.
- Cleans up temporary files after execution.

## Usage

1. Download the Batch script from repo directly or the releases page.
2. Run the Batch Script (`InstallVercord.bat`) by double-clicking it or executing it in a terminal.

```bash
InstallVencord.bat
```

3. Follow the on-screen instructions provided by the Vencord CLI. (Just pressing Enter for a usual install should be fine in most cases.)

## How It Works

1. **Download**: The script fetches the latest Vencord CLI executable from its official source.
2. **Run**: It executes the Vencord CLI to perform the installation or update.
3. **Cleanup**: After execution, the script removes the downloaded files to keep your system clean.

## Requirements

- Windows operating system.
- Internet connection to download the Vencord CLI.

## Disclaimer

This script is provided as-is. Use it at your own risk. Ensure you trust the source of the Vencord CLI before running the script. I have no affiliation with Discord or Vencord.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.  