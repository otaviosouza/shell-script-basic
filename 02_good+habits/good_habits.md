# Good habits

## Main topics

**Header**
- Name of the script
- Maintainer
- Usage example
- Version control
- Where was tested

**Code structure**

**Comments**

**Code formatting**

## Header and Code structure

### Header example
```shell
#!/usr/bin/env bash
#
# scriptName.sh - short description
#
# Author:       Your Name
# Maintainer:   Your Name and/or Other Name
# Website:      https://yourdomain.com.br
#
# ------------------------------------------
# More detailed description about the script,
# including way to use.
#
# Example:
#   $ ./scriptName.sh -d 1
#   In this example the script will run in
#   debug mode level 1.
#
# ------------------------------------------
# Change log:
#   v1.0 dd/mm/yyyy, Author:
#       - What has changed?
#       - Why changed?
#
#   v1.1 dd/mm/yyyy, Author:
#       - What has changed?
#       - Why changed?
#
# ------------------------------------------
# Tested on:
#   bash 5.1.0
# ------------------------------------------
# Thanks:
#   Eric Idle - Found a bug in login.
#   Graham Chapman - Suggested to add the -h.
#
# ------------------------------------------
```

### Code structure example
```shell
# --- Global variables
#
#
# --- Tests
#
#
# --- Functions
#
#
# --- Execution
#
#
```

### Comments
> Comments need to be done in moderation.

1. Validate the need.
    - Is the code line obvious?
2. Be objective.

### Code formatting
- Use the same formatting for all codes.
- Try to use the editor's indentation.
- When there are long commands, break lines in parameters.
```shell
#!/usr/bin/env bash

# find / -iname "*.so" -user cleese -type f -size +1M -exec ls {} \;

find / -iname "*.so" \
    -user cleese    \
    -type f         \
    -size +1M       \
    -exec ls {}     \;
```