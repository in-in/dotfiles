# run svgo with config and create backup origin files
svg ()
{
  for file in "$@"
  do
    cp --force  --backup=numbered "$file" "$file.bac" &&
    svgo --quiet --config={{ user_config }}/svgo/.svgo.yml "$file";
  done
}
