# rsnapshot: testing the configuration
alias test_backup="rsnapshot -c ~/.config/rsnapshot/rsnapshot.conf configtest"

# rsnapshot: run backup
alias backup="rsnapshot -V -c ~/.config/rsnapshot/rsnapshot.conf weekly"
