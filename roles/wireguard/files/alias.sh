# wireguard: up the tunnel
alias wgu='sudo systemctl start wg-quick@wg0'

# wireguard: down the tunnel
alias wgd='sudo systemctl stop wg-quick@wg0'

# wireguard: check status
alias wgst='sudo systemctl status wg-quick@wg0'
