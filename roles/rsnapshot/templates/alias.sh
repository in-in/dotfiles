# testing the configuration
alias test_backup="rsnapshot -c {{ user_config }}/rsnapshot/rsnapshot.conf configtest"

# run backup
alias backup="rsnapshot -V -c {{ user_config }}/rsnapshot/rsnapshot.conf weekly"

# restore backup
alias restore="rsync -av $STORAGE_EXT/bcp/weekly.0/localhost/$STORAGE/ $STORAGE"
