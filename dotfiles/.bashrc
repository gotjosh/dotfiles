#!/bin/bash

for file in ~/.bash/*.bash; do
  source $file
done

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/josueabreu/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/josueabreu/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/josueabreu/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/josueabreu/Downloads/google-cloud-sdk/completion.bash.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
