#!/usr/bin/env bash

### Author : Hang Yan
### Date   : 2014-08-13
### Email  : yanhangyhy@gmail.com
### Desc   : A useful script to do git add / commit / push stuff.

push() {

    git add .
    git commit -am $1

    branch=$2 && export branch

    expect <<'EOF'
spawn "git push origin $env(branch)"
expect "Username for 'https://github.com':"
send "hangyan"
EOF
}



main(){

    local comments="update"
    local branch="master"

    if [[ ! -z "$1" ]];then
        comments=$1
    fi

    if [[ ! -z "$2" ]];then
        branch=$2
    fi

    push $comments $branch 
    
}

main
