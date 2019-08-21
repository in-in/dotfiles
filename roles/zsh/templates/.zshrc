{% macro collector(filename) -%}
  #{{ ('SECTION: ' ~ filename | splitext | first)
      | center | replace(' ', '_') }}
  {% for item in ansible_role_names | sort -%}
    {% set path = playbook_dir ~ '/roles/' ~ item ~ '/templates/' ~ filename -%}
    {% if path is exists-%}
      {{ lookup('template', path) }}
    {% endif -%}
  {% endfor -%}
{% endmacro -%}

#!/usr/bin/zsh
# {{ ansible_managed }}

{{ collector('variable.zsh') -}}

{{ collector('export.zsh') -}}

{{ collector('source.zsh') -}}
