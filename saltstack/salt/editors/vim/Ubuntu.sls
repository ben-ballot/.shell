#
# Set specific stuff for Ubuntu
#

include:
  - editors.vim

configure ppa for vim 8.0:
  pkgrepo.managed:
    - ppa: jonathonf/vim
    - require_in:
      - pkg: install vim

add ctags package:
  pkg.installed:
    - names:
      - exuberant-ctags
      - pandoc
