#!/bin/bash
# Store 50,000 history entries
export HISTSIZE=50000
# Don't store duplicates
export HISTCONTROL=erasedups
# Append to history file
shopt -s histappend
# VIM as the default editor
export EDITOR=vim

stty -ixon
