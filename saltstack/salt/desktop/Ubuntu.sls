# Include all Ubuntu related stuff for a desktop

{%- from 'user/info.sls' import user_info with context %}
{%- set terminology_src = user_info('home') ~ "/git/github.com/terminology" %}

setup multiverse:
  pkg.installed:
    - name: software-properties-common
  cmd.run:
    - name: add-apt-repository multiverse
    - require:
      - pkg: setup multiverse

desktop packages:
  pkg.installed:
    - pkgs:
      - acpi
      - chromium-browser
      - dconf-editor
      - network-manager-openvpn
      - terminator
      - vim-gtk

install zim:
  pkg.installed:
    - pkgs:
      - zim
      - python-gtksourceview2

# clone and compile terminology:
#   pkg.installed:
#     - pkgs:
#       - e17-dev
#       - libelementary-dev
#   file.directory:
#     - name: {{ user_info('home') }}/git/github.com
#     - user: {{ user_info('uid') }}
#     - group: {{ user_info('gid') }}
#     - recurse:
#       - user
#       - group
#   git.latest:
#     - name: https://github.com/billiob/terminology
#     - target: {{ terminology_src }}
#     - user: {{ user_info('name') }}
#     - rev: master
#     - require:
#       - file: clone and compile terminology
#   cmd.run:
#     - name: "pwd; ./autogen.sh --prefix=/usr/local && make"
#     - timeout: 600
#     - runas: {{ user_info('name') }}
#     - cwd: {{ terminology_src }}
#     - onchanges:
#       - git: clone and compile terminology
#
# instal terminology:
#   cmd.run:
#     - name: make install
#     - cwd: {{ terminology_src }}
#     - onchanges:
#       - cmd: clone and compile terminology
#       - pkg: clone and compile terminology
