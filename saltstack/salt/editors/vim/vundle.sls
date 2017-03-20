
# Manage vim dotfiles

{%- from 'user/info.sls' import user_info with context %}

include:
  - editors.vim.dotfiles
  - dev.git
  - dev.git.github_com
  - dev.python

clone vundle:
  git.latest:
    - name: https://github.com/gmarik/Vundle.vim.git
    - target: {{ user_info('home') }}/.vim/bundle/Vundle.vim
    - user: {{ user_info('name') }}
    - rev: master
    - require:
      - sls: editors.vim.dotfiles

owner of vundle:
  file.directory:
    - name: {{ user_info('home') }}/.vim/bundle/Vundle.vim
    - user: {{ user_info('uid') }}
    - group: {{ user_info('gid') }}
    - recurse:
      - user
      - group
    - onchanges:
      - git: clone vundle

run plugin install:
  cmd.run:
    - name: vim -E +"PluginInstall" +':let g:session_autosave="no"' +qall
    - runas: {{ user_info('name') }}
    - timeout: 600
    - output_loglevel: quiet
    - onchanges:
      - git: clone vundle

install instant-rst:
  cmd.run:
    - name: pip install https://github.com/Rykka/instant-rst.py/archive/master.zip
    - runas: {{ user_info('name') }}
    - unless: python -c "import instant_rst"
    - require:
      - sls: dev.python
