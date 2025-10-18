abbr e $EDITOR
if type -q lazygit
    abbr lg lazygit
end
abbr ge git status
abbr gs git switch
abbr gn git switch -c 
abbr gc git commit
abbr ga git add
abbr gp git pull
abbr gP git push

abbr ovpnc openvpn3 session-start  --config ovpn_jp 
abbr ovpnd openvpn3 session-manage --config ovpn_jp --disconnect
abbr ovpnl openvpn3 sessions-list
