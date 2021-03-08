# default directory
YOUTUBE_DL_DIRECTORY="{{ user_storage }}/video"

# default filename pattern
YOUTUBE_DL_FILENAME="%(uploader).30s - %(title).200s.%(ext)s"

# default file format
YOUTUBE_DL_FILEFORMAT="bestvideo[height >= 720][height <= 1080]+bestaudio/best"

# low quality format
YOUTUBE_DL_FILEFORMAT_LQ="bestvideo[height <= 720][fps <= 30]+bestaudio/best[height <= 720][fps <= 30]"

# update
alias yu="pip install --user --upgrade youtube-dl"

# default action for video
y() {
  if youtube-dl \
  --no-playlist \
  -f "$YOUTUBE_DL_FILEFORMAT" \
  --output "$YOUTUBE_DL_DIRECTORY/$YOUTUBE_DL_FILENAME" "$@";
  then
    exit
  fi
}

# download low quality video
yl() {
  if youtube-dl \
  --no-playlist \
  -f "$YOUTUBE_DL_FILEFORMAT_LQ" \
  --output "$YOUTUBE_DL_DIRECTORY/$YOUTUBE_DL_FILENAME" "$@";
  then
    exit
  fi
}

# download only audio file
ya() {
  if youtube-dl \
  -f "140/m4a/bestaudio" \
  --output "$STORAGE/podcast/$YOUTUBE_DL_FILENAME" "$@";
  then
    exit
  fi
}

# get the full playlist
yp() {
  if youtube-dl \
  -f "$YOUTUBE_DL_FILEFORMAT" \
  --output "$YOUTUBE_DL_DIRECTORY/%(playlist_title)s/%(playlist_index)s. %(title)s.%(ext)s" "$1";
  then
    exit
  fi
}

# soundcloud action
ysc() {
  if youtube-dl --output "$HOME/Music/sc/$YOUTUBE_DL_FILENAME" "$@";
  then
    exit
  fi
}
