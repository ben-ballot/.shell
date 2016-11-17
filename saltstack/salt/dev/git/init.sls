# Git specific settings
#
{%- if grains['os'] == 'Ubuntu' %}
set git ppa:
  pkgrepo.managed:
    - ppa: git-core/ppa
    - require_in:
      - pkg: install git
{%- endif %}

install git:
  pkg.installed:
    - name: git
