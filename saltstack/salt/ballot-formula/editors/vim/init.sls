# Vim configuration
#

include:
  - ballot-formula.fonts
  - ballot-formula.editors.vim.dotfiles
  - ballot-formula.editors.vim.completion
  - ballot-formula.editors.vim.{{grains['os'] }}
#  - editors.vim.vundle


install vim:
  pkg.latest:
    - name : vim
