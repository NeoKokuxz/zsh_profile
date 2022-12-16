autoload -Uz compinit && compinit
autoload -U colors && colors
autoload -U promptinit && promptinit
# PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# case insensitive path-completion 
zstyle ':completion:*' matcher-list '' '+m:{a-zA-Z}={A-Za-z}' '+r:|[._-]=* r:|=*' '+l:|=* r:|=*'
setopt MENU_COMPLETE
# Load version control information
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' -> ( on %b )' 
precmd() {
    precmd() {
        vcs_info 
        echo
    }
}
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
# PROMPT='${PWD/#$HOME/~} ${vcs_info_msg_0_} > '
# PROMPT='%F{87}%n%F{93}@%F{81}%m:%F{195}%~%f-%F{green}% ${vcs_info_msg_0_} %f: '
PROMPT='%F{195}%~%f%F{81}% ${vcs_info_msg_0_}%f %# '
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
module_init
