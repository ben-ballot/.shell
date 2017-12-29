base:
  '*':
    - common

  'roles:desktop':
    - match: grain
    - desktop

  'roles:server':
    - match: grain
    - docker
