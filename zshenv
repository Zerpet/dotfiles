export GPG_TTY=$(tty)
export DOTNET_CLI_TELEMETRY_OPTOUT='1'

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

# Claude Code {{
export PATH="$HOME/.local/bin:$PATH"
# }}

# Zsh Completion
export DOTFILES="${HOME}/workspace/dotfiles"
