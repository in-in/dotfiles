# default directory
YOUTUBE_DL_DIRECTORY="{{ user_storage }}/video"

# default filename pattern
YOUTUBE_DL_FILENAME="%(uploader)s - %(title)s.%(ext)s"

# default file format
YOUTUBE_DL_FILEFORMAT="bestvideo[height >= 720][height <= 1080]+bestaudio/best"

# update
alias yu="pip install --user --upgrade youtube-dl"

# helper function for truncate
youtube_get_filename() {
  local URL=$1
  local OUTPUT=$2
  local FILENAME

  FILENAME=$(youtube-dl \
  --get-filename \
  --output "$OUTPUT" \
  "$URL")

  echo "$FILENAME"
}

# helper function for truncate
youtube_get_length() {
  local STRING=$1
  echo -n "${STRING}" | wc --bytes
}

# truncate a too long file name
youtube_truncate() {
  local URL=$1
  local MAX_LENGTH=250
  local ORIGINAL_NAME
  local ORIGINAL_NAME_LENGTH

  ORIGINAL_NAME=$(youtube_get_filename "$URL" "$YOUTUBE_DL_DIRECTORY/$YOUTUBE_DL_FILENAME")
  ORIGINAL_NAME_LENGTH=$(youtube_get_length "${ORIGINAL_NAME}")

  if [ "$ORIGINAL_NAME_LENGTH" -ge "$MAX_LENGTH" ]; then
    local PART_LEFT
    local PART_LEFT_LENGTH
    local PART_RIGHT
    local PART_RIGHT_LENGTH
    local TITLE
    local LENGTH_THRESHOLD
    local NEW_TITLE
    local NEW_NAME

    PART_LEFT=$(youtube_get_filename "$URL" "$YOUTUBE_DL_DIRECTORY/%(uploader)s - ")
    PART_LEFT_LENGTH=$(youtube_get_length "${PART_LEFT}")
    PART_RIGHT=$(youtube_get_filename "$URL" ".%(ext)s")
    PART_RIGHT_LENGTH=$(youtube_get_length "${PART_RIGHT}")
    TITLE=$(youtube_get_filename "$URL" "%(title)s")
    LENGTH_THRESHOLD=$(( MAX_LENGTH - (PART_LEFT_LENGTH + PART_RIGHT_LENGTH) ))
    NEW_TITLE=$(echo -n "${TITLE}" | cut --bytes 1-"${LENGTH_THRESHOLD}" | iconv -c)
    NEW_NAME="${PART_LEFT}${NEW_TITLE}${PART_RIGHT}"

    echo "$NEW_NAME"
  else
    echo "$ORIGINAL_NAME"
  fi
}

# default action for video
y() {
  youtube-dl \
  --no-playlist \
  -f "$YOUTUBE_DL_FILEFORMAT" \
  --output "$(youtube_truncate "$1")" \
  "$1"
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
