# Manage vim dotfiles

{%- from 'ballot-formula/user/info.sls' import user_info with context %}

include:
  - ballot-formula.user.env

create {{ user_info('home') }}.vim directory:
  file.recurse:
    - name: {{ user_info('home') }}/.vim
    - source: salt://ballot-formula/editors/vim/files/vim
    - user: {{ user_info('uid') }}
    - group: {{ user_info('gid') }}

create {{ user_info('home') }}.vimrc:
  file.managed:
    - name: {{ user_info('home') }}/.vimrc
    - source: salt://ballot-formula/editors/vim/files/vimrc
    - user: {{ user_info('uid') }}
    - group: {{ user_info('gid') }}
