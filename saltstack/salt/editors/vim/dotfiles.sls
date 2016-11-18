# Manage vim dotfiles

{%- from 'user/info.sls' import user_info with context %}

include:
  - user.env

link to .vim directory:
  file.symlink:
    - name: {{ user_info('home') }}/.vim
    - target: {{ user_info('home') }}/.shell/.vim

link to .vimrc:
  file.symlink:
    - name: {{ user_info('home') }}/.vimrc
    - target: {{ user_info('home') }}/.shell/.vimrc
