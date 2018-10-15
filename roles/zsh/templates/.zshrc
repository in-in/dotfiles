{% macro collector(filename) %}
  {% for item in lookup('filetree', dotfiles_roles)
    | selectattr('path', 'search', '/templates/' ~ filename)
    | sort(attribute='path') -%}
    {{ lookup('template', dotfiles_roles ~ '/' ~ item.path) }}
  {% endfor -%}
{% endmacro -%}

#!/usr/bin/zsh
# {{ ansible_managed }}

# SECTION: variable

{{ collector('variable.zsh') -}}

# SECTION: export

# improve output of less
export LESS="--tabs=2 --status-column --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --LINE-NUMBERS --HILITE-UNREAD"

{{ collector('export.zsh') -}}

# SECTION: source
# the source command must be at the end of the file
source "$HOME/.aliases.sh"

{{ collector('source.zsh') -}}
