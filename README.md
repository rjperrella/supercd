# supercd

## Overview
This is my Bash script for navigating directories.  

In order for the aliases and functions to work, you need to source this script, not run it.

```bash
. ./supercd.sh
```

## Usage

```bash
. ./supercd.sh
```

This replaces the built-in cd command with an alias that runs a function.

This enhanced version of cd will remember all of the directories into which you navigate.  It also de-duplicates the list.

To see and select a prior directory, type:

```bash
cd --
```

Press the number that corresponds to your directory.

If you change directories to a file, it will cd to the directory portion of that filename. This makes it easy to cd to a directory by just pasting the file's name on the command line.

Also, if you have the "dialog" program installed, it will automatically use it to product a selection list.

## Other commands (used far less often)

You can clear the history by typing:

```
supercd_clear
```

You can also pre-populate the history with your own favorite directories by using this command (supercd_add)

```
supercd_add path
```


## Bypassing supercd

Supercd's syntax should not affect your scripts however if you want to bypass it, you can still invoke the built in cd command by typing

```bash
builtin cd blablabla
```

If you use the 'builtin' command, you are effectively bypassing *supercd*.


## TODO

Perhaps provide an option to ignore dialog if you don't want to use it...


