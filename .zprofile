# Profile file. Runs on login. Environmental variables are set here.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# HiDPI computers
HiDPIComputers=("Blade-Stealth")

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"
export STATUSBAR="polybar"

# ~/ Clean-up:
# export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export ZDOTDIR="$HOME/.config/zsh"

# Other program settings:
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

# High DPI Configurations
for com in "${HiDPIComputers[@]}";
do
  if [ "$com" = "$(hostname)" ];
  then
    export GDK_SCALE=2
    export GDK_DPI_SCALE=0.5
  fi
done

# [ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

