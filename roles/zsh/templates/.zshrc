{% macro collector(filename) -%}
  #{{ ('SECTION: ' ~ filename | splitext | first)
      | center | replace(' ', '_') }}
  {% for item in lookup('filetree', dotfiles_roles)
    | selectattr('path', 'search', '/templates/' ~ filename)
    | sort(attribute='path') -%}
    {{ lookup('template', dotfiles_roles ~ '/' ~ item.path) }}
  {% endfor -%}
{% endmacro -%}

#!/usr/bin/zsh
# {{ ansible_managed }}

{{ collector('variable.zsh') -}}

{{ collector('export.zsh') -}}

{{ collector('source.zsh') -}}
