########################
# ORIGINAL BASHRC FILE #
########################


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#####################
# MY BASHRC CHANGES #
#####################

if [ "$PS1" ]; then     # If running interactively, then run till 'fi' at EOF:

OS=$(uname)             # For resolving os differing switches

###############
# COLOR CHART #
###############

# REGULAR
txtblk='\e[0;30m' # Black
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

# BOLD
bldblk='\e[1;30m' # Black
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White

# UNDERLINE
unkblk='\e[4;30m' # Black
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White

# BACKGROUND
bakblk='\e[40m'   # Black
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White

txtrst='\e[0m'    # Text Reset


###########################
# COMMAND PROMPT SETTINGS #
###########################
# Check Ultimate Bash RC  #
# For Additional Options  #
###########################

source ~/.git-prompt.sh


## Check if a profile is set
#
#if [[ $PROFILE ]]; then
#    echo "Profile $PROFILE found"
#    changeprofile $PROFILE
#else
#    echo "Profile not set, using default"
#    changeprofile ROMAN
#fi

export CDDIR="$HOME"                        # Default directory for cd with no argument
export EDITOR='vim'                         # Default to vim for editing
export HISTCONTROL=ignoreboth:erasedups     # Ignore duplicate commands and leading spaces in bash history
export HISTFILESIZE=10000                   # Store the last 10000 commands
set -o ignoreeof                            # Cant C-d out of shell
set -o noclobber                            # Disallow > to work on files that already exist
set visible-stats on                        # When listing file completions put / after directory names and * after programs
shopt -s extglob                            # Necessary for bash completion (programmable completion)
ulimit -S -c 0                              # Disable core dumps


#############
# FUNCTIONS #
#############

function randomwp()
# for GNOME3
{
##################################################
# Random-Gnome3-Wallpaper.sh             #
# Creator:              Inameiname       #
# Major Contributor:    hwttdz           #
#           (did most of work :P)    #
# Version:              1.1          #
# Last modified:        18 October 2011      #
# License:              GPLv3+           #
# Descripton:                    #
# Script to randomly set desktop/gdm background  #
# from files in a directory(s) in GNOME3     #
# Requires: sudo-apt get install randomize-lines #
##################################################
###### just add/remove as many directories as wish
find "$HOME/Pictures/Wallpaper" -type f \( -name "*.bmp" -or -name "*.BMP" -or -name "*.jpeg" -or -name "*.JPEG" -or -name "*.jpg" -or -name "*.JPG" -or -name "*.png" -or -name "*.PNG" -or -name "*.svg" -or -name "*.SVG" \)|rl|head -n 1|xargs -I{} bash -c "gsettings set org.gnome.desktop.background picture-uri \"file://{}\""
}


# Convert Base64

function decodeb64()
{
    if [[ $1 ]]; then
        echo "Decoding input..."
        echo
        echo $1 | base64 --decode
        echo
        echo
    fi
}


# Temperature conversion script that lets the user enter
# a temperature in any of Fahrenheit, Celsius or Kelvin and receive the
# equivalent temperature in the other two units as the output.
# usage:        convertatemp F100 (if don't put F,C, or K, default is F)

function convertatemp()
{
if uname | grep 'SunOS'>/dev/null ; then
  echo "Yep, SunOS, let\'s fix this baby"
  PATH="/usr/xpg4/bin:$PATH"
fi
if [ $# -eq 0 ] ; then
  cat << EOF >&2
Usage: $0 temperature[F|C|K]
where the suffix:
   F    indicates input is in Fahrenheit (default)
   C    indicates input is in Celsius
   K    indicates input is in Kelvin
EOF
fi
unit="$(echo $1|sed -e 's/[-[[:digit:]]*//g' | tr '[:lower:]' '[:upper:]' )"
temp="$(echo $1|sed -e 's/[^-[[:digit:]]*//g')"
case ${unit:=F}
in
  F ) # Fahrenheit to Celsius formula:  Tc = (F -32 ) / 1.8
  farn="$temp"
  cels="$(echo "scale=2;($farn - 32) / 1.8" | bc)"
  kelv="$(echo "scale=2;$cels + 273.15" | bc)"
  ;;
  C ) # Celsius to Fahrenheit formula: Tf = (9/5)*Tc+32
  cels=$temp
  kelv="$(echo "scale=2;$cels + 273.15" | bc)"
  farn="$(echo "scale=2;((9/5) * $cels) + 32" | bc)"
  ;;
  K ) # Celsius = Kelvin + 273.15, then use Cels -> Fahr formula
  kelv=$temp
  cels="$(echo "scale=2; $kelv - 273.15" | bc)"
  farn="$(echo "scale=2; ((9/5) * $cels) + 32" | bc)"
esac
echo "Fahrenheit = $farn"
echo "Celsius    = $cels"
echo "Kelvin     = $kelv"
}


# Convert to roman numerals
function roman-numeral()
{
python -c 'while True: print (lambda y,x=[],nums={ 1000:"M",900:"CM",500:"D",400:"CD",100:"C",90:"XC",
50:"L",40:"XL",10:"X",9:"IX",5:"V",4:"IV",1:"I"}: (lambda ro=(lambda : map(lambda g,r=lambda b:x.append(
y[-1]/b),t=lambda v:y.append(y[-1]%v):map(eval,["r(g)","t(g)"]),sorted(nums.keys())[::-1]))():"".join(
map(lambda fg: map(lambda ht: nums[ht],sorted(nums.keys())[::-1])[fg] * x[fg],range(len(x)))))())([int(
raw_input("Please enter a number between 1 and 4000: "))])'
}


###############
# Bookmarking #
###############

# Bookmarking the current directory in 'alias' form
function bookmark() {
    # copyright 2007 - 2010 Christopher Bratusek
    if [[ $1 != "" && $(alias | grep -w go-$1) == "" ]]; then
        echo "alias go-$1='cd $PWD'" >> $HOME/.bookmarks
        . $HOME/.bookmarks
    elif [[ $1 == "" ]]; then
        echo "need name for the bookmark."
    else    echo "bookmark go-$1 already exists."
    fi
}

function listbookmarks() {
    cat $HOME/.bookmarks
}

function unmark() {
    # copyright 2007 - 2010 Christopher Bratusek
    if [[ $(alias | grep -w go-$1= ) != "" ]]; then
        sed -e "/go-$1/d" -i $HOME/.bookmarks
        xunalias go-$1
    fi
}


################
# WEBFUNCTIONS #
################

# Google search
function google()
{
    google-chrome "http://www.google.com/search?&num=100&q=${@}" &
}

# Definition Search
function define()
{
    curl dict://dict.org/d:"$@"
}

# Weather-util
# Requires "weather-util" and "weather-util-data"
# sudo apt-get install weather-util weather-util-data
# Usage = weather 'zip'/'location'/'code'

# Weather search without extended forecast
alias weather='weather-util'

# weather search with extended forecast
alias weatherf='weather-util --forecast'

###### weather by US zip code - Can be called two ways
# weather 50315 
# weather "Des Moines"

function weather_()
{
declare -a WEATHERARRAY
WEATHERARRAY=( `lynx -dump http://google.com/search?q=weather+$1 | grep -A 5 '^ *Weather for' | grep -v 'Add to'`)
echo ${WEATHERARRAY[@]}
}



##################################################
# Youtube stuff                  #
##################################################

# Stream YouTube videos directly to your media player
function mtube() {
  video_id=$(curl -s $1 | sed -n "/watch_fullscreen/s;.*\(video_id.\+\)&title.*;\1;p");
  mplayer -fs $(echo "http://youtube.com/get_video.php?$video_id");
}

alias mtube_='mplayer -fs $(echo "http://youtube.com/get_video.php?$(curl -s "$1" | sed -n "/watch_fullscreen/s;.*\(video_id.\+\)&title.*;\1;p")")'

# mps-youtube
# requires "python-pip" and mps-youtube
# sudo apt-get install python-pip
# sudo pip install mps-youtube
# sudo pip install mps-youtube --upgrade
alias youtube='mpsyt'

# Youtube-dl
# requires "youtube-dl"
# sudo apt-get install youtube-dl
alias yt='youtube-dl -t'

# YouTube convert and download all user's videos to MP3s on the fly
function yt2mp3() { for j in `seq 1 301`;do i=`curl -s gdata.youtube.com/feeds/api/users/$1/uploads\?start-index=$j\&max-results=1|grep -o "watch[^&]*"`;ffmpeg -i `wget youtube.com/$i -qO-|grep -o 'url_map"[^,]*'|sed -n '1{s_.*|__;s_\\\__g;p}'` -vn -ab 128k "`youtube-dl -e ${i#*=}`.mp3";done;}

function yt2mp3-chanrip() { for count in 1 51 101 151 201 251 301; do for i in $(curl -s http://gdata.youtube.com/feeds/api/users/"$1"/uploads\?start-index="$count"\&max-results=50 | grep -Eo "watch\?v=[^[:space:]\"\'\\]{11}" | uniq); do ffmpeg -i $(wget http://youtube.com/"$i" -qO- | sed -n "/fmt_url_map/{s/[\'\"\|]/\n/g;p}" | sed -n '/^fmt_url_map/,/videoplayback/p' | sed -e :a -e '$q;N;5,$D;ba' | tr -d '\n' | sed -e 's/\(.*\),\(.\)\{1,3\}/\1/') -vn -ab 128k "$(youtube-dl -e http://youtube.com/"$i").mp3"; done; done; unset count i; }

# Play YouTube's first match directly
function ytplay() { args="$*";mplayer -fs $(youtube-dl -g "http://www.youtube.com$(lynx --source "http://www.youtube.com/results?search_query=${args// /+}&aq=f"|grep -m1 '<a id=.*watch?v=.*title'|cut -d\" -f4)"); }

# Download entire YouTube channel - all of a user's videos                  #
function yt-chanrip() { for i in $(curl -s http://gdata.youtube.com/feeds/api/users/"$1"/uploads | grep -Eo "watch\?v=[^[:space:]\"\'\\]{11}" | uniq); do youtube-dl --title --no-overwrites http://youtube.com/"$i"; done }

# Download YouTube music playlist and convert it to mp3 files
function yt-pl2mp3() { umph -m 50 $1 | cclive -f mp4_720p; IFS=$(echo -en "\n\b"); for track in $(ls | grep mp4 | awk '{print $0}' | sed -e 's/\.mp4//'); do (ffmpeg -i $track.mp4 -vn -ar 44100 -ac 2 -ab 320 -f mp3 $track.mp3); done; rm -f *.mp4 ; }


######################################
# Simple note taker                  #
######################################

function note()
{
        # if file doesn't exist, create it
        [ -f $HOME/.notes ] || touch $HOME/.notes
        # no arguments, print file
        if [ $# = 0 ]
        then
            cat $HOME/.notes
        # clear file
        elif [ $1 = -c ]
        then
            rm $HOME/.notes
        # add all arguments to file
        else
            echo "$@" >> $HOME/.notes
        fi
}


##########################################
# Reminder for whatever whenever         #
##########################################

function remindme()
{
    sleep $1 && zenity --info --text "$2" &
}


##############
# Tree stuff #
##############

###### shows directory tree (requires 'tree': sudo apt-get install tree)
function treecd() 
{
    builtin cd "${@}" &>/dev/null
    . $BSNG_RC_DIR/dirinfo/display
    dirinfo_display
    echo -e "${epink}content:"
    tree -L 1 $TREE_OPTS
    echo "$PWD" > $HOME/.lastpwd
}

###################
# PROFILE CONTROL #
###################

function parse_git_branch()
{
    git branch 2> /dev/null | grep -e '*'
}

changeprofile()
{
    # Changes bash profile to the given string
    case "$1" in
        ROMAN)
            export PS1='\[\e[0;33m\][\u@\h \w]\$\[\e[0m\] '    # Roman theme
            export PROFILE='ROMAN'                      # Set environment variable
            ;;
        MATRIX)
            export PS1='\[\e[0;32m\][\u@\h \w]\$\[\e[0m\] '    # Matrix Theme
            export PROFILE='MATRIX'                     # Set environment variable
            ;;
        REGAL)
            local Blue="\e[38;5;4m"
            local Yellow="\e[38;5;0;33m"
            local NC="\e[0m" #White
            export PS1="\[$Blue\033(0\154\033(B\][\[\033(0\161\161\033(B$Blue\][\[$Yellow\]\u\[$Blue\]]\[\033(0\161\033(B\][\[$Yellow\]\w\[$Blue\]]\[\033(0\161\033(B\][\[$Yellow\]$(parse_git_branch) \[$Blue\]]\[\033(0\161\161\033(B\]]\n\[$Blue\033(0\155\161\033(B$Blue\][\[$Yellow\]\#\[$Blue\]]\[\033(0\161\033(B\][\[$Yellow\]\$\[$Blue\]]\[\033(0\161\161\033(B\][\[$NC\]"
            export PROFILE='REGAL'
            ;;
        STEEL)
          local Gray="\e[38;5;239m"
          local Red="\e[38;5;196m"
          local NC="\e[0m" #White
          export PS1="\[$Gray\033(0\154\033(B\][\[\033(0\161\161\033(B$Gray\][\[$Red\]\u\[$Gray\]]\[\033(0\161\033(B\][\[$Red\]\w\[$Gray\]]\[\033(0\161\033(B\][\[$Red\]\$(__git_ps1) \[$Gray\]]\[\033(0\161\161\033(B\]]\n\[$Gray\033(0\155\161\033(B$Gray\][\[$Red\]\#\[$Gray\]]\[\033(0\161\033(B\][\[$Red\]\$\[$Gray\]]\[\033(0\161\161\033(B\][\[$NC\]" 
          export PROFILE='STEEL'
          ;;
        RAVEN)
          local DkGrn="\e[38;5;22m"
          local NC="\e[0m"
          export PS1="\[$DkGrn\033(0\154\033(B\][\[\033(0\161\161\033(B$DkGrn\][\[$NC\]\u\[$DkGrn\]]\[\033(0\161\033(B\][\[$NC\]\w\[$DkGrn\]]\[\033(0\161\033(B\][\[$NC\]\$(__git_ps1) \[$DkGrn\]]\[\033(0\161\161\033(B\]]\n\[$DkGrn\033(0\155\161\033(B$DkGrn\][\[$NC\]\#\[$DkGrn\]]\[\033(0\161\033(B\][\[$NC\]\$\[$DkGrn\]]\[\033(0\161\161\033(B\][\[$NC\]" 
          export PROFILE='RAVEN'
          ;;
        RAVENLITE)
          local NC="\e[0m"
          local DkGrn="\e[0;32m"
          export PS1="\[$DkGrn\][ \[$NC\]\u \[$DkGrn\]]-[ \[$NC\]\w \[$DkGrn\]]-[ \[$NC\]"
          ;;
        IMPERIAL)
          local YELLOW="\[\e[0;33m\]"
          local RED="\[\e[38;5;196m\]"
          local NC="\[\e[0m\]"
          export PS1="$YELLOW[ $RED\u $YELLOW]-[ $RED\w $YELLOW]-[ $NC"
          ;;
        IMPERIAL_BOLD)
          local YELLOW="\[\e[1;33m\]"
          local RED="\[\e[38;5;196m\]"
          local NC="\[\e[0m\]"
          export PS1="$YELLOW[ $RED\u $YELLOW]-[ $RED\w $YELLOW]-[ $NC"
          ;;
        *)
            # echo 'No profile found'
            
    esac
            
}

alias useprofile='changeprofile'
alias profile='echo $PROFILE'

# Check if a profile is set

if [[ $PROFILE ]]; then
    changeprofile $PROFILE
else
    changeprofile STEEL
fi

function cd()
{
    builtin cd "$@" && changeprofile
}

################
# LOAD ALIASES #
################
source ~/.bash_aliases


fi      # End of Interactive Check
