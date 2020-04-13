# tmux specific settings
#
#
{%- from 'ballot-formula/user/info.sls' import user_info with context %}

include:
  - ballot-formula.dev.git

clone tmux/tpm:
  git.latest:
    - name: https://github.com/tmux-plugins/tpm
    - target: {{ user_info('home') }}/.tmux/plugins/tpm
    - user: {{ user_info('name') }}
    - rev: master
    - require:
      - sls: dev.git

install tmux:
  pkg.latest:
    - name: tmux

install tmux plugins requirements:
  pkg.latest:
    - pkgs:
      - xsel

create .tmux.conf in {{ user_info('name') }}:
  file.managed:
    - name: {{ user_info('home') }}/.tmux.conf
    - source: salt://tmux/files/tmux.conf
    - user: {{ user_info('uid') }}
    - group: {{ user_info('gid') }}
