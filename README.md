Emacs
=====
This is my Emacs config files on Linux and Mac OSX.
The "emacs" file is the main config file.

# Install

## JEDI
```bash
sudo pip install virtualenv
cd ~/.env/
virtualenv default
M-x package-install RET jedi RET
M-x jedi:install-server
sudo ln -f /Users/yayu/.env/default/bin/jediepcserver /usr/local/bin/jediepcserver
```


## Exec path

```bash
M-x package-install-file ~/Emacs/opt/misc/exec-path-from-shell.el
```


## Golang packages
```bash
https://gopm.io/
sudo cp /Users/yayu/Golang/bin/godef /usr/local/bin
```


# Intro

### bin ###
binary files.now there is only "csope-indexer" for xscope.

### data ###
cache files,history files,index files.... i have set nearly all the
extension's data dir to this.

### dev ###
various language support.

* cpp
* asm
* markdown
* json / avsc
* perl
* pig
* haskell
* elrang
* sql
* yaml
* log Files
* bash
* Dockerfile
* rust
* R
* golang ( godef,flymake,autocomplete)
* xml
* php
* js 
* html5
* css
* scala
* python
* lisp (slime,scheme,pairedit)
* ocaml
* plantuml
* coffee

  `npm install -g coffeelint`

  `npm install -g coffee`
    

### elpa ###
packages download from the official package  site.

### etc ###
this dir has been discarded. a separated version fo my main ".emacs" file.

### gui ###
some setting about the UI.

* smart-mode-line
* paren
* highlight-parentheses
* smartparens
* right margin
* indent-guide
* uniquify
* recentf
* NeoTree
* multi cursor
* popwin
* kpm-list
* dired+
* emms


### opt ###
miscellany

* smart-compile
* shell toggle
* ecb
* elfeed (RSS)
* hacknews
* midnight
* w3m


### usr ###
some global used packages.

* yasnippet
* xscope
* auto-complete
* helm


