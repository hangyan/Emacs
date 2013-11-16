
#!/usr/bin/env bash

#############################################
# File:    (>>>FILE_SANS<<<).sh
# Author:  Hang Yan
# Email:   hangyan2@iflytek.com
# Date:    (>>>DATE<<<)
# Brief:   (>>>1<<<)
# Args:    (>>>2<<<)
#############################################


### Auto added by @hangyan ###

# colorful output
NORMAL=$(tput sgr0)
GREEN=$(tput setaf 2; tput bold)
YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)

cl_err() {
    echo "$RED[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@$NORMAL" >&2
}

cl_info() {
    echo  "$GREEN[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@$NORMAL" >&2
}

cl_warn() {
    echo  "$YELLOW[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@$NORMAL" >&2
}



# DEBUG
function debug() { [ "$DEBUG" ] && echo ">>> $*"; }

### Automatic Generation Code End Here! ###

