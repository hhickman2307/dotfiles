###########
# ALIASES #
###########

alias tmux='tmux -2'                                # Launch Tmux in 256 Color Mode
alias grep='grep --color=auto'                      # Highlight Pattern
alias :q='exit'                                     # Add vim exit to prompt
alias rootme='sudo -s'                              # Switch to root
alias reboot='sudo shutdown -r now'                 # Reboot computer
alias ..='cd ..'                                    # Go up a directory
alias driveusage='df -h'                            # Show hard drive usage
alias showallaliases='compgen -A alias'             # Shows all aliases
alias showallfunctions='compgen -A function'        # Shows all functions
alias showvimcolors='ls ~/.vim/colors/'             # List all Vim Colorschemes
alias temperature='acpi -tf && acpi-t'              # Prints temperature in F and C
alias tree='tree -L '                               # Trees <n> levels of cwd
alias funnycommands='cat ~/Documents/funnycommands.txt'


###################
# SPOTIFY ALIASES #
###################

alias spotifynext='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next'
alias spotifyprev='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Prev'
alias spotifypause='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause'
alias spotifyplay='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause'
alias vol='amixer set -q Master '

################
# WORK ALIASES #
################

alias rebuild_all='cd ~/Warthog/scripts/build; ./build_packages.sh; cd ~/Warthog/vagrant/dev_env; vagrant reload; cd ~/Warthog/provisioning-ansible; ansible-playbook playbook.yml -i inventory --tags rebuild_all'
alias py.test='py.test -v'

################
# MISC ALIASES #
################

alias starwars='telnet towel.blinkenlights.nl'      # Star Wars ASCII

