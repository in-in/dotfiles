# run backup
alias backup_run="rsnapshot -V -c {{ user_config }}/rsnapshot/rsnapshot.conf weekly"

# restore backup
alias backup_restore="rsync -av {{ user_storage_ext }}/bcp/weekly.0/localhost{{ user_storage }}/ {{ user_storage }}"
