# TODO: is it a true way update youtube-dl?
# youtube-dl: update
alias upd_youtube-dl="pip install --user --upgrade youtube-dl"

YOUTUBE_DL_FILENAME="%(uploader)s - %(title)s.%(ext)s"

# youtube-dl: default action for video
y() {
  youtube-dl -f "best[height <? 1080]" --output "$STORAGE/video/$YOUTUBE_DL_FILENAME" $1
  exit
}

# youtube-dl: download only audio file
ya() {
  youtube-dl -f "140/m4a/bestaudio" --output "~/Music/$YOUTUBE_DL_FILENAME" $1
  exit
}

# youtube-dl: get the full playlist
yp() {
  youtube-dl -f "best[height <? 1080]" --output "$STORAGE/video/%(playlist_title)s/%(uploader)s - %(playlist_index)s. %(title)s.%(ext)s" $1
  exit
}

# youtube-dl: soundcloud action
sc() {
  youtube-dl --output "~/Music/sc/$YOUTUBE_DL_FILENAME" $1
  exit
}
