# Run /.vim/bundle/YouCompleteMe; ./install.py --clang-completer
{%- from 'user/info.sls' import user_info with context %}
{%- from "dev/map.jinja" import golang with context %}

include:
  - user.env
  - editors.vim.vundle
  - dev.golang

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
    - name: ./install.py --clang-completer --go-completer
    - runas: {{ user_info('name') }}
    - cwd: {{ user_info('home') }}/.vim/bundle/YouCompleteMe
    - env:
      - GOROOT: {{ golang.goroot }}
      - GOPATH: {{ golang.gopath }}
    - require:
      - cmd: run plugin install
    - onchanges:
      - git: clone vundle
