if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# Enable tracking the upstream branch'
GIT_PROMPT_SHOW_UPSTREAM=1
GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
GIT_PROMPT_THEME=Evermeet # use theme optimized for solarized color scheme
