#!/bin/bash
# Installs the VS Code extensions listed in the specified text file.
# If this script doesn't reside in the same location where the list
# of installed extensions does, this file should be edited to specify
# the path to the list of extensions.

# IFS= prevents leading/trailing whitespace from being trimmed.
# -r prevents backslash escapes from being interpreted.
while IFS= read -r ext; do
    echo "Installing $ext for VS Code..."
    code --install-extension $ext
done < .vscode-ext
