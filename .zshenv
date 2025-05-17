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

# .net tools
export PATH="/home/pierre/.dotnet/tools:$PATH"
# .net tools end

# go install
export PATH="$(go env GOBIN):$(go env GOPATH)/bin:$PATH"
# go install end

# apps
export PATH="/home/pierre/app:$PATH"
