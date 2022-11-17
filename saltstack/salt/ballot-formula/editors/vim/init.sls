# Vim configuration
#

include:
  - ...fonts
  - .dotfiles
#  - editors.vim.completion
  - .{{grains['os'] }}
  - .vundle


install vim:
  pkg.latest:
    - name : vim
