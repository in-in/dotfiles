# aliases

# youtube-dl
alias yp='youtube-dl $1 --output "%(uploader)s - %(playlist_index)s %(title)s.%(ext)s" -f bestvideo+bestaudio'

y() {
  youtube-dl --output "/media/id/hdd/video/v/%(uploader)s - %(title)s.%(ext)s" -f bestvideo+bestaudio/best $1
  exit
}

sc() {
  youtube-dl --output "/home/id/Desktop/mmm/%(uploader)s - %(title)s.%(ext)s" -f best $1
  exit
}


#npm fix 
alias npmplease='rm -rf node_modules && npm cache clean && npm install'

# start working
alias start='atom . && npm start'

# taskwarrior
alias t='task'
alias tt='task +TODAY'
alias ty='task +YESTERDAY'
tet() {
  task $1 duplicate due:tomorrow description:$2
}
