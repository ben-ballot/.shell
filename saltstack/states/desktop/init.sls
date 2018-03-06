# Include the right state depending on OS flavor

include:
  - common
  - desktop.{{ grains['os'] }}
  - dev.git
  - dev.golang
  - dev.python
  - dev.shell
  - docker
  - editors
  - hipchat
  - terminal
  - tmux
