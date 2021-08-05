. ~/.bashrc
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
export GPG_TTY=$(tty)
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/josueabreu/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/josueabreu/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/josueabreu/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/josueabreu/Downloads/google-cloud-sdk/completion.bash.inc'; fi
