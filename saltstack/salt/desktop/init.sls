# Include the right state depending on OS flavor

include:
  - editors
  - dev.git
  - dev.shell
  - dev.python
  #- dev.go
  - docker
  - desktop.{{ grains['os'] }}
