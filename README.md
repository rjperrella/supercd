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

## TODO

This version does not include the dialog program, but it will be added so that selecting a directory
can be done via a menu.

Also, I want to make this program more tolerant of changing directories to a file. If you do that, just drop off the filename
and cd again.  THis makes cutting and pasting a filename onto the command line more tolerant.


