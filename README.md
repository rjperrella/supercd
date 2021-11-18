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

This replaces the built-in cd command.  YOu can still invoke the built in by typing
```bash
builtin cd blablabla
```

This enhanced version of cd will remember all of the directories which you navigate to.

To see and select a prior directory, type:

```bash
cd --
```

Press the number that corresponds to your directory.

If you change directories to a file, it will cd to the directory portion of that filename. This makes it easy to cd to a directory by just pasting the file's name on the command line.

Also, if you have the "dialog" program installed, it will automatically use it to product a selection list.

## TODO

Perhaps provide an option to ignore dialog if you don't want to use it...


