# Include the right state depending on OS flavor

include:
  - common
  - editors
  - dev.git
  - dev.shell
  - dev.python
  - dev.golang
  - docker
  - desktop.{{ grains['os'] }}
