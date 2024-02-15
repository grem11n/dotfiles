# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Homebrew
export HOMEBREW_DIR="/opt/homebrew"
# Path to your oh-my-zsh installation.
export ZSH=/Users/yurii.rochniak/.oh-my-zsh
export ZPLUG_HOME=${HOMEBREW_DIR}/opt/zplug
source $ZPLUG_HOME/init.zsh
export XDG_CONFIG_HOME="$HOME/.config"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

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
export ZSH_COMMAND_TIME_MIN_SECONDS=15
zplug "zpm-zsh/colorize"
zplug "arzzen/calc.plugin.zsh"
zplug "hlissner/zsh-autopair", defer:2
# zplug "zpm-zsh/tmux"
zplug "droctothorpe/kubecolor"
zplug "ael-code/zsh-colored-man-pages"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zsh-users/zsh-autosuggestions", depth:1
zplug "unixorn/fzf-zsh-plugin", depth:1
zplug "reegnz/jq-zsh-plugin", depth:1
zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"

export LS_COLORS='di=0;36:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=0;32:*.rpm=0:*.tar=0;31'

#plugins=(git aws common-aliases encode64 gem pip python rsync terraform vagrant brew docker fzf vault ripgrep)

zplug load

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/MacGPG2/bin"
export PATH="/usr/local/sbin:$PATH"
export PATH="${HOMEBREW_DIR}/bin:$PATH"
export PATH="${HOMEBREW_DIR}/sbin:$PATH"
# GNU binaries
PATH="${HOMEBREW_DIR}/opt/findutils/libexec/gnubin:$PATH"
## Python binaries
PY3_VER=$(python3 --version | awk '{print $2}' | awk -F "." '{print $1"."$2}')
export PATH="${HOME}/Library/Python/2.7/bin:$PATH"
export PATH="${HOME}/Library/Python/${PY3_VER}/bin:$PATH"
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
alias mtr="sudo ${HOMEBREW_DIR}/Cellar/mtr/0.95/sbin/mtr"
alias flush_dns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
alias srk="ssh-keygen -R"
alias sshq="ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias dev-env="source ~/.preply/dev.env"
alias db-local="source ~/.preply/db_local.env"
alias d="dirs -v"
alias aws-login="bash $HOME/.aws-cli-auth.sh"
alias gstart="git checkout master && git pull --rebase"

#Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=~/Golang
export PATH="$GOPATH/bin:$PATH"
go_test() {
  go test $* | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/SKIP/s//$(printf "\033[34mSKIP\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | GREP_COLOR="01;33" egrep --color=always '\s*[a-zA-Z0-9\-_.]+[:][0-9]+[:]|^'
}

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

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C ${HOMEBREW_DIR}/Cellar/tfenv/$(tfenv --version | cut -d ' ' -f2 | tr -d '\n')/bin/terraform terraform

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
local ret_status="%(?:%{$fg_bold[green]%}>> :%{$fg_bold[red]%}>> %s)"
#PROMPT='${ret_status}%{$fg_bold[blue]%}%* %{$reset_color%}%{$fg_bold[green]%}%p%{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%}'

#function preexec() {
#  timer=${timer:-$SECONDS}
#}
#
#function precmd() {
#  if [ $timer ]; then
#    timer_show=$(($SECONDS - $timer))
#    export RPROMPT="%F{8}${timer_show}s < %D{%a %F %T} %{$reset_color%}"
#    unset timer
#  else
#    export RPROMPT="%{%F{8}%}%D{%a %F %T} %{$reset_color%}"
#  fi
#}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Kube
# source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
# PS1='$(kube_ps1)'$PS1
alias kc="kubectl"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

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

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
source ${HOMEBREW_DIR}/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias aws-auth='aws-google-auth --resolve-aliases --no-cache -a --bg-response js_enabled'

# Tfenv
export PATH="${HOMEBREW_DIR}/Cellar/tfenv/$(tfenv --version | cut -d ' ' -f2 | tr -d '\n')/bin:$PATH"

# Restart wifi
function wifit () {
        networksetup -setairportpower Wi-Fi off
        sleep 1
        networksetup -setairportpower Wi-Fi on
}

# Kitty configuration
if [[ ${TERM} == 'xterm-kitty' ]] ; then
    # Kitty
    autoload -Uz compinit
    compinit
    # Completion for kitty
    kitty + complete setup zsh | source /dev/stdin
    alias kdiff="kitty +kitten diff"
    # SSH fix for Kitty
    alias ssh="kitty +kitten ssh"
fi

alias tf_vend_rm='find . -name vendor -type d -exec rm -rf {} \;'
alias tf_cache_rm='find . -name .terraform -type d -exec rm -rf {} \;'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fuzzy finder
source $HOME/.config/fzfrc

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Perl
PATH="/Users/yurii.rochniak/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/yurii.rochniak/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/yurii.rochniak/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/yurii.rochniak/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/yurii.rochniak/perl5"; export PERL_MM_OPT;

# Ruby
export PATH="/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="${HOMEBREW_DIR}/Cellar/ruby/3.2.0/bin:$PATH"

tmux-window-name() {
	($HOME/.tmux/plugins/tmux-window-name/scripts/rename_session_windows.py &)
}

add-zsh-hook chpwd tmux-window-name
