#! /bin/bash

[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

if [ -f $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc ]; then
  . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
fi

if [ -f $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc ]; then
  . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
fi

# add kubectl bash completetion
source <(kubectl completion bash)
