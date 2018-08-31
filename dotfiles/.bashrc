#!/bin/bash

for file in ~/.bash/*.bash; do
  source $file
done

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
