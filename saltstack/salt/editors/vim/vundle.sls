
# Manage vim dotfiles

{%- from 'user/info.sls' import user_info with context %}

include:
  - editors.vim.dotfiles
  - dev.git

clone vundle:
  git.latest:
    - name: https://github.com/VundleVim/Vundle.vim.git
    - target: {{ user_info('home') }}/.vim/bundle/Vundle.vim
    - user: {{ user_info('name') }}
    - require:
      - sls: editors.vim.dotfiles

run plugin install:
  cmd.run:
    - name: vim -E +"PluginInstall" +':let g:session_autosave="no"' +qall
    - runas: {{ user_info('name') }}
    - timeout: 120
    - output_loglevel: quiet
    - onchanges:
      - git: clone vundle
