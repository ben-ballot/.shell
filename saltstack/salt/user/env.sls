# Update this git repository
#

{%- from 'user/info.sls' import user_info with context %}

include:
  - dev.git
  - dev.git.github_com

clone .shell:
  git.latest:
    - name: https://github.com/darkalia/.shell.git
    - target: {{ user_info('home') }}/.shell
    - user: {{ user_info('name') }}
