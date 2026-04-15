#!/bin/bash

# File paths
CONFIG_FILE="lib/core/utils/secret/app_secret.dart"
ENCRYPTED_FILE="lib/core/utils/secret/ENCRYPTED"

# Encryption key (32 bytes for AES-256, should be securely stored or passed securely)
# For this example, we'll prompt for a key or use an environment variable
ENCRYPTION_KEY="${ENCRYPTION_KEY:-}"

# Function to check if OpenSSL is installed
check_openssl() {
    if ! command -v openssl &> /dev/null; then
        echo "Error: OpenSSL is not installed. Please install it first."
        exit 1
    fi
}

# Function to prompt for encryption key if not set
get_encryption_key() {
    if [ -z "$ENCRYPTION_KEY" ]; then
        read -sp "Enter encryption key (32 characters recommended): " ENCRYPTION_KEY
        echo
        if [ ${#ENCRYPTION_KEY} -lt 16 ]; then
            echo "Error: Encryption key must be at least 16 characters for security."
            exit 1
        fi
    fi
}

# Function to encrypt config.dart to galaxy
encrypt_file() {
    if [ ! -f "$CONFIG_FILE" ]; then
        echo "Error: $CONFIG_FILE does not exist."
        exit 1
    fi

    get_encryption_key
    echo "Encrypting $CONFIG_FILE to $ENCRYPTED_FILE..."
    openssl enc -aes-256-cbc -salt -pbkdf2 -iter 100000 -in "$CONFIG_FILE" -out "$ENCRYPTED_FILE" -pass pass:"$ENCRYPTION_KEY"
    if [ $? -eq 0 ]; then
        echo "Encryption successful. $ENCRYPTED_FILE created."
    else
        echo "Error: Encryption failed."
        exit 1
    fi
}

# Function to decrypt galaxy to config.dart
decrypt_file() {
    if [ ! -f "$ENCRYPTED_FILE" ]; then
        echo "Error: $ENCRYPTED_FILE does not exist."
        exit 1
    fi

    get_encryption_key
    echo "Decrypting $ENCRYPTED_FILE to $CONFIG_FILE..."
    openssl enc -aes-256-cbc -d -pbkdf2 -iter 100000 -in "$ENCRYPTED_FILE" -out "$CONFIG_FILE" -pass pass:"$ENCRYPTION_KEY"
    if [ $? -eq 0 ]; then
        echo "Decryption successful. $CONFIG_FILE created."
    else
        echo "Error: Decryption failed. Check your encryption key."
        exit 1
    fi
}

# Copy template files
copy_template_file() {
    cp script/template/config lib/app/config.dart
}

# Function to display usage
usage() {
    echo "Usage: $0 {encrypt|decrypt|copy}"
    echo "  encrypt:    Encrypt $CONFIG_FILE to $ENCRYPTED_FILE"
    echo "  decrypt:    Decrypt $ENCRYPTED_FILE to $CONFIG_FILE"
    echo "  copy:       Copy template files"
    exit 1
}

# Check for OpenSSL
check_openssl

# Check for command-line argument
if [ $# -ne 1 ]; then
    usage
fi

# Execute based on command
case "$1" in
    encrypt)
        encrypt_file
        ;;
    decrypt)
        decrypt_file
        ;;
    copy)
        copy_template_file
        ;;
    *)
        usage
        ;;
esac