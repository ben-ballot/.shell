# Manage vim dotfiles

{%- from 'user/info.sls' import user_info with context %}

include:
  - user.env

create {{ user_info('home') }}.vim directory:
  file.recurse:
    - name: {{ user_info('home') }}/.vim
    - source: salt://editors/vim/files/vim
    - user: {{ user_info('uid') }}
    - group: {{ user_info('gid') }}

    #    - target: {{ user_info('home') }}/.shell/.vim

create {{ user_info('home') }}.vimrc:
  file.managed:
    - name: {{ user_info('home') }}/.vimrc
    - source: salt://editors/vim/files/vimrc
    - user: {{ user_info('uid') }}
    - group: {{ user_info('gid') }}
