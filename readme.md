## Install using `wget`

```bash
wget -qO- https://bitbucket.org/dmin/dots/raw/master/install.sh | bash
```

## Utility variables

* [utility_copy](#utility_copy)
* [utility_git_repository](#utility_git_repository)
* [utility_gitignore](#utility_gitignore)
* [utility_key](#utility_key)
* [utility_link](#utility_link)
* [utility_package](#utility_package)
* [utility_repository](#utility_repository)
* [utility_startup](#utility_startup)

### utility_copy

```yaml
utility_copy:
  privilege: true
  dir: '{{ user_home }}/emmet'
  paths:
    - src: '{{ dotfiles_roles }}/atom/files/emmet'
      dest: '{{ user_home }}'
```

### utility_git_repository

```yaml
utility_git_repository:
  - repo: 'git://github.com/creationix/nvm.git'
    dest: '{{ user_home }}/.nvm'
```

### utility_gitignore

```yaml
utility_gitignore:
  ignore:
    - 'roles/copyq/files/copyq/*'
  excluded:
    - '!roles/copyq/files/copyq/copyq.conf'
```

### utility_key

```yaml
utility_key: 'https://download.sublimetext.com/sublimehq-pub.gpg'
```

### utility_link

```yaml
utility_link:
  src: '{{ dotfiles_roles }}/atom/files/atom'
  dest: '{{ user_home }}/.atom'
```

### utility_package

```yaml
utility_package:
  install: 'firefox'
  remove: 'firefox-locale-en'
```

### utility_repository

```yaml
utility_repository:
  - repo: 'deb https://mega.nz/linux/MEGAsync/xUbuntu_18.04/ ./'
    filename: 'megasync'
```

### utility_startup

```yaml
utility_startup:
  - name: 'synapse'
    delay: 0
    options: '--startup'
```
