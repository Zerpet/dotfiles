# Bash-like navigation
autoload -U select-word-style
select-word-style bash
set -o emacs

## Things to do if Homebrew is present
if [[ -n "${HOMEBREW_PREFIX}" ]]
then
  # https://stackoverflow.com/questions/25290751/where-to-place-zsh-autocompletion-script-on-linux
  export fpath=("${fpath[@]}" ${HOMEBREW_PREFIX}/share/zsh/site-functions)
  if [[ -f "${HOMEBREW_PREFIX}/bin/bat" ]]
  then
    alias cat='bat --plain --paging=never'
    alias less='bat'
  fi
fi

# Aliases {{
if [ -f "${HOME}/.aliases" ]
then
  source "${HOME}/.aliases"
fi
# }}

# Powerline setup in Linux
# Unused on Mac
if [ -f '/usr/share/powerline/zsh/powerline.zsh' ]; then
  . /usr/share/powerline/zsh/powerline.zsh
fi

# direnv {{
if command "direnv" &> /dev/null; then
  eval "$(direnv hook zsh)"
fi
# }}

# Startship {{
# https://starship.rs/
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi
# }}
