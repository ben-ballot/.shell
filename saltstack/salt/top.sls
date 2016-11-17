base:
  '*':
    - common

  'roles:desktop':
    - match: grains
    - desktop

  'roles:server':
    - match: grain
    - docker
