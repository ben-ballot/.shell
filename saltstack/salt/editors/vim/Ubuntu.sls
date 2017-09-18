#
# Set specific stuff for Ubuntu
#

include:
  - editors.vim

configure ppa for vim 8.0:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/jonathonf/vim/ubuntu {{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/vim-8.0.list
    - dist: devel
    - clean_file: True
    - require_in:
      - pkg: install vim

add ctags package:
  pkg.installed:
    - names:
      - exuberant-ctags
      - pandoc
