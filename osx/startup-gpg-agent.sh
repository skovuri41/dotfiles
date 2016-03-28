# ${HOME}/.gpg-agent-info is the default filename
if test -f $HOME/.gpg-agent-info && \
	kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info | head -1` 2>/dev/null; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
   echo $GPG_AGENT_INFO
else
    echo "starting gpg-agent"
    eval `/usr/local/bin/gpg-agent --daemon --write-env-file`
fi
