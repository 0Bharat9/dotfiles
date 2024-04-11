# Custom prompt with colors and Git branch information
PS1='\[\e[1;32m\]\u\[\e[m\]@\[\e[1;35m\]\h\[\e[m\]:$(parse_git_branch)\[\033[00m\] \[\e[1;34m\]\w\[\e[m\]\n\[\e[1;35m\]➜\[\e[m\]'

# Add Git branch information to prompt
parse_git_branch() {
    local branch_name
    branch_name=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
    if [ -n "$branch_name" ]; then
        echo " ($branch_name)"
    fi
}


# Enable syntax highlighting for `ls` command
if [ -x "$(command -v dircolors)" ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Enable extended pattern matching features
shopt -s extglob

# Alias definitions
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

#aaj ka din
alias da='date "+%Y-%m-%d %A %T %Z"'

# directory alias
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'
alias mkdir='mkdir -p'
alias ping='ping -c 10'
alias cls='clear'
alias apt-get='sudo apt-get'
alias nv='nvim'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# Alias's for multiple directory listing commands
alias la='ls -Alh' # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

alias openports='netstat -nape --inet'

#show all logs /var/log/
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# Enable history search with arrow keys
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Customize completion colors
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# Set editor to Vim (change to your preferred editor)
export EDITOR=nvim

# Extracts any archive(s) (if unp isn't installed)
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# Display a welcome message with ASCII art

clear
echo -e "\e[1;35m"
cat << "EOF"
██████╗ ██╗   ██╗████████╗    ██╗    ██╗██╗  ██╗██╗   ██╗██████╗ 
██╔══██╗██║   ██║╚══██╔══╝    ██║    ██║██║  ██║╚██╗ ██╔╝╚════██╗
██████╔╝██║   ██║   ██║       ██║ █╗ ██║███████║ ╚████╔╝   ▄███╔╝
██╔══██╗██║   ██║   ██║       ██║███╗██║██╔══██║  ╚██╔╝    ▀▀══╝ 
██████╔╝╚██████╔╝   ██║       ╚███╔███╔╝██║  ██║   ██║     ██╗   
╚═════╝  ╚═════╝    ╚═╝        ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝     ╚═╝   
EOF
echo -e "\e[m"

