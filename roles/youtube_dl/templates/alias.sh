# default directory
YOUTUBE_DL_DIRECTORY="$STORAGE/video"

# default filename pattern
YOUTUBE_DL_FILENAME="%(uploader)s - %(title)s.%(ext)s"

# update
alias upd_youtube-dl="pip install --user --upgrade youtube-dl"

# default action for video
y() {
  youtube-dl -f "best[height <? 1080]" --output "$YOUTUBE_DL_DIRECTORY/$YOUTUBE_DL_FILENAME" "$1"
  exit
}

# download only audio file
ya() {
  youtube-dl -f "140/m4a/bestaudio" --output "$HOME/Music/$YOUTUBE_DL_FILENAME" "$1"
  exit
}

# get the full playlist
yp() {
  youtube-dl -f "best[height <? 1080]" --output "$YOUTUBE_DL_DIRECTORY/%(playlist_title)s/%(uploader)s - %(playlist_index)s. %(title)s.%(ext)s" "$1"
  exit
}

# soundcloud action
sc() {
  youtube-dl --output "$HOME/Music/sc/$YOUTUBE_DL_FILENAME" "$1"
  exit
}
