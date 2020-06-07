# default directory
YOUTUBE_DL_DIRECTORY="{{ user_storage }}/video"

# default filename pattern
YOUTUBE_DL_FILENAME="%(uploader).30s - %(title).200s.%(ext)s"

# default file format
YOUTUBE_DL_FILEFORMAT="bestvideo[height >= 720][height <= 1080]+bestaudio/best"

# low quality format
YOUTUBE_DL_FILEFORMAT_LQ="[height >= 720][height <= 1080][fps <= 30]+bestaudio"

# update
alias yu="pip install --user --upgrade youtube-dl"

# default action for video
y() {
  youtube-dl \
  --no-playlist \
  -f "$YOUTUBE_DL_FILEFORMAT" \
  --output "$YOUTUBE_DL_DIRECTORY/$YOUTUBE_DL_FILENAME" \
  "$@"
  exit
}

# download low quality video
yl() {
  youtube-dl \
  --no-playlist \
  -f "$YOUTUBE_DL_FILEFORMAT_LQ" \
  --output "$YOUTUBE_DL_DIRECTORY/$YOUTUBE_DL_FILENAME" \
  "$@"
  exit
}

# download only audio file
ya() {
  youtube-dl \
  -f "140/m4a/bestaudio" \
  --output "$STORAGE/podcast/$YOUTUBE_DL_FILENAME" "$@"
  exit
}

# get the full playlist
yp() {
  youtube-dl \
  -f "$YOUTUBE_DL_FILEFORMAT" \
  --output "$YOUTUBE_DL_DIRECTORY/%(playlist_title)s/%(playlist_index)s. %(title)s.%(ext)s" "$1"
  exit
}

# soundcloud action
ysc() {
  youtube-dl --output "$HOME/Music/sc/$YOUTUBE_DL_FILENAME" "$@"
  exit
}
