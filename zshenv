export GPG_TTY=$(tty)
export DOTNET_CLI_TELEMETRY_OPTOUT='1'

# Homebrew {{
if [ -d "/opt/homebrew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -d "~/.linuxbrew" ]; then
  eval "$(~/.linuxbrew/bin/brew shellenv)"
elif [ -d "/home/linuxbrew" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
# }}

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
