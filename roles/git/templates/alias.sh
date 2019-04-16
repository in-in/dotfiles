# cleanup remote branches after merge
alias cleanup_branches="git branch --remotes --merged | grep -v master | sed 's@ origin/@:@' | xargs git push origin"
