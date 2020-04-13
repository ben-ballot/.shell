# Run /.vim/bundle/YouCompleteMe; ./install.py --clang-completer
{%- from "ballot-formula/user/info.sls" import user_info with context %}
{%- from "ballot-formula/dev/map.jinja" import golang with context %}

include:
  - ballot-formula.user.env
  - ballot-formula.dev.golang
  - ballot-formula.editors.vim.{{ grains['os'] }}

{%- if grains['os_family'] == "Debian" %}
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
      - GOROOT: {{ user_info('home') }}{{ golang.user_goroot }}
      - GOPATH: {{ user_info('home') }}{{ golang.user_gopath }}
    - require:
      - cmd: run plugin install
    - onchanges:
      - git: clone vundle
