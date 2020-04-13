# Include the right state depending on OS flavor

include:
  - ballot-formula.common
  - ballot-formula.desktop.{{ grains['os'] }}
  - ballot-formula.dev.git
  - ballot-formula.dev.golang
  - ballot-formula.dev.python
  - ballot-formula.dev.shell
  - ballot-formula.docker
  - ballot-formula.editors
  - ballot-formula.terminal
  - ballot-formula.tmux
