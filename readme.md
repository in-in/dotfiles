# Dotfiles

## Contents

- [Installation](#install-using-wget)
- [Project structure](#project-structure)
  - [roles/](#roles)
  - [service/](#service)
- [Helper tasks](#helper-tasks)
  - [helper_dir_create](#helper_dir_create)
  - [helper_dir_remove](#helper_dir_remove)
  - [helper_stat](#helper_stat)
  - [helper_tempfile](#helper_tempfile)
  - [helper_template](#helper_template)
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
  data: '{{ list }}'
```

_register variable_: `helper_stat_result`

### helper_tempfile

```yaml
include_tasks: '{{ helper_tempfile }}'
vars:
  tempfile_suffix: '.gnome_terminal'
```

_register variable_: `helper_tempfile_result.path`

### helper_template

```yaml
include_tasks: '{{ helper_template }}'
vars:
  privilege: '{{ item.privilege | default(false) }}' # optional
  src: '{{ item.src }}'
  dest: '{{ item.dest }}'
  data: '{{ data }}' # optional (data_inner)
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

## Useful commands

### Run Ansible by hand

```bash
ansible-playbook --ask-become-pass --ask-vault-pass --verbose playbook.yml
```

### Initialize a new role

```bash
ansible-galaxy init --offline new_role_name
```

### Encrypt the supplied string

```bash
ansible-vault encrypt_string 'foobar'
```

### Display facts from local host

```bash
ansible local -m setup
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>
