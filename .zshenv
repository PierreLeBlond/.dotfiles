export PATH="$HOME/.local/bin:$PATH"

# pnpm
export PNPM_HOME="/home/pierre/.local/share/pnpm"
case ":$PATH:" in
	*":$PNPM_HOME:"*) ;;
	*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
