#!/bin/bash

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

for file in ~/.bash/*.bash; do
  source $file
done

