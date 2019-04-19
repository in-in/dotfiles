# run svgo with config
svg () { svgo --quiet --config={{ user_config }}/svgo/.svgo.yml "$1"; }
