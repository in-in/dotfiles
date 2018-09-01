# youtube-dl: default directory
YOUTUBE_DL_DIRECTORY="$STORAGE/video"

# youtube-dl: default filename pattern
YOUTUBE_DL_FILENAME="%(uploader)s - %(title)s.%(ext)s"

# TODO: is it a true way update youtube-dl?
# youtube-dl: update
alias upd_youtube-dl="pip install --user --upgrade youtube-dl"

# youtube-dl: default action for video
y() {
  youtube-dl -f "best[height <? 1080]" --output "$YOUTUBE_DL_DIRECTORY/$YOUTUBE_DL_FILENAME" "$1"
  exit
}

# youtube-dl: download only audio file
ya() {
  youtube-dl -f "140/m4a/bestaudio" --output "$HOME/Music/$YOUTUBE_DL_FILENAME" "$1"
  exit
}

# youtube-dl: get the full playlist
yp() {
  youtube-dl -f "best[height <? 1080]" --output "$YOUTUBE_DL_DIRECTORY/%(playlist_title)s/%(uploader)s - %(playlist_index)s. %(title)s.%(ext)s" "$1"
  exit
}

# youtube-dl: soundcloud action
sc() {
  youtube-dl --output "$HOME/Music/sc/$YOUTUBE_DL_FILENAME" "$1"
  exit
}
