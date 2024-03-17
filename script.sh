#!/bin/bash

# Prompt the user to enter the IP address + subnet mask e.g. xxx.xxx.xxx.xxx/xx
read -rp "ip address: " ip_address

# Calculate the gateway based on the entered IP address
gateway="${ip_address%.*}.1"

# Make a copy of the netplan configuration file
sudo cp /etc/netplan/00-installer-config.yaml .

# Modify the netplan configuration file with the IP address and gateway
sudo sed -i "
/addresses:/ {
    n
    s|^\(\s*-\s*\)[0-9.]\+/\([0-9]\+\)|\1$ip_address|
}
/gateway4:/ {
    s|\(gateway4:\s*\)[0-9.]\+|\1$gateway|
}" /etc/netplan/00-installer-config.yaml

# Apply the new netplan configuration and capture output
new_netplan_config=$(sudo netplan apply 2>&1)

# Check if the modification of the file was successful
if [[ $new_netplan_config == *Error* ]]; then
    echo "Something went wrong, please try again"

    # Move copy of netplan configuration file to its source
    sudo mv 00-installer-config.yaml /etc/netplan/
else
    echo "Successful change!"

    # Delete copy of netplan configuration file
    sudo rm 00-installer-config.yaml
fi
