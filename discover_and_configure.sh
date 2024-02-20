#!/bin/bash

# Discover multipath devices
sudo multipath -ll

# Configure multipath devices
sudo multipath -F  # Flush existing maps
sudo multipath  # Redo discovery

echo "Multipath device discovery and configuration completed."
