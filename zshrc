# Path to your oh-my-zsh installation.
export ZSH=/Users/yurii.rochniak/.oh-my-zsh
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
zplug "popstas/zsh-command-time"
zplug "zpm-zsh/colorize"
zplug "arzzen/calc.plugin.zsh"
zplug "hlissner/zsh-autopair", defer:2
zplug "zpm-zsh/tmux"
zplug "droctothorpe/kubecolor"
zplug "ael-code/zsh-colored-man-pages"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

plugins=(git aws common-aliases encode64 gem pip python rsync sudo terraform vagrant brew docker fzf vault)

zplug load

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/MacGPG2/bin"
export PATH="/usr/local/sbin:$PATH"
## Python binaries
export PATH="/Users/yurii.rochniak/Library/Python/2.7/bin:$PATH"
export PATH="/Users/yurii.rochniak/Library/Python/3.7/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL=

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
####

export GPG_TTY=`tty`
alias ll="ls -l"
alias la="ls -lah"
alias mtr="sudo /usr/local/sbin/mtr"
alias flush_dns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
alias srk="ssh-keygen -R"
alias sshq="ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias dev-env="source ~/.preply/dev.env"
alias db-local="source ~/.preply/db_local.env"
alias d="dirs -v"

#Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=~/Golang
export PATH="$GOPATH/bin:$PATH"
# Rust
export PATH=$PATH:~/.cargo/bin

# Search by public IP
function pubip {
  if [ $# -ge 1 ] ; then
    if [ $# -lt 2 ] ; then region=eu-west-1 ; else region=$2 ; fi
      if [ $# -lt 3 ] ; then profile=default ; else profile=$3 ; fi
        aws ec2 describe-instances --query 'Reservations[].Instances[].PublicIpAddress' --output text --instance-ids $1 --region $region --profile $profile
  fi
}

# Tmux:
alias tmux="TERM=screen-256color tmux"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Cellar/tfenv/1.0.1/bin/terraform terraform

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
local ret_status="%(?:%{$fg_bold[green]%}>> :%{$fg_bold[red]%}>> %s)"
PROMPT='${ret_status}%{$fg_bold[blue]%}%* %{$reset_color%}%{$fg_bold[green]%}%p%{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%}'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# thefuck
eval $(thefuck --alias)
fpath+=${ZDOTDIR:-~}/.zsh_functions

alias vim="nvim" # coz I always mess up with it

# Kube
# source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
# PS1='$(kube_ps1)'$PS1
alias kc="kubectl"

# Set k8s namespace
function kns {
    if [ $# -eq 0 ] ; then
        echo "No namepsace specified!"
    fi
    if [ $# -gt 1 ] ; then
        echo "You may specify only one namespace!"
    fi
    if [ $# -eq 1 ] ; then
        kubectl config set-context $(kubectl config current-context) --namespace=$1
    fi
}

export FZF_DEFAULT_COMMAND="rg --files --hidden --smart-case --glob '!.git/*'"

if [ $TERM == 'xterm-kitty' ] ; then
    # Kitty
    autoload -Uz compinit
    compinit
    # Completion for kitty
    kitty + complete setup zsh | source /dev/stdin
    alias kdiff="kitty +kitten diff"
    # SSH fix for Kitty
    alias ssh="kitty +kitten ssh"
    # krew
    export PATH="$PATH:$HOME/.krew/bin"
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Tfenv
export PATH="/usr/local/Cellar/tfenv/1.0.1/bin:$PATH"

# Restart wifi
function wifit () {
        networksetup -setairportpower Wi-Fi off
        sleep 1
        networksetup -setairportpower Wi-Fi on
}
