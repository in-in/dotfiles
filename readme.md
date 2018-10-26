# Dotfiles

## Contents

- [Installation](#install-using-wget)
- [Project structure](#project-structure)
- [Helper tasks](#helper-tasks)
  - [alias](#helper_alias)
  - [copy](#helper_copy)
  - [dconf](#helper_dconf)
  - [dir_create](#helper_dir_create)
  - [git_repo](#helper_git_repo)
  - [gitignore](#helper_gitignore)
  - [key](#helper_key)
  - [link](#helper_link)
  - [mime](#helper_mime)
  - [package_apt](#helper_package_apt)
  - [package_pip](#helper_package_pip)
  - [repo](#helper_repo)
  - [shortcut](#helper_shortcut)
  - [startup](#helper_startup)
  - [tempfile](#helper_tempfile)
  - [template](#helper_template)
- [Configure `zshrc`](#configure-zshrc)
- [User variables](#user-variables)
- [Useful commands](#useful-commands)

## Install using `wget`

```bash
bash -c "$(wget -qO- https://raw.githubusercontent.com/in-in/dotfiles/master/install.sh)"
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

## Project structure

`roles/` - All tasks are related to the system

`helpers/` - Tasks that help to do all routine work

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

## Helper tasks

### helper_alias

```yaml
- import_tasks: '{{ helpers }}/alias.yml'
  tags: 'alias_role_name' # optional
```

And place _alias.sh_ file in the _templates_ directory inside the current role

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### helper_copy

```yaml
- import_tasks: '{{ helpers }}/copy.yml'
  vars:
    copy_facts:
      - src: 'filename.sh'
        # filename (the file must be in the 'files' directory)
        dest: '{{ user_home }}/dest'
        # destination directory
        privilege: true
        # optional (default: false)
        backup: true
        # optional (default: false)
  tags: 'copy_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### helper_dconf

```yaml
- import_tasks: '{{ helpers }}/dconf.yml'
  vars:
    dconf_facts:
      - key: '/path/to/dconf/key'
        value: 'false'
        # optional (default: "")
        state: 'absent'
        # optional (default: "present")
  tags: 'dconf_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### helper_dir_create

```yaml
- import_tasks: '{{ helpers }}/dir_create.yml'
  vars:
    dir_create_facts:
      - '/path/to/dir1'
      - '/path/to/dir2'
  tags: 'dir_create_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### helper_git_repo

```yaml
- import_tasks: '{{ helpers }}/git_repo.yml'
  vars:
    git_repo_facts:
      - repo: 'https://github.com/ansible/ansible.git'
        dest: '{{ user_home }}/dest'
  tags: 'git_repo_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### helper_gitignore

```yaml
- import_tasks: '{{ helpers }}/gitignore.yml'
  vars:
    gitignore_facts: "{{ lookup('template', 'gitignore') }}"
  tags: 'gitignore_role_name' # optional
```

And place _gitignore_ file in the _templates_ directory inside the current role

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### helper_key

```yaml
- import_tasks: '{{ helpers }}/key.yml'
  vars:
    key_facts:
      - '/path/to/key_file'
  tags: 'key_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### helper_link

```yaml
- import_tasks: '{{ helpers }}/link.yml'
  vars:
    link_facts:
      - src: '{{ dotfiles_roles }}/bin/files/bin'
        # files must be in the 'files' directory
        dest: '{{ user_home }}/dest'
  tags: 'link_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### helper_mime

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

### helper_package_apt

```yaml
- import_tasks: '{{ helpers }}/package_apt.yml'
  vars:
    package_apt_facts:
      install_recommends: no # optional (default: "yes")
      install:
        - 'package_name'
      remove: # optional
        - 'package_name'
  tags: 'package_apt_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### helper_package_pip

```yaml
- import_tasks: '{{ helpers }}/package_pip.yml'
  vars:
    package_pip_facts:
      install:
        - 'package_name'
  tags: 'package_pip_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### helper_repo

```yaml
- import_tasks: '{{ helpers }}/repo.yml'
  vars:
    repo_facts:
      - repo: 'path/to/archive'
        filename: 'name' # optional (default: omit)
  tags: 'repo_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### helper_shortcut

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

### helper_startup

```yaml
- import_tasks: '{{ helpers }}/startup.yml'
  vars:
    startup_facts:
      name: 'app_name'
      delay: 0 # optional (default: 30)
      options: '--startup' # optional (default: None)
  tags: 'startup_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### helper_tempfile

```yaml
- import_tasks: '{{ helpers }}/tempfile.yml'
  vars:
    tempfile_suffix: '.role_name'
  tags: 'tempfile_role_name' # optional
```

Return value: `helper_tempfile_result`

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

### helper_template

```yaml
- import_tasks: '{{ helpers }}/template.yml'
  vars:
    template_facts:
      - src: 'template_name'
        # template must be in the 'templates' directory
        dest: '{{ user_home }}/dest'
        data: '{{ role_data }}'
        # optional (default: None)
        privilege: true
        # optional (default: false)
        backup: true
        # optional (default: false)
  tags: 'template_role_name' # optional
```

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

## Configure `zshrc`

The `.zshrc` consists of three sections: 'variable', 'export', 'source'. To add data to a section, you need to place the corresponding file in the _templates_ directory inside the current role. For example, `roles/role_name/templates/export.zsh`.

<p align="right">[<a href="#contents" title="Back&nbsp;To&nbsp;Top">back to top</a>]</p>

## User variables

| Variable              | Description                   |
| --------------------- | ----------------------------- |
| `user_font_monospace` | default monospace font        |
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
