if status is-interactive
    # Commands to run in interactive sessions can go here

    # Getting rid of fish's greeting
    set -g fish_greeting

    # Use starship
    function starship_transient_prompt_func
        starship module character
    end
    if test "$TERM" != "linux"
        starship init fish | source
        enable_transience
    end
end

# Format man pages
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Append common directories for executable files to $PATH
fish_add_path ~/.local/bin ~/.cargo/bin ~/go/bin ~/flutter/bin

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T ' $argv
end

# updating the operating system
function update
    echo "📦 updating..."
    sudo pacman -Syu
    if command -sq yay
        yay -Sua --noconfirm
    else if command -sq paru
        paru -Sua --noconfirm
    end
end

# make directory and chnage to it
function mkcd
    mkdir -p $argv[1]; and cd $argv[1]
end

# extract file
function extract
    if test -f $argv[1]
        switch $argv[1]
            case '*.tar.bz2';  tar xjf $argv[1]
            case '*.tar.gz';   tar xzf $argv[1]
            case '*.tar.xz';   tar xJf $argv[1]
            case '*.tar';      tar xf  $argv[1]
            case '*.bz2';      bunzip2 $argv[1]
            case '*.gz';       gunzip  $argv[1]
            case '*.zip';      unzip   $argv[1]
            case '*.rar';      unrar x $argv[1]
            case '*.7z';       7z x    $argv[1]
        end
    else
        echo ": file notfound$argv[1]"
    end
end

# creating a backup
function backup
    cp -r $argv[1] "$argv[1].bak.(date +%Y%m%d_%H%M%S)"
    echo "✅ creat backup"
end

# activate zoxide
if command -sq zoxide
    zoxide init fish | source
    alias cd='z'
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

## Useful aliases
# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons=always' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons=always'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons=always'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons=always' # tree listing
alias l.="eza -a | grep -e '^\.'"                                     # show only dotfiles

# Replace cat with bat
alias cat='bat'

# kitty doesn't clear properly so we need to do this weird printing
alias clear "printf '\033[2J\033[3J\033[1;1H'"
alias celar "printf '\033[2J\033[3J\033[1;1H'"
alias claer "printf '\033[2J\033[3J\033[1;1H'"

# Common use
alias cp='cp -iv'
alias mv='mv -iv'
alias df='df -h'
alias du='du -sh'
alias dus='du -sh * | sort -h'
alias rg='rg --smart-case'
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'          # List amount of -git packages

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# Arch Wiki
alias archwiki="python -m http.server 8000 --directory /usr/share/doc/arch-wiki/html"
