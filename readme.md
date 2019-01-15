# Dotfiles

![190011546364572](https://user-images.githubusercontent.com/8797432/50575056-1ff12200-0e06-11e9-8482-52bd4d64d0d2.png)

## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Project structure](#project-structure)
- [Helper tasks](#helper-tasks)
  - [alias](#alias)
  - [copy](#copy)
  - [dconf](#dconf)
  - [dir_create](#dir_create)
  - [git_repo](#git_repo)
  - [gitignore](#gitignore)
  - [key](#key)
  - [latest_release](#latest_release)
  - [launcher](#launcher)
  - [link](#link)
  - [mime](#mime)
  - [package_apt](#package_apt)
  - [package_pip](#package_pip)
  - [repo](#repo)
  - [shortcut](#shortcut)
  - [tempfile](#tempfile)
  - [template](#template)
- [Configure `zshrc`](#configure-zshrc)
- [User variables](#user-variables)
- [Useful commands](#useful-commands)

## Requirements

- Linux Mint 19 Cinnamon (fresh system)

## Installation

```bash
bash -c "$(wget -qO- https://raw.githubusercontent.com/in-in/dotfiles/master/install.sh)"
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

## Project structure

`roles/` - All tasks are related to the system

`helpers/` - Tasks that help to do all routine work

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

## Helper tasks

### [alias](./helpers/alias.yml)

```yaml
- import_tasks: '{{ helpers }}/alias.yml'
  tags: 'alias_role_name' # optional
```

And place _alias.sh_ file in the _templates_ directory inside the current role

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [copy](./helpers/copy.yml)

```yaml
- import_tasks: '{{ helpers }}/copy.yml'
  vars:
    copy_facts:
      - src: 'filename.sh' # filename (the file must be in the 'files' directory)
        dest: '{{ user_home }}/dest'
        filename: 'new_filename' # optional (default: item.src)
        privilege: True # optional (default: False)
        backup: True # optional (default: False)
  tags: 'copy_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [dconf](./helpers/dconf.yml)

```yaml
- import_tasks: '{{ helpers }}/dconf.yml'
  vars:
    dconf_facts:
      - key: '/path/to/dconf/key'
        value: 'false' # optional (default: '')
  tags: 'dconf_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [dir_create](./helpers/dir_create.yml)

```yaml
- import_tasks: '{{ helpers }}/dir_create.yml'
  vars:
    dir_create_facts:
      - '/path/to/dir1'
      - '/path/to/dir2'
  tags: 'dir_create_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [git_repo](./helpers/git_repo.yml)

```yaml
- import_tasks: '{{ helpers }}/git_repo.yml'
  vars:
    git_repo_facts:
      - repo: 'https://github.com/ansible/ansible.git'
        dest: '{{ user_home }}/dest'
  tags: 'git_repo_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [gitignore](./helpers/gitignore.yml)

```yaml
- import_tasks: '{{ helpers }}/gitignore.yml'
  tags: 'gitignore_role_name' # optional
```

And place _gitignore_ file in the _templates_ directory inside the current role

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [key](./helpers/key.yml)

```yaml
- import_tasks: '{{ helpers }}/key.yml'
  vars:
    key_facts:
      - '/path/to/key_file'
  tags: 'key_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [latest_release](./helpers/latest_release.yml)

```yaml
- import_tasks: '{{ helpers }}/latest_release.yml'
  vars:
    latest_release_facts:
      owner: 'owner_name'
      repo: 'repo_name'
      pattern: 'pattern'
  tags: 'latest_release_role_name' # optional
```

_Return value_

```yaml
helper_latest_release_result:
  id: role_name
  url: item
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [launcher](./helpers/launcher.yml)

```yaml
- import_tasks: '{{ helpers }}/launcher.yml'
  vars:
    launcher_facts:
      - exec: 'app_command'
        name: 'app_name'
        delay: 0 # optional (default: 30)
        icon: 'icon_name' # optional (default: exec)
        options: '--startup' # optional (default: None)
        startup: True # optional (default: not defined)
        terminal: 'true' # optional (default: 'false')
  tags: 'launcher_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [link](./helpers/link.yml)

```yaml
- import_tasks: '{{ helpers }}/link.yml'
  vars:
    link_facts:
      - src: '{{ role_path }}/files/filename'
        dest: '{{ user_home }}/filename'
  tags: 'link_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [mime](./helpers/mime.yml)

```yaml
- import_tasks: '{{ helpers }}/mime.yml'
  vars:
    mime_facts:
      entry_name: 'app_name'
      type:
        - 'mime_type1'
        - 'mime_type2'
  tags: 'mime_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [package_apt](./helpers/package_apt.yml)

```yaml
- import_tasks: '{{ helpers }}/package_apt.yml'
  vars:
    package_apt_facts:
      install_recommends: True # optional (default: False)
      install:
        - 'package_name'
      remove:
        - 'package_name'
  tags: 'package_apt_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [package_pip](./helpers/package_pip.yml)

```yaml
- import_tasks: '{{ helpers }}/package_pip.yml'
  vars:
    package_pip_facts:
      install:
        - 'package_name'
  tags: 'package_pip_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [repo](./helpers/repo.yml)

```yaml
- import_tasks: '{{ helpers }}/repo.yml'
  vars:
    repo_facts:
      - repo: 'path/to/archive'
        filename: 'name' # optional (default: omit)
  tags: 'repo_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [shortcut](./helpers/shortcut.yml)

```yaml
- import_tasks: '{{ helpers }}/shortcut.yml'
  vars:
    shortcut_facts:
      - name: "'name'"
        command: "'command'"
        binding: "['<Super>F1']"
  tags: 'shortcut_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [tempfile](./helpers/tempfile.yml)

```yaml
- import_tasks: '{{ helpers }}/tempfile.yml'
  tags: 'tempfile_role_name' # optional
```

Return value: `helper_tempfile_result`

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### [template](./helpers/template.yml)

```yaml
- import_tasks: '{{ helpers }}/template.yml'
  vars:
    template_facts:
      - src: 'template_name' # template must be in the 'templates' directory
        dest: '{{ user_home }}/dest'
        data: '{{ role_data }}' # optional (default: None)
        privilege: True # optional (default: False)
        backup: True # optional (default: False)
  tags: 'template_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

## Configure `zshrc`

The [`.zshrc`](./roles/zsh/templates/.zshrc) template consists of three sections: 'variable', 'export', 'source'. To add data to a section, you need to place the corresponding file in the _templates_ directory inside the current role. For example, `roles/role_name/templates/export.zsh`.

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

## User variables

[`./vars.yml`](./vars.yml)

| Variable              | Description                   |
| --------------------- | ----------------------------- |
| `user_default_editor` | default code editor           |
| `user_font_interface` | font for interface            |
| `user_font_monospace` | default monospace font        |
| `user_font_serif:`    | default serif font            |
| `user_font`           | default font family           |
| `user_storage_ext`    | path to external drive (uuid) |
| `user_storage`        | media storage path            |

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

### Run Ansible with a specific tag

```bash
ansible_tags template_role_name
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
