# TODO: is it a true way update youtube-dl?
# youtube-dl: update
alias upd_youtube-dl="pip install --user --upgrade youtube-dl"

YOUTUBE_DL_FILENAME="%(uploader)s - %(title)s.%(ext)s"

# youtube-dl: default action for video
y() {
  youtube-dl -f "best[height <? 1080]" --output "~/Videos/$YOUTUBE_DL_FILENAME" $1
  exit
}

# youtube-dl: download only audio file
ya() {
  youtube-dl -f "140/m4a/bestaudio" --output "~/Videos/$YOUTUBE_DL_FILENAME" $1
  exit
}

# youtube-dl: action for playlist
yp() {
  youtube-dl -f "best[height <? 1080]" --output "~/Videos/%(playlist_title)s/%(uploader)s - %(playlist_index)s. %(title)s.%(ext)s" $1
  exit
}

# youtube-dl: soundcloud action
sc() {
  youtube-dl --output "~/Music/$YOUTUBE_DL_FILENAME" $1
  exit
}
