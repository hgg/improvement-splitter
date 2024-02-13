#!/bin/bash

SOURCE_DIR="$(dirname "$BASH_SOURCE")" # Get the directory of the current script
SOURCE_FILE="./alias.sh"


# Check if the source file exists
if [ -f "$SOURCE_FILE" ]; then
    if [[ -f "$HOME/.bashrc" ]]; then
        cp -f "$SOURCE_FILE" "$HOME/extract_improvements_git_alias"
        echo "Source file copied to $HOME/extract_improvements_git_alias"
        echo "source $DESTINATION_FILE" >> "$HOME/.bashrc"
        echo "Alias file sourced from $HOME/.bashrc"
    elif [[ -f "$HOME/.zshrc" ]]; then
        if [[ -d "$HOME/.oh-my-zsh/custom" ]]; then
            cp -f "$SOURCE_FILE" "$HOME/.oh-my-zsh/custom/extract_improvements_git_alias.zsh"
            echo "Alias file copied to $HOME/.oh-my-zsh/custom/extract_improvements_git_alias.zsh"
        else
            cp -f "$SOURCE_FILE" "$HOME/extract_improvements_git_alias"
            echo "Source file copied to $HOME/extract_improvements_git_alias"
            echo "source $DESTINATION_FILE" >> "$HOME/.zshrc"
            echo "Alias file sourced from $HOME/.zshrc"
        fi
    else
        echo "Unable to find shell profile file (.bashrc or .zshrc)"
    fi
else
    echo "Source file $SOURCE_FILE does not exist"
fi
