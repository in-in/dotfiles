# testing the configuration
alias test_backup="rsnapshot -c ~/.config/rsnapshot/rsnapshot.conf configtest"

# run backup
alias backup="rsnapshot -V -c ~/.config/rsnapshot/rsnapshot.conf weekly"

# restore backup
alias restore="rsync -av $HOME/storage_ext/bcp/weekly.0/localhost/$STORAGE/ $STORAGE"
