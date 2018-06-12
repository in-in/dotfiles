## Contents

- [Installation](#install-using-wget)
- [Project structure](#project-structure)
  - [roles/](#roles)
  - [service/](#service)
- [Utility variables](#utility-variables)
  - [utility_copy](#utility_copy)
  - [utility_git_repository](#utility_git_repository)
  - [utility_gitignore](#utility_gitignore)
  - [utility_key](#utility_key)
  - [utility_link](#utility_link)
  - [utility_package](#utility_package)
  - [utility_repository](#utility_repository)
  - [utility_startup](#utility_startup)
- [Utility aliases](#utility-aliases)
- [Helper tasks](#helper-tasks)
  - [helper_dir_create](#helper_dir_create)
  - [helper_dir_remove](#helper_dir_remove)
  - [helper_stat](#helper_stat)
  - [helper_tempfile](#helper_tempfile)
- [Useful commands](#useful-commands)

## Install using `wget`

```bash
bash -c "$(wget -qO- https://raw.githubusercontent.com/in-in/dotfiles/master/install.sh)"
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

## Project structure

### `roles/`

All tasks are related to the system

### `service/`

Tasks that help to do all routine work (e.g., `link`, `copy`, etc)

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

## Utility variables

- [utility_copy](#utility_copy)
- [utility_git_repository](#utility_git_repository)
- [utility_gitignore](#utility_gitignore)
- [utility_key](#utility_key)
- [utility_link](#utility_link)
- [utility_package](#utility_package)
- [utility_repository](#utility_repository)
- [utility_startup](#utility_startup)

### utility_copy

```yaml
utility_copy:
  privilege: true
  dir: '{{ user_home }}/.mozilla'
  paths:
    - src: '{{ dotfiles_roles }}/firefox/files/.mozilla'
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
    - 'roles/code/files/Code/*'
  excluded:
    - 'roles/code/files/Code/User/*'
```

### utility_key

```yaml
utility_key: 'https://download.sublimetext.com/sublimehq-pub.gpg'
```

### utility_link

```yaml
utility_link:
  src: '{{ dotfiles_roles }}/emacs/files/emacs.d'
  dest: '{{ user_home }}/.emacs.d'
```

### utility_package

```yaml
utility_package:
  apt:
    install:
      - 'firefox'
    remove:
      - 'firefox-locale-en'
  pip:
    install:
      - name: 'pylint'
      - name: 'yapf'
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

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

## Utility aliases

Put the `alias.sh` file in the `files` directory

```bash
roles/nvm/files/alias.sh
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

## Helper tasks

### helper_dir_create

```yaml
include_tasks: '{{ helper_dir_create }}'
vars:
  path: '{{ item }}'
```

### helper_dir_remove

```yaml
include_tasks: '{{ helper_dir_remove }}'
vars:
  path: '{{ item }}'
```

### helper_stat

```yaml
include_tasks: '{{ helper_stat }}'
vars:
  path: '{{ item | default(None) }}'
  object: '{{ list }}'
```

_register variable_: `helper_stat_result`

### helper_tempfile

```yaml
include_tasks: '{{ helper_tempfile }}'
vars:
  tempfile_suffix: '.gnome_terminal'
```

_register variable_: `helper_tempfile_result`

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

## Useful commands

#### Run Ansible by hand

```bash
ansible-playbook --ask-become-pass --ask-vault-pass --verbose playbook.yml
```

#### Initialize a new role

```bash
ansible-galaxy init --offline new_role_name
```

#### Encrypt the supplied string

```bash
ansible-vault encrypt_string 'foobar'
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>
