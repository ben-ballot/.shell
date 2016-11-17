# Handle fontconfig

{%- from 'user/info.sls' import user_info with context %}

include:
  - dev.git

install fontconfig:
  pkg.installed:
    - name: fontconfig

clone powerline:
  git.latest:
    - name: https://github.com/powerline/fonts.git
    - target: {{ user_info('home') }}/.powerline
    - user: {{ user_info('name') }}
    - require:
      - pkg: install git

install fonts:
  cmd.run:
    - name: {{ user_info('home') }}/.powerline/install.sh
    - runas: {{ user_info('name') }}
    - onchanges:
      - git: clone powerline

update font cache:
  cmd.run:
    - name: fc-cache -vf {{ user_info('home') }}/.local/share/fonts
    - runas: {{ user_info('name') }}
    - onchanges:
      - cmd: install fonts


