#! /bin/bash

if [ -f $(brew --prefix autoenv)/activate.sh ]; then
  . $(brew --prefix autoenv)/activate.sh
fi
