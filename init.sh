#!/usr/bin/env bash


# golint
which go > /dev/null  && go get -u github.com/golang/lint/golint || echo "NO go"



# spell check
brew install ispell

ln -sf ~/Emacs ~/.emacs.d
ln -sf ~/Emacs/emacs.el ~/.emacs


# golang packages
go get -u github.com/gdrte/go-bimenu
