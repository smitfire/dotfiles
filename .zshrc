# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
PATH=$PATH:~/bin
export PATH
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mrtazz"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
COMPLETION_WAITING_DOTS="true"

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
plugins=(git ruby rails brew zeus xcode terminalapp svn sublime rbenv rake postgres node npm heroku github gitignore git-extras common-aliases colorize bundler python)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/NickSmit/.rbenv/shims:/Users/NickSmit/.rbenv/bin:/usr/local/opt/nvm/v0.10.33/bin:/usr/local/bin:/Users/NickSmit/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/lib/node_modules"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshfig="subl ~/.zshrc"
alias gitfig="subl ~/.gitconfig"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias g="git"
alias pim="profanity"
alias git="hub"
alias hku="heroku"
alias hrake="heroku run rake"
alias dbreset="rake db:drop && rake db:create && rake db:migrate && rake db:seed"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias rdb="rake db"
alias susp="suspenders"
alias brewdr="brew doctor"
alias brewup="brew update"
alias brewadd="brew install"
alias ll="ls -Gp"

export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:/usr/local/lib/node_modules"
source $(brew --prefix nvm)/nvm.sh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

susp_gh_hku() {
  suspenders "$1" --github "$2" --heroku true
}

susp_hku(){
  suspenders "$1" --heroku true
}

ghc() {
  if [ $1 ]
  then
    repo_name=$1
  else
    echo "Repo name?"
    read repo_name
  fi

  curl -u 'voodoolabs:04ef5f3d735c87233d7b5f0a93dd3478df0c003c' https://api.github.com/user/repos -d '{"name":"'$repo_name'"}'
  git remote add origin git@github.com:voodoolabs/$repo_name.git
  git push -u origin master
}

gcmp() {
  git add -A
  git commit -m "$1"
  git push
}
