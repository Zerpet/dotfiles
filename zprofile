# Bash-like navigation
autoload -U select-word-style
select-word-style bash
set -o emacs

# Homebrew {{
if [ -d "/opt/homebrew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -d "~/.linuxbrew" ]; then
  eval "$(~/.linuxbrew/bin/brew shellenv)"
elif [ -d "/home/linuxbrew" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

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

# }}

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

# Golang {{
if [[ -d "${HOME}/go/bin" ]]; then
  export PATH="${HOME}/go/bin:${PATH}"
fi

# }}

# Rancher Desktop {{
[ -d "${HOME}/.rd/bin" ] && export PATH="$HOME/.rd/bin:${PATH}"
# }}

# Rust {{
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
# }}

# macOS SDK {{
## CommandLineTools' default MacOSX.sdk symlink can point at a beta/future
## SDK ahead of the installed OS, whose .tbd files break ld. Pin SDKROOT to
## an SDK matching the running OS if it exists.
_sdkroot="/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk"
[ -d "$_sdkroot" ] && export SDKROOT="$_sdkroot"
unset _sdkroot
# }}

# JavaScript {{
## Volta
## https://volta.sh/
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
# }}

# asdf {{
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# }}

# Claude Code {{
export PATH="$HOME/.local/bin:$PATH"
# }}

# Local file with private information {{
if [ -f "${HOME}/.zprofile.local" ]; then
  source "${HOME}/.zprofile.local"
fi
# }}

# direnv {{
## Must be last
eval "$(direnv hook zsh)"
# }}
