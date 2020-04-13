# Git specific settings
#
#
{%- from 'ballot-formula/user/info.sls' import user_info with context %}

# {%- if grains['os'] == 'Ubuntu' %}
# set git ppa:
#   pkgrepo.managed:
#     - ppa: git-core/ppa
#     - require_in:
#       - pkg: install git
# {%- endif %}

install git:
  pkg.installed:
    - name: git

set core.editor:
  git.config_set:
    - name: core.editor
    - value: /usr/bin/vim
    - global: True
    - user: {{ user_info('name') }}
