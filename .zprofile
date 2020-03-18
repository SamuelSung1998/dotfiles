# Profile file. Runs on login. Environmental variables are set here.

# Adds `~/.local/bin`, flatpak to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$(du "$HOME/.local/appimage" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$(du "/var/lib/flatpak/exports/bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# HiDPI computers
HiDPIComputers=("Blade-Stealth")

# Default programs:
export EDITOR="nvim"
export EDITOR_UP="Nvim"
export TERMINAL="st"
export TERMINAL_UP="St"
export BROWSER="firefox"
export BROWSER_UP="Firefox"
export READER="zathura"
export READER_UP="Zathura"
export FILE="ranger"
export FILE_UP="Ranger"
export STATUSBAR="polybar"

# Programe config
# export STARSHIP_CONFIG="$HOME/.config/zsh/starship.toml"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
# ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

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

