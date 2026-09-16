#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXCLUDE=(setup.sh config.ghostty .gitignore README.md)

is_excluded() {
	local name="$1"
	for excluded in "${EXCLUDE[@]}"; do
		[[ "$name" == "$excluded" ]] && return 0
	done
	return 1
}

for file in "$DOTFILES_DIR"/*; do
	name="$(basename "$file")"
	[[ -f "$file" ]] || continue
	is_excluded "$name" && continue

	target="${HOME}/.${name}"
	if [[ -e "$target" ]]; then
		echo "Skipping ${target}: already exists"
		continue
	fi

	ln "$file" "$target"
	echo "Linked ${file} -> ${target}"
done
