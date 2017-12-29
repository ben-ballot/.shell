# Include all Ubuntu related stuff for a desktop

{%- from 'user/info.sls' import user_info with context %}
{%- set terminology_src = user_info('home') ~ "/git/github.com/terminology" %}

setup multiverse:
  pkg.installed:
    - name: software-properties-common
  cmd.run:
    - name: add-apt-repository multiverse
    - onchanges:
      - pkg: setup multiverse

desktop packages:
  pkg.installed:
    - pkgs:
      - network-manager-openvpn
      - vim-gui-common

install zim:
  pkg.installed:
    - pkgs:
      - zim
      - python-gtksourceview2
