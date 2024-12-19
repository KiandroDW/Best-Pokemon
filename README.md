# Best-Pokemon
This calculates your favorite pokémon

## dependencies:
1. python32 with `tkinter` and `pillow`
2. terminal to run bash scripts

## How to configure python
`pillow` can be installed with `pip install pillow`, however, not all python installments come with tkinter automaticly installed, here's what to do if it isn't:

### Windows
Windows installations should come with `tkinter` already installed. Try reinstall Python from the [official website](https://www.python.org/) and make sure to check the box for "Install for all users" and "Add Python to PATH" during installation.

### macOS
On macOS, `tkinter` should be included if you installed Python via the official Python.org installer. However, if you installed Python through Homebrew, you may need to explicitly install `tk`:
```sh
brew install python-tk
```

### Linux
`tkinter` isn't automaticly installed on linux, try this:
* Debian/Ubuntu:
```sh
sudo apt install python3-tk
```
* Red Hat/Fedora
```sh
sudo dnf install python3-tkinter
```
* Arch
```sh
sudo pacman -S tk
```

After this the program should run

## Bash scripts
There are 2 bash scripts included, but these aren't necesairy to run the program, `clearFiles.sh` makes sure `won.txt` and `lost.txt` are empty, this is mostly for testing purposes. `calculateScores.sh` takes all the data from `won.txt` and `lost.txt` to show which pokémon has the highest rating and how often they won.

## How to run the program
In the root folder, use `python3 main.py` to start the program. A screen will show up with 2 pokémon, you have to choose your favorite. This can be done using a mouseclick or the Left and Right arrow keys. Remember that there are 1025 pokémon, so to get acurate results, you need to do a lot of comparisons.

## Goals
I want to create a dataset of the favorite pokémon of certain groups of people, since this can be drasticly different from the global mean. If you want to add your data to the total data of this test, feel free to make an issue and attach your `won.txt` and `lost.txt` files.

## Credits
All spites are owned by The Pokémon Company
Idea by Thomas Game Docs
