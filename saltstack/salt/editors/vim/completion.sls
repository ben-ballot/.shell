# Run /.vim/bundle/YouCompleteMe; ./install.py --clang-completer
{%- from 'user/info.sls' import user_info with context %}

include:
  - user.env
  - editors.vim.vundle

{%- if grains['os_family'] == 'Debian' %}
YouCompleteMe packages:
  pkg.installed:
    - pkgs:
      - cmake
      - build-essential
    - require_in:
      - cmd: compile YCM
{%- endif %}

compile YCM:
  cmd.run:
    - name: ./install.py
    - runas: {{ user_info('name') }}
    - cwd: {{ user_info('home') }}/.vim/bundle/YouCompleteMe
    - require:
      - cmd: run plugin install
  #- onchanges:
    #    - git: clone vundle
