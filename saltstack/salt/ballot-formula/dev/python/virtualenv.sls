{%- from 'user/info.sls' import user_info with context %}

{%- if grains['os'] == 'Ubuntu' %}
Create virtualenvwrapper directory:
  file.directory:
    - name: {{ user_info("home") }}/.virtualenvs
    - user: {{ user_info("uid") }}
    - group: {{ user_info("gid") }}
    - dir_mode: 0755
{% endif -%}
