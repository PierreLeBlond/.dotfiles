export PATH="$HOME/.local/bin:$PATH"

export MOZ_ENABLE_WAYLAND=1
export WLR_NO_HARDWARE_CURSORS=1

# pnpm
export PNPM_HOME="/home/pierre/.local/share/pnpm"
case ":$PATH:" in
	*":$PNPM_HOME:"*) ;;
	*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
