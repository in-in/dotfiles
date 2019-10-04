# run svgo with config
svg ()
{
  cp --force  --backup=numbered "$1" "$1.bac" &&
  svgo --quiet --config={{ user_config }}/svgo/.svgo.yml "$1";
}
