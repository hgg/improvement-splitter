# Automatic Improvement Splitting

This script contains a few bash functions to help automate the process of splitting improvements to a different branch.

## Setup
A script for setting up the functions is included, but they can easily be added manually to your existing alias file or even directly on your shell profile (please don't :sweat_smile:)

1. Clone the repository
2. Run the `setup.sh` script to set up new functions/alias
```bash
$ chmod +x setup.sh
$ ./setup.sh
```
3. Restart your terminal

The setup script currently supports:
* Zsh 
  * Uses the Oh-my-zsh custom folder when applicable
* Bash
  
## Usage
1. As you find improvements, tag them with the `gcmui` command. This is still a normal commit, so you can add a message.
```sh 
$ git add lib/file-with-unrelated-changes.ex
$ gcmui "Fix ordering of statement"
```
2. When you are ready to split the improvements use the `gcbui` command. You should specify the name of the improvements branch.
```sh
$ gcbui hg/small-improvements
```

All of the improvements should have been moved the selected branch.

The commands `gcmui` and `gcbui` should be somewhat familiar as they are based on the common aliases for `git commit -m` `gcm` and `git checkout -b` `gcb`, with the  added `ui` suffix for `unrelated improvements`.