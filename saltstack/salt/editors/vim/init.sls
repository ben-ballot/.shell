# Vim configuration
#

include:
  - fonts
  - editors.vim.dotfiles
  - editors.vim.vundle
  - editors.vim.completion
  - editors.vim.{{grains['os'] }}


install vim:
  pkg.latest:
    - name : vim
    - skip_verify: True
