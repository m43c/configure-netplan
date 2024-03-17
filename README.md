# Script to Change IP and Gateway in Netplan (Ubuntu Server)

This bash script is designed to simplify and automate the process of changing IP address and gateway in the Netplan configuration file on Ubuntu Server systems.

## Screenshots
![Pre](https://github.com/m43c/configure-netplan/blob/main/screenshots/pre.png?raw=true)
![Pos](https://github.com/m43c/configure-netplan/blob/main/screenshots/pos.png?raw=true)

## Usage

1. Clone this repository:
    ```bash
    git clone https://github.com/m43c/configure-netplan.git
    cd configure-netplan
    ```
2. Grant execute permissions to the script:
    ```bash
    chmod +x configure_netplan.sh
    ```
3. Execute the script:
    ```bash
    ./configure_netplan.sh
    ```
4. Follow the on-screen instructions to input the new IP address and subnet mask.

## Functionality

The script performs the following steps:

1. Prompts the user to input the IP address and subnet mask.
2. Automatically calculates the gateway based on the entered IP address.
3. Makes a copy of the Netplan configuration file `00-installer-config.yaml`.
4. Modifies the configuration file with the new IP address and gateway.
5. Applies the new Netplan configuration.
6. Informs the user about the success or failure of the configuration change.

## Requirements

- This script is designed for Ubuntu Server systems using Netplan for network configuration.
- Superuser privileges (`sudo`) are required to execute the script, as it involves modifying system configuration files.

## Warning

- Use this script with caution and ensure you understand the changes you are making to your system's network configuration.
- If something goes wrong during script execution, instructions will be provided to revert the changes.

## Author

This script was developed by [Marco Encinas].

## Contribution

Contributions are welcome. If you wish to improve the script, feel free to submit a pull request.
