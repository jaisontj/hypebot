#!/bin/bash
set -e

echo "Creating new Akash wallet..."
akash keys add deployer --keyring-backend test

echo -e "\nExporting private key..."
akash keys export deployer --keyring-backend test --unarmored-hex | base64 