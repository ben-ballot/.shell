# User settings
#
#

# Macro for all state needing user parameters

{%- set user = salt['pillar.get']('user','ballot') -%}
{%- set get_user_info = salt['user.info'](user) -%}
{% macro user_info(attr) -%}
  {{ get_user_info.get(attr) }}
{%- endmacro %}
