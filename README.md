# RDP Wrapper Auto Updater

## Description
This is a Windows batch script designed to automatically update the contents of the `RDPWrap.INI` file and restart the RDP (Remote Desktop Protocol) service.

## Requirements
Before running this script, please ensure that you have installed the [RDP Wrapper Library](https://github.com/stascorp/rdpwrap). You can download it from their [GitHub page](https://github.com/stascorp/rdpwrap).

## Usage
Simply run the script by typing its filename and pressing Enter. The script will automatically request administrative privileges.

## How it Works
The script performs the following steps:
1. Requests administrative privileges.
2. Updates the contents of the `RDPWrap.INI` file.
3. Restarts the `termservice` service.

## Note
When running this script, please grant it administrative privileges when prompted.

## License
This is free and open-source software, you can use and distribute it under the terms of the MIT license.

## Support
If you encounter any issues or have questions, please open a new Issue in this project's Issues tab.

## Contributing
We welcome contributions from the community. If you wish to contribute, please fork the project, make your changes, and then send us a Pull Request.
